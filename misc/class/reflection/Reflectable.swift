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
        //<Selector>
            //<element>Button</element>
            //<id>Button</id>
            //<states>
                //<String>over</String>
            //</states>
            //<classIds></classIds>
        //</Selector>
    //</Selectors>
    func toXML(instance:Any/*Reflectable*/)->XML{
        let xml:XML = XML()
        //find name of instance class
        let instanceName:String = String(instance.dynamicType)//if this doesnt work use generics
        print(instanceName)
        
        func handleArray(theXML:XML,_ theContent:NSArray){
            for item in theContent{
                if(item is String){
                    theXML.stringValue = item as? String
                }else if(item is Dictionary<String, AnyObject>){/*handle dictionary here*/
                    theXML.appendChild(toXML(item))/*<--recursive*/
                }else{/*array*/
                    fatalError("this can't happen")
                }
            }
        }
        
        //if instance is Reflectable
        if let reflectable = instance as? Reflectable{/*content is a Reflectable*/
            //find name of property instance class
            reflectable.properties().forEach{
                if let reflectable = $0.value as? Reflectable{/*Reflectable*/
                    xml.name = $0.label
                    xml.appendChild(toXML(reflectable))/*<--recursive*/
                }else if let array = $0.value as? NSArray{/*array*/
                    xml.name = $0.label
                    handleArray(xml,array)
                }else if let string = String($0.value) ?? nil{/*all other values*/
                    xml[$0.label] = string//<-- must be convertible to string i guess
                }else{
                    fatalError("unsuported type: " + "\($0.value.dynamicType)")
                }
            }
            
            reflectable.properties().forEach{print(String($0.value.dynamicType))}
        }
        
        
            //recursive
        //if type of property is array
            //recursive
        
        return XML()
    }
}
