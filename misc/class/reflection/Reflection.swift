import Foundation

class Reflection {
    /**
     * NOTE: does not work with computed properties like: var something:String{return ""}
     * NOTE: does not work with methods
     * NOTE: only works with regular variables
     * NOTE: some limitations with inheritance
     * NOTE: works with struct and class
     */
    static func reflect(instance:Any)->[(label:String,value:Any)]{
        var properties = [(label:String,value:Any)]()
        let mirror = Mirror(reflecting: instance)
        mirror.children.forEach{
            if let name = $0.label{/*label is actually optional comming from mirror, belive it or not*/
                properties.append((name,$0.value))
            }
        }
        return properties
    }
    /**
     * Converts an instance to XML
     * NOTE: This is a general solution for saving the state of a class/struct instance
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
        var xml = XML()
        let instanceName:String = String(value.dynamicType)//if this doesnt work use generics
        Swift.print("handleValue:" + " instanceName \(instanceName)" + "value: \(value)" )
        //print(instanceName)
        xml.name = instanceName//the name of instance class
        let properties = Reflection.reflect(value)
        properties.forEach{
            if ($0.value is AnyArray){/*array*/
                Utils.handleArray(&xml,$0.value,$0.label)
            }else if (Utils.stringConvertiable($0.value)){/*all other values*///<-- must be convertible to string i guess
                Utils.handleBasicValue(&xml,$0.value,$0.label)
            }else{
                xml.appendChild(handleValue($0.value))
                //fatalError("unsuported type: " + "\($0.value.dynamicType)")
            }
        }
        return xml
    }
    /**
     * Basic value types
     */
    static func handleBasicValue(inout xml:XML,_ value:Any,_ name:String){
        Swift.print("handleBasicValue:" + " name \(name)" + "value: \(value)" )
        let child = XML()
        child.name = name
        child["type"] = String(value.dynamicType)
        let string:String = String(value)
        child.stringValue = string/*add value*/
        xml.appendChild(child)
    }
    /**
     * Array types
     */
    static func handleArray(inout xml:XML,_ value:Any,_ name:String){
        Swift.print("handleArray: " + "name \(name)" + " $0.value: \(value)" )
        var arrayXML = XML()
        arrayXML.name = name
        arrayXML["type"] = "Array"
        let properties = Reflection.reflect(value)
        properties.forEach{
            if (stringConvertiable($0.value)){/*<--asserts if the value can be converted to a string*/
                handleBasicValue(&arrayXML,$0.value,"item")
            }else if($0.value is AnyArray){/*array*/
                handleArray(&arrayXML,$0.value,$0.label)
            }else{
                arrayXML += handleValue($0.value)
                //fatalError("unsuported type: " + "\($0.value.dynamicType)")
            }
        }
        xml.appendChild(arrayXML)
    }
    /**
     * Asserts if the PARAM value is a basic type
     */
    static func stringConvertiable(val:Any)->Bool{
        return val is Int || val is UInt || val is CGFloat || val is String || val is Double || val is Float || val is Bool
    }
}