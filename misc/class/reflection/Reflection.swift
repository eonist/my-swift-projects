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
    static func toXML(instance:Any)->XML{
        var xml:XML = XML()
        //find name of instance class
        let instanceName:String = String(instance.dynamicType)//if this doesnt work use generics
        //print(instanceName)
        xml.name = instanceName
        func handleValue(inout theXML:XML,_ value:Any,_ name:String){
            Swift.print("handleValue:" + " name \(name)" + "value: \(value)" )
            let child = XML()
            child.name = name
            child["type"] = String(value.dynamicType)
            let string:String = String(value)
            child.stringValue = string/*add value*/
            theXML.appendChild(child)
        }
        func handleArray(inout theXML:XML,_ theContent:Any,_ name:String){
            Swift.print("handleArray: " + "name \(name)" + "$0.value: \(theContent)" )
            var arrayXML = XML()
            arrayXML.name = name
            arrayXML["type"] = "Array"
            let properties = Reflection.reflect(theContent)
            properties.forEach{
                
                //continue here: figure out how to assert if a value is convertable to a string
                //also make a handleValue method, as it stands now, the same code is in two places. The name should be an argument since its the only thing that is different
                
                if let string = String($0.value) ?? nil{/*<--asserts if the value can be converted to a string*/
                    Swift.print("$0.label: " + "\($0.label)")
                    let child = XML()
                    child.name = "item"
                    child.stringValue = string/*add value */
                    child["type"] = String($0.value.dynamicType)
                    arrayXML.appendChild(child)
                }else if($0.value is AnyArray){/*array*/
                    handleArray(&arrayXML,$0.value,$0.label)
                }else{
                    fatalError("unsuported type: " + "\($0.value.dynamicType)")
                }
            }
            theXML.appendChild(arrayXML)
        }
        let properties = Reflection.reflect(instance)
        properties.forEach{
            if ($0.value is AnyArray){/*array*/
                
                handleArray(&xml,$0.value,$0.label)
            }else if (String($0.value) != nil){/*all other values*///<-- must be convertible to string i guess
                handleValue(&xml,$0.value,$0.label)
            }else{
                fatalError("unsuported type: " + "\($0.value.dynamicType)")
            }
        }
        return xml
    }
}