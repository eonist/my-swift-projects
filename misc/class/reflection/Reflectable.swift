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
    func xml(instance:Any)->XML{
        //find name of instance class
        //find name of property instance class
        //if instance is Reflectable
            //recursive
        //if type of property is array
            //recursive
        
        return XML()
    }
}
