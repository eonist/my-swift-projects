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
    /*
    
    //final xml:
    
    <Selector>
        <id type=String>custom</id>
        <element type=String>Button</element>
        <classIds type=Array></classIds>
        <states type="Array">
            <1 type=string>over</1>
            <2 type=string>down</2>
        </states>
    </Selector>
    
    */
    /**
     *
     */
    static func toXML(instance:Any)->XML{
        var xml:XML = XML()
        //find name of instance class
        let instanceName:String = String(instance.dynamicType)//if this doesnt work use generics
        print(instanceName)
        xml.name = instanceName
        func handleArray(inout theXML:XML,_ theContent:Any,_ name:String){
            Swift.print("handleArray: " + "\(name)")
            var arrayXML = XML()
            arrayXML.name = name
            let properties = Reflection.reflect(theContent)
            properties.forEach{
               if let string = String($0.value) ?? nil{
                    Swift.print("$0.label: " + "\($0.label)")
                    let child = XML()
                    child.name = String($0.value.dynamicType)
                    child.stringValue = string/*add value */
                    arrayXML.appendChild(child)
                }else if($0.value is NSArray){/*array*/
                    handleArray(&arrayXML,$0.value,$0.label)
                }else{
                    fatalError("unsuported type: " + "\($0.value.dynamicType)")
                }
            }
            theXML.appendChild(arrayXML)
        }
        let properties = Reflection.reflect(instance)
        properties.forEach{
            if ($0.value is NSArray){/*array*/
                Swift.print("found array: " + "\($0.value)" + " $0.label " + "\($0.label)")
                handleArray(&xml,$0.value,$0.label)
            }else if let string = String($0.value) ?? nil{/*all other values*///<-- must be convertible to string i guess
                Swift.print("found value: " + "\($0.value)" + " $0.label " + "\($0.label)")
                let child = XML()
                child.name = $0.label
                xml["type"] = String($0.value.dynamicType)
                child.stringValue = string/*add value*/
                xml[$0.label] = string/*add value as an attribute, because only one unique key,value can exist*/
            }else{
                fatalError("unsuported type: " + "\($0.value.dynamicType)")
            }
        }
        return xml
    }
}