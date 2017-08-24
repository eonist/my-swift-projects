import Cocoa
/**
 * Reflection converts from (Class / Struct) to XML
 * NOTE: XML is used as the storage syntax. JSON could be used but there was no apparent benefit so XML it is
 * NOTE: JSON can be implimented with not to much effort, but supporting both XML and JSON is more work than it's worth at the moment
 * TODO: ⚠️️ Try make it more generic?
 */
class Reflect {
    /**
     * IMPORTANT: ⚠️️ Does not work with computed properties like: var something:String{return ""}
     * IMPORTANT: ⚠️️ Does not work with methods
     * IMPORTANT: ⚠️️ only works with regular variables
     * NOTE: some limitations with inheritance (basially it doesn't work with inheritance, it won't grab the variables of subClasses, it works for variables in the super type)
     * NOTE: inheritance can be supported , by traversing down the hirarchy via: mirror.superclassMirror() see: http://stackoverflow.com/a/36721639/5389500
     * NOTE: works with struct and class
     * NOTE: Mirror(reflecting: vc).displayStyle == .Class // to differentiate struct and class etc
     * IMPORTANT: ⚠️️ swift 3 update on the bellow line, basically Array items doesn't have a lable anymore used to be 0,1,2,3 etc
     */
    static func reflect(_ instance:Any)->[(label:String,value:Any)]{//<---Should this method be private? as toXML is the primary method in this class
        var properties = [(label:String,value:Any)]()/*<--Array of Duplets with lable and value*/
        let mirror = Mirror.init(reflecting: instance)
        mirror.children.forEach{
            let name:String = $0.label ?? ""/*label is actually optional comming from mirror, belive it or not*/
            properties.append((name,$0.value))
        }
        if let parent = mirror.superclassMirror{
            parent.children.forEach{
                if let name:String = $0.label{/*label is actually optional comming from mirror, belive it or not*/
                    properties.append((name,$0.value))
                }
            }
        }
        return properties
    }
    /**
     * Converts an instance to XML
     * NOTE: This is a general solution for saving the state of a class/struct instance
     * NOTE: Supports infinitly deep class structures
     * CAUTION: make sure the class doesnt ref it self etc, infinte loops
     * EXAMPLE output:
     * <Selector>
     *     <id type=String>custom</id>
     *     <element type=String>Button</element>
     *     <classIds type=Array></classIds>
     *     <states type="Array">
     *         <item type=string>over</item>
     *         <item type=string>down</item>
     *     </states>
     * </Selector>
     */
    static func toXML(_ value:Any)->XML{
        return Utils.handleValue(value)
    }
}
private class Utils{
    /**
     * Custom types like StyleProperty or Selector
     * PARAM: value (will never be nil directly, can be Optional(nil) which is something mirror uses)
     */
    static func handleValue(_ value:Any,_ name:String? = nil)->XML{
        var xml = XML()
        let objectType:String = "\(type(of: value))"/*⚠️️ if this doesn't work use generics*/
        if name != nil {
            xml["type"] = objectType
        }
        xml.name = name != nil ? name! : objectType/*the name of instance class*/
        if "\(value)" == "nil" || "\(value)" == "Optional(nil)" {/*Nil is not nil when mirroring. So you can't do value != nil. Casting to string is a workaround for this*/
            let classTypeStr:String = extractClassType(value)
            xml["type"] = classTypeStr
        }else{
            let properties = Reflect.reflect(value)
            properties.forEach{
                handleProperty(&xml,$0.label,$0.value)
            }
        }
        return xml
    }
    /**
     * NOTE: We keep the common code here, for array you pass "item", don't implement it yet until its tested
     * NOTE: handleDict and handleValue should use this method, handleArray will use it in the future
     */
    static func handleProperty(_ xml:inout XML, _ label:String, _ value:Any){
        switch value {
        case is AnyArray:/*array*/
            xml += handleArray(value,label)
        case is AnyDictionary:/*dictionary*/
             xml += handleDictionary(value,label)
        case is Reflectable:
            xml += handleReflectable(value as! Reflectable,label)
        case _ where stringConvertiable(value):/*<--asserts if the value can be converted to a string*/
            xml += handleBasicValue(value,label)
        case _ where CFGetTypeID(value as AnyObject) == CGColor.typeID://CGColor isn't easily assertable as a type, this is a workaround for this problem
            xml += handleReflectable(value as! CGColor,label)
        default:
            xml += handleValue(value,label)
        }
    }
    /**
     * Reflectable values
     */
    static func handleReflectable(_ reflectable:Reflectable,_ name:String)->XML{
        let type:String = reflectable.reflection.type
        let value:String = reflectable.reflection.value
        let xml = XML()
        xml.name = name
        xml["type"] = type
        xml.stringValue = value/*add value*/
        return xml
    }
    /**
     * Basic value types
     */
    static func handleBasicValue(_ value:Any,_ name:String)->XML{/*handleStringConvertibleValue*/
        //Swift.print("handleBasicValue:  name \(name) value-type: \(value.dynamicType) value: \(value) " )
        let xml = XML()
        xml.name = name 
        xml["type"] = basicValueType(value)
        xml.stringValue = basicValue(value)/*add value*/
        return xml
    }
    static func basicValue(_ value:Any)->String{
        let string:String = "\(value)"
        return string
    }
    static func basicValueType(_ value:Any)->String{
        var type:String = ClassParser.stringType(value)
        type = type == String(describing: Double.self) ? String(describing: CGFloat.self) : type//<-temp fix, seems mirror can't get the correct type when Any is a cgFloat it will return Double, this isnt pretty, but since we dont use any Doubles it might work for now
        return type
    }
    /**
     * Array types
     * TODO: ⚠️️⚠️️⚠️️ Use the handleProperty method instead of the switch bellow. its the same thing
     */
    static func handleArray(_ value:Any,_ name:String)->XML{
        let xml = XML()
        xml.name = name
        xml["type"] = "Array"
        let properties = Reflect.reflect(value)
        properties.forEach{
            switch $0.value{
            case is Reflectable:/*The type implements custom reflection*/
                xml += handleReflectable($0.value as! Reflectable,"item"/*$0.label*/)
            case _ where stringConvertiable($0.value) :/*<--asserts if the value can be converted to a string*/
                 xml += handleBasicValue($0.value,"item")
            case is AnyArray:/*array*/
                xml += handleArray($0.value,$0.label)//<--should this also be: "item" as label in an array is always [0],[1] etc
            case is AnyDictionary:/*dictionary*/
                xml += handleDictionary($0.value,$0.label)//<--should this also be: "item" as label
            case _ where CFGetTypeID($0.value as AnyObject) == CGColor.typeID :
                xml += handleReflectable($0.value as! CGColor,"item")
            default:/*all other cases*/
               xml += handleValue($0.value)
            }
        }
        return xml
    }
    /**
     * Handles Dictionary types
     * NOTE: Dictionary keys are always Hashable, but are in most cases Int or String
     * NOTE: since Dictionary<Hashable,Any> can be many different types we must keep value and key in seperate nodes, see example bellow:
     * EXAMPLE:
     * <someDict type=Dictionary>
     *    <item>
     *       <value type="String">some value<value>
     *       <key type="Int">3<key>
     *    </item>
     * <someDict>
     */
    static func handleDictionary(_ value:Any,_ name:String) -> XML{
        let xml = XML()
        xml.name = name.count > 0 ? name : "item"
        xml["type"] = "Dictionary"
        let properties = Reflect.reflect(value)
        properties.forEach{
            xml += dictionaryItem($0.value)
        }
        return xml
    }
    /**
     * Handles individual Dictionary items
     */
    static func dictionaryItem(_ value:Any) -> XML{
        var xml = XML()
        xml.name = "item"
        let dictKeyValuePair:[(label:String,value:Any)] = Reflect.reflect(value)
        let key = dictKeyValuePair[0].value
        let val = dictKeyValuePair[1].value
        handleProperty(&xml, "key", key)
        handleProperty(&xml, "value", val)
        return xml
    }
    /**
     * Extracts CGAffineTransform from: Optional<CGAffineTransform>
     * NOTE: only use this for Optional values that are nil
     */
    static func extractClassType(_ value:Any)->String{
        let str:String = ClassParser.stringType(value)
        let arr1 = str.characters.split{$0 == "<"}.map(String.init)
        let arr2 = arr1[1].characters.split{$0 == ">"}.map(String.init)
        return arr2[0]
    }
    /**
     * Asserts if the PARAM value is a basic type
     * TODO: Write an assert utility method that takes types and asserts true pr false for an instance
     */
    static func stringConvertiable(_ val:Any)->Bool{
        return val is Int || val is UInt || val is CGFloat || val is String || val is Double || val is Float || val is Bool
    }
}
