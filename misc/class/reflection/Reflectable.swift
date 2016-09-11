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
        //<Selector element="" id="">
            //<states>
                //<String>over</String>
            //</states>
            //<classIds></classIds>
        //</Selector>
    //</Selectors>
    func toXml(instance:Any/*Reflectable*/)->XML{
        //find name of instance class
        let instanceName:String = String(instance.dynamicType)//if this doesnt work use generics
        print(instanceName)
        
        //if instance is Reflectable
        if let reflectable = instance as? Reflectable{/*content is a Reflectable*/
            //find name of property instance class
            
            for (key,value) in dict{
                if(value is String) {xml[key] = value as? String}/*attributes*/
                else if(value is Dictionary<String, AnyObject>){/*dictionary*/
                    xml.name = key
                    xml.appendChild(toXML(value))/*<--recursive*/
                }else {
                    xml.name = key;
                    handleArray(xml,value)
                }/*array*/

            }
            reflectable.properties().forEach{print(String($0.value.dynamicType))}
        }
        
        
            //recursive
        //if type of property is array
            //recursive
        
        return XML()
    }
}
