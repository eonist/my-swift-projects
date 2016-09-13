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
        //mirror.
        mirror.children.forEach{
            if let name = $0.label{/*label is actually optional comming from mirror, belive it or not*/
                properties.append((name,$0.value))
            }
        }
        return properties
    }
    
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
        func handleArray<T>(inout theXML:XML,_ theContent:Any,_ type:T.Type){
            Swift.print("handleArray")
            for item in theContent as! Array<T>{
                Swift.print("item: " + "\(item)")
                Swift.print("item.dynamicType: " + "\(item.dynamicType)")
               if let string = String(item) ?? nil{
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
        
        let properties = Reflection.reflect(instance)
        properties.forEach{
            if ($0.value is NSArray){/*array*/
                Swift.print("found array")
                
                //handleArray(&xml,$0.value,($0.value as! Array).dynamicType.Element().dynamicType)
            }else if let string = String($0.value) ?? nil{/*all other values*///<-- must be convertible to string i guess
                Swift.print("found value")
                xml[$0.label] = string/*add value as an attribute, because only one unique key,value can exist*/
            }else{
                fatalError("unsuported type: " + "\($0.value.dynamicType)")
            }
        }
        
        
        //recursive
        //if type of property is array
        //recursive
        
        return xml
    }
}


/*
can come in handY:

public var isClass: Bool {
return mirror.objectIdentifier != nil
}

public var isStruct: Bool {
return mirror.objectIdentifier == nil
}

*/