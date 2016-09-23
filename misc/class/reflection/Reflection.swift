import Cocoa

class Reflection {
    /**
     * NOTE: does not work with computed properties like: var something:String{return ""}
     * NOTE: does not work with methods
     * NOTE: only works with regular variables
     * NOTE: some limitations with inheritance (basially i doesnt work with inheritance, it won't grab the variables of subClasses, it works for variables in the super type)
     * NOTE: inheritance can be supported , by traversing down the hirarchy via: mirror.superclassMirror() see: http://stackoverflow.com/a/36721639/5389500
     * NOTE: works with struct and class
     */
    static func reflect(instance:Any)->[(label:String,value:Any)]{
        var properties = [(label:String,value:Any)]()//<--Array of Duplets with lable and value
        let mirror = Mirror(reflecting: instance)
        Swift.print("mirror: " + "\(mirror)")
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
     */
    class func handleValue(value:Any)->XML{
        let xml = XML()
        let instanceName:String = String(value.dynamicType)//if this doesnt work use generics
        Swift.print("handleValue:" + " instanceName \(instanceName)" + " value: \(value)" )
        //print(instanceName)
        xml.name = instanceName//the name of instance class
        let properties = Reflection.reflect(value)
        //Swift.print("properties.count: " + "\(properties.count)")
        
        properties.forEach{
            if ($0.value is AnyArray){/*array*/
                xml += handleArray($0.value,$0.label)
            }else if($0.value is Reflectable || CFGetTypeID($0.value as! AnyObject) == CGColorGetTypeID()){
                xml += handleReflectable($0.value as! Reflectable,$0.label)
            }else if (stringConvertiable($0.value)){/*all other values*///<-- must be convertible to string i guess
                xml += handleBasicValue($0.value,$0.label)
            }else{
                xml += handleValue($0.value)
                //fatalError("unsuported type: " + "\($0.value.dynamicType)")
            }
        }
        return xml
    }
    /**
     * Reflectable values
     */
    static func handleReflectable(reflectable:Reflectable,_ name:String)->XML{
        let value:String = reflectable.reflection.value
        let type:String = reflectable.reflection.type
        Swift.print("handleReflectable:" + " name \(name)" + "value: \(value)" + " Type: \(type)" )
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
        Swift.print("handleBasicValue:" + " name \(name)" + "value: \(value)" )
        let xml = XML()
        xml.name = name
        xml["type"] = String(value.dynamicType)
        let string:String = String(value)
        xml.stringValue = string/*add value*/
        return xml
    }
    /**
     * Array types
     */
    static func handleArray(value:Any,_ name:String)->XML{
        Swift.print("handleArray: " + "name \(name)" + " $0.value: \(value)" )
        let xml = XML()
        xml.name = name
        xml["type"] = "Array"
        let properties = Reflection.reflect(value)
        properties.forEach{
            if($0.value is Reflectable){
                xml += handleReflectable($0.value as! Reflectable,$0.label)
            }else if (stringConvertiable($0.value)){/*<--asserts if the value can be converted to a string*/
                xml += handleBasicValue($0.value,"item")
            }else if($0.value is AnyArray){/*array*/
                xml += handleArray($0.value,$0.label)
            }else{
                xml += handleValue($0.value)
                //fatalError("unsuported type: " + "\($0.value.dynamicType)")
            }
        }
        return xml
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