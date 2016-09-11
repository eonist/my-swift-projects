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
        
        //if instance is Reflectable
        if let reflectable = instance as? Reflectable{/*content is a Reflectable*/
            //find name of property instance class
            
            reflectable.properties().forEach{
                if($0.value is Reflectable){/*Reflectable*/
                    xml.name = $0.label
                    xml.appendChild(toXML($0.value))/*<--recursive*/
                }else if($0.value){
                    xml.name = $0.label
                    //handleArray(xml,$0.value)
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
