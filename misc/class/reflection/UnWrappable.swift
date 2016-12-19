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
 * TODO: Contemplate: Renaming everything to Fold/UnFold ? Wrap/UnWrap ?
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
     * IMPORTANT: type is not important anymore since we use T, When a variable is of type Any, we should handle this in the unwrap method pertaining to the specific Class
     */
    static func unWrap<T:UnWrappable>(xml:XML,_ key:String) -> T?{
        //Swift.print("Unwrappable.unWrap() key: " + "\(key)")
        //let type:String = xml.firstNode(key)!["type"]!/*<--type not important anymore since we use T, actually, what if the type is Any*/
        //Swift.print("type: " + "\(type)")
        if(xml.firstNode(key) != nil){
            if(xml.hasSimpleContent){/*<--simple node content: Text*/
                let value:String = xml.firstNode(key)!.value/*<--first child node that has the key*/
                return T.unWrap(value)//<--use T to your advantage when converting the value (A protocol extension switch, polymorphism)
            }else if(xml.hasComplexContent){/*<--complex node:Has child nodes*/
                let child = xml.firstNode(key)!
                return child.hasComplexContent ? T.unWrap(child) : child.hasSimpleContent ? T.unWrap(child.value) : nil
            }
        }
        return nil
    }
    /**
     * For arrays (doesn't work with Array<Any> only where the type is known)
     */
    static func unWrap<T:UnWrappable>(xml:XML,_ key:String) -> [T?]{
        var array:[T?] = [T?]()
        let child:XML = xml.firstNode(key)!//<--this should probably be asserted first, but should we return nil or empty array then?
        if(child.childCount > 0){
            XMLParser.children(child).forEach{
                array.append($0.hasSimpleContent ? T.unWrap($0.value) : T.unWrap($0) )//$0.hasComplexContent ? .. : nil
            }
        }
        return array
    }
    /**
     * Dictionary
     */
    static func unWrap<T:UnWrappable>(xml:XML,_ key:String) -> [T:T?]{
        var dictionary:[T:T?] = [:]
        let child:XML = xml.firstNode(key)!
        if(child.childCount > 0){
            XMLParser.children(child).forEach{
                let key:T = T.unWrap($0.children!.first)
                let value:T = T.unWrap()
                $0.children?.last
                dictionary[""]
                T.unWrap($0)
                    //.append($0.hasSimpleContent ? T.unWrap($0.value) :  )//$0.hasComplexContent ? .. : nil
            }
        }
        return dictionary
    }
    /**
     *
     */
    static func unwrapDictItem(){
        
    }
}
