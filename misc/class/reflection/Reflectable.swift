import Foundation

protocol Reflectable {
    func properties()->[(label:String,value:Any)]
}
/**
 * NOTE: does not work with computed properties like: var something:String{return ""}
 * NOTE: does not work with methods
 * NOTE: only works with regular variables
 * NOTE: some limitations with inheritance
 * NOTE: works with struct and class
 */
extension Reflectable{
    func properties()->[(label:String,value:Any)]{
        var properties = [(label:String,value:Any)]()
        Mirror(reflecting: self).children.forEach{
            if let name = $0.label{
                properties.append((name,$0.value))
            }
        }
        return properties
    }
    //try to parse an instance into xml:
    
    //<Selectors>
        //<Selector element="Button" id="custom">
            //<states>
                //<String>over</String>
            //</states>
            //<classIds></classIds>
        //</Selector>
    //</Selectors>
    func toXML(instance:Any/*Reflectable*/)->XML{
        var xml:XML = XML()
        //find name of instance class
        let instanceName:String = String(instance.dynamicType)//if this doesnt work use generics
        print(instanceName)
        xml.name = instanceName
        
        func handleArray<T>(inout theXML:XML,_ theContent:Array<T>){
            Swift.print("handleArray")
            for item in theContent{
                Swift.print("item: " + "\(item)")
                Swift.print("item.dynamicType: " + "\(item.dynamicType)")
                if let reflectable = item as? Reflectable{/*Reflectable*/
                    theXML.appendChild(toXML(reflectable))/*<--recursive*/
                }else if let string = String(item) ?? nil{
                    let child = XML()
                    child.name = String(item.dynamicType)
                    child.stringValue = string/*add value */
                    theXML.appendChild(child)
                }else if(item is NSArray){/*array*/
                    fatalError("multi-dimensional array's not supported yet")
                }else{
                    fatalError("unsuported type: " + "\(item.dynamicType)")
                }
            }
        }
        
        //if instance is Reflectable
        if let reflectable = instance as? Reflectable{/*content is a Reflectable*/
            //find name of property instance class
            
            reflectable.properties().forEach{
                if let reflectable = $0.value as? Reflectable{/*Reflectable*/
                    /*xml.name = $0.label*/
                    Swift.print("found Reflectable")
                    xml.appendChild(toXML(reflectable))/*<--recursive*/
                }else if ($0.value is NSArray){/*array*/
                    Swift.print("found array")
                    /*xml.name = $0.label*/
                    handleArray(&xml,$0.value as! Array<_>)
                }else if let string = String($0.value) ?? nil{/*all other values*///<-- must be convertible to string i guess
                    Swift.print("found value")
                    xml[$0.label] = string/*add value as an attribute, because only one unique key,value can exist*/
                }else{
                    fatalError("unsuported type: " + "\($0.value.dynamicType)")
                }
            }
            
            //reflectable.properties().forEach{print(String($0.value.dynamicType))}
        }
        
        
            //recursive
        //if type of property is array
            //recursive
        
        return xml
    }
}
