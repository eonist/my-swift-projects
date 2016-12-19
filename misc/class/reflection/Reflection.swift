import Cocoa
/**
 * NOTE: XML is used as the storage syntax. JSON could be used but there was no apparent benefit so XML it is
 * NOTE: JSON can be implimented with not to much effort, but supporting both XML and JSON is more work than it's worth at the moment
 */
class Reflection {
    /**
     * IMPORTANT: Does not work with computed properties like: var something:String{return ""}
     * IMPORTANT: Does not work with methods
     * IMPORTANT: only works with regular variables
     * NOTE: some limitations with inheritance (basially it doesn't work with inheritance, it won't grab the variables of subClasses, it works for variables in the super type)
     * NOTE: inheritance can be supported , by traversing down the hirarchy via: mirror.superclassMirror() see: http://stackoverflow.com/a/36721639/5389500
     * NOTE: works with struct and class
     */
    static func reflect(instance:Any)->[(label:String,value:Any)]{//<---Should this method be private? as toXML is the primary method in this class
        var properties = [(label:String,value:Any)]()//<--Array of Duplets with lable and value
        let mirror = Mirror(reflecting: instance)
        //Swift.print("mirror: " + "\(mirror)")
        mirror.children.forEach{
            if let name = $0.label{/*label is actually optional comming from mirror, belive it or not*/
                properties.append((name,$0.value))
            }
        }
        if let parent = mirror.superclassMirror(){
            parent.children.forEach{
                if let name = $0.label{/*label is actually optional comming from mirror, belive it or not*/
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
    static func toXML(value:Any)->XML{
        return Utils.handleValue(value)
    }
}
private class Utils{
    /**
     * Custom types like StyleProperty or Selector
     * PARAM: value (will never be nil directly, can be Optional(nil) which is something mirror uses)
     */
    static func handleValue(value:Any,_ name:String? = nil)->XML{
        var xml = XML()
        let objectType:String = String(value.dynamicType)//if this doesn't work use generics
        //Swift.print("handleValue(): name: \(name) objectType \(objectType) value: \(value)")
        if(name != nil){
            xml["type"] = objectType
        }
        //print(instanceName)
        xml.name = name != nil ? name! : objectType/*the name of instance class*/
        if(String(value) == "nil" || String(value) == "Optional(nil)"){//Nil is not nil when mirroring. So you can't do value != nil. Casting to string is a workaround for this
            xml["type"] = extractClassType(value)
        }else{
            let properties = Reflection.reflect(value)
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
    class func handleProperty(inout xml:XML, _ label:String, _ value:Any){
        if (value is AnyArray){/*array*/
            xml += handleArray(value,label)
        }else if (value is AnyDictionary){/*dictionary*/
            xml += handleDictionary(value,label)
        }else if(value is Reflectable){
            xml += handleReflectable(value as! Reflectable,label)
        }else if (stringConvertiable(value)){/*<--asserts if the value can be converted to a string*/
            xml += handleBasicValue(value,label)
        }else if((value as? AnyObject != nil && CFGetTypeID(value as! AnyObject) == CGColorGetTypeID())){//CGColor isnt easily assertable as a type, this is a workaround for this problem
            xml += handleReflectable(value as! CGColorRef,label)
        }else{
            xml += handleValue(value,label)
            //fatalError("unsuported type: " + "\($0.value.dynamicType)")
        }
    }
    /**
     * Reflectable values
     */
    static func handleReflectable(reflectable:Reflectable,_ name:String)->XML{
        //Swift.print("handleReflectable")
        let type:String = reflectable.reflection.type
        //Swift.print("type: " + "\(type)")
        let value:String = reflectable.reflection.value
        //Swift.print("value: " + "\(value)")
        //Swift.print("handleReflectable:" + " name \(name)" + "value: \(value)" + " Type: \(type)" )
        let xml = XML()
        xml.name = name
        xml["type"] = type
        xml.stringValue = value/*add value*/
        return xml
    }
    /**
     * Basic value types
     */
    static func handleBasicValue(value:Any,_ name:String)->XML{
        //Swift.print("handleBasicValue:  name \(name) value-type: \(value.dynamicType) value: \(value) " )
        let xml = XML()
        //Swift.print("create xml")
        xml.name = name 
        let type:String = String(value.dynamicType)
        xml["type"] = type == String(Double) ? String(CGFloat) : type//<-temp fix, seems mirror cant get the correct type when Any is a cgFloat it will return Double, this isnt pretty, but since we dont use any Doubles it might work for now
        let string:String = String(value)
        xml.stringValue = string/*add value*/
        return xml
    }
    /**
     * Array types
     */
    static func handleArray(value:Any,_ name:String)->XML{
        //Swift.print("handleArray: " + "name \(name)" + " $0.value: \(value)" )
        let xml = XML()
        xml.name = name
        xml["type"] = "Array"
        let properties = Reflection.reflect(value)
        properties.forEach{
            if($0.value is Reflectable){/*The type implements custom reflection*/
                //Swift.print("$0.value: " + "\($0.value)")
                xml += handleReflectable($0.value as! Reflectable,"item"/*$0.label*/)
            }else if (stringConvertiable($0.value)){/*<--asserts if the value can be converted to a string*/
                xml += handleBasicValue($0.value,"item")
            }else if($0.value is AnyArray){/*array*/
                xml += handleArray($0.value,$0.label)//<--should this also be: "item" as label in an array is always [0],[1] etc
            }else if ($0.value is AnyDictionary){/*dictionary*/
                xml += handleDictionary($0.value,$0.label)//<--should this also be: "item" as label
            }else if(($0.value as? AnyObject != nil && CFGetTypeID($0.value as! AnyObject) == CGColorGetTypeID())){
                xml += handleReflectable($0.value as! CGColorRef,"item")
            }else{/*all other cases*/
                xml += handleValue($0.value)
                //fatalError("unsuported type: " + "\($0.value.dynamicType)")
            }
        }
        return xml
    }
    /**
     * Dictionary types
     * <Dictionary type:(Int,String)>
     *    <Item key:"0" key-type:"Int" value-type:"String">value of type<Item>
     *    <Item>
     *       <key>3</key>
     *       <key>3</key>
     *    </Item>
     * <Dictionary>
     */
    static func handleDictionary(value:Any,_ name:String) -> XML{
        Swift.print("handleDictionary()")
        var xml = XML()
        xml.name = name
        xml["type"] = "Dictionary"
        let properties = Reflection.reflect(value)
        properties.forEach{
            handleProperty(&xml,$0.label,$0.value)
        }
        properties.forEach{
            //Swift.print("$0.value: " + "\($0.value)")
            //Swift.print("$0.label: " + "\($0.label)")
            //let keyValuePair:[(label:String,value:Any)] = Reflection.reflect($0.value)
            let keyVal:(Any,Any) = $0.value as! (Any,Any)
            
            /*for (key,val) in keyValuePair{
            Swift.print("Val: \(val) Key: \(key)")
            }*/
        }
        return xml
    }
    /**
     * Extracts CGAffineTransform from: Optional<CGAffineTransform>
     * NOTE: only use this for Optional values that are nil
     */
    static func extractClassType(value:Any)->String{
        //Swift.print("extractClassType")
        let arr1 = String(value.dynamicType).characters.split{$0 == "<"}.map(String.init)
        let arr2 = arr1[1].characters.split{$0 == ">"}.map(String.init)
        return arr2[0]
    }
    /**
     * Asserts if the PARAM value is a basic type
     * TODO: Write an assert utility method that takes types and asserts true pr false for an instance
     */
    static func stringConvertiable(val:Any)->Bool{
        //if(val is CGColor){return true}
        if( val is Int || val is UInt || val is CGFloat || val is String || val is Double || val is Float || val is Bool){
            return true
        }else{
            return false
        }
    }
}