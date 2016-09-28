import Cocoa
/**
 * NOTE: you extend the Types you want to unWrap. And use inference similar to the way you made that cast method.
 * NOTE: Using init with extension, protocol and classes is a bit troublesome. So a method is used instead of init
 * NOTE: We are accessing the classtype and casting it as UNWrappable and then calling unwrap on the correct type (this requires usage of static methods, but its the most elegant)
 * NOTE: For more complex types see if they them selfs are UnWrappable.
 */
protocol UnWrappable {
    static func unWrap<T>(xml:XML) -> T?
    static func unWrap<T:UnWrappable>(xml:XML,_ key:String) -> T?
    static func unWrap<T>(value:String) -> T?
}
/**
 * TODO: Contemplace: Renaming everything to Fold/UnFold ? Wrap/UnWrap ?
 */
extension UnWrappable{
    /**
     * This would be similar to an init method (add to custom classes)
     */
    static func unWrap<T>(xml:XML) -> T?{
        fatalError("must be overridden in subClass")
    }
    /**
     * Non-nested values (NSColor,Int,CGFloat etc)
     */
    static func unWrap<T>(value:String) -> T? {
        fatalError("must be overridden in subClass")
    }
    /**
     * NOTE: used to unWrap nested values (DropShadow)
     * NOTE: looks at the type and converts that the value into a type
     * //TODO: Try to find an xml method that can assert complex value or simple value of a node
     */
    static func unWrap<T:UnWrappable>(xml:XML,_ key:String) -> T?{
        //let type:String = xml.firstNode(key)!["type"]!//<-- type not important anymore since we use T, actually, what if the type is Any
        Swift.print("xml.childCount: " + "\(xml.childCount)")
        Swift.print("xml.value.count: " + "\(xml.value.count)")
        
        //Continue here: figure out how to differentiate between simple and complex xml node content and the bellow will work:
        
        if(xml.childCount > 0 && xml.value.count == 0){//complex node:Has child nodes
            return T.unWrap(xml)//<--this could be an infinte loop, be cautiouse
        }else if(xml.value.count > 0 && key.count > 0){//simple node content: Text
            let value:String = xml.firstNode(key)!.value//first child node that has the key
            Swift.print("value: " + "\(value)")
            return value.count > 0 ? T.unWrap(value) : nil//use T to your advantage when converting the value (A protocol extension switch, polymorphism)
        }else if(xml.value.count > 0 && key.count == 0){//<--array items with simple content aka text
            Swift.print("xml.XMLString: " + "\(xml.XMLString)")
            let value:String = xml.stringValue!
            Swift.print("value: " + "\(value)")
            return T.unWrap(value)
        }else{
            return nil//return nil if the node has no value and no subNodes
        }  
    }
    /**
     * For arrays
     */
    static func unWrap<T:UnWrappable>(xml:XML,_ key:String) -> [T?]{
        var array:[T?] = [T?]()
        let child:XML = xml.firstNode(key)!
        if(child.childCount > 0){
            XMLParser.children(child).forEach{
                array.append(unWrap($0, ""))
            }
        }
        return array
    }
}
