import Cocoa
/**
 * NOTE: you extend the Types you want to unWrap. And use inference similar to the way you made that cast method.
 * NOTE: Using init with extension, protocol and classes is a bit troublesome. So a method is used instead of init
 * NOTE: We are accessing the classtype and casting it as UNWrappable and then calling unwrap on the correct type (this requires usage of static methods, but its the most elegant)
 * NOTE: For more complex types see if they them selfs are UnWrappable.
 * TODO: Contemplate: Renaming everything to Wrap/UnWrap ? (However: Reflections is considered the name for this)
 */
protocol UnWrappable {
    static func unWrap<T>(_ xml:XML) -> T?
    static func unWrap<T:UnWrappable>(_ xml:XML,_ key:String) -> T?
    static func unWrap<T>(_ value:String) -> T?
    //static func unWrap<T, K>(_ xml:XML,_ key:String)-> [[K:T]?]
}
extension UnWrappable{
    /**
     * This would be similar to an init method (add to custom classes)
     */
    static func unWrap<T>(_ xml:XML) -> T?{
        fatalError("must be overridden in subClass")
    }
    /**
     * Non-nested values (NSColor,Int,CGFloat etc)
     */
    static func unWrap<T>(_ value:String) -> T? {
        fatalError("must be overridden in subClass")
    }
    /**
     * NOTE: used to unWrap nested values (DropShadow)
     * NOTE: looks at the type and converts that the value into a type
     * IMPORTANT: ⚠️️ Type is not important anymore since we use T, When a variable is of type Any, we should handle this in the unwrap method pertaining to the specific Class
     */
    static func unWrap<T:UnWrappable>(_ xml:XML,_ key:String) -> T?{
        guard let child:XML = xml.firstNode(key) else {return nil}//TODO: ⚠️️ Possibly throw error
        if(xml.hasSimpleContent){/*<--simple node content: Text*/
            let value:String = child.value/*<--first child node that has the key*/
            return T.unWrap(value)//<--use T to your advantage when converting the value (A protocol extension switch, polymorphism)
        }else if(xml.hasComplexContent){/*<--complex node:Has child nodes*/
            return child.hasComplexContent ? T.unWrap(child) : child.hasSimpleContent ? T.unWrap(child.value) : nil
        }
        return nil
    }
    /**
     * For arrays (doesn't work with Array<Any> only where the type is known)
     */
    static func unWrap<T:UnWrappable>(_ xml:XML,_ key:String) -> [T?]{
        guard let child:XML = xml.firstNode(key) else{return [T?]()}
        if child.hasChildren {
            return XMLParser.children(xml).map{$0.hasSimpleContent ? T.unWrap($0.value) : T.unWrap($0)}
        }else{
            return [T?]()
        }
    }
    /**
     * Dictionary
     * Returns a Dictionary (key is UnWrappable and Hashable) (value is Unwrappable)
     * TODO: ⚠️️ In the future this method could be simplified by using protcol composition for K and extracting the Dictionary item creation to a new method
     */
    static func unWrap<T, K>(_ xml:XML,_ key:String) -> [K:T] where K:UnWrappable, K:Hashable, T:UnWrappable{
        var dict:[K:T] = [:]
        guard let child:XML = xml.firstNode(key) else {return dict}
        if child.hasChildren {
            dict = XMLParser.children(child).reduce(dict) (acc,child) in {
                let first = $0.children!.first!
                let key:K = K.unWrap(first.stringValue!)!
                let last:XML = $0.children!.last! as! XML/*We cast NSXMLNode to XML*/
                let value:T? = last.hasSimpleContent ? T.unWrap(last.value) : T.unWrap(last)
                dict[key] = value
            }
        }
        return dict
    }
    /**
     * New 
     * TODO: could be called from the method above
     */
    static func unWrapDict<T, K>(_ xml:XML) -> [K:T] where K:UnWrappable, K:Hashable, T:UnWrappable{
        var dictionary:[K:T] = [:]
        xml.children?.forEach {
            let child:XML = $0 as! XML
            let first = child.children!.first!
            let key:K = K.unWrap(first.stringValue!)!
            let last:XML = child.children!.last! as! XML/*we cast NSXMLNode to XML*/
            /* Swift.print("last: " + "\(last)")
             Swift.print("last: " + "\(last.xmlString)")
             Swift.print("last.value: " + "\(last.value)")
             Swift.print("last.hasSimpleContent: " + "\(last.hasSimpleContent)")
             Swift.print("last.hasComplexContent: " + "\(last.hasComplexContent)")
             */
            let value:T? = last.hasComplexContent ?  T.unWrap(last) : T.unWrap(last.value)
            dictionary[key] = value
        }
        return dictionary
    }
    /**
     * Support for Array with Dictionaries like: [Dictionary<String,String>]
     * TODO: You could porbably do this simpler with AnyDictionary
     */
    static func unWrap<T, K>(_ xml:XML,_ key:String)-> [[K:T]?] where K:UnWrappable, K:Hashable, T:UnWrappable{
        let child:XML? = xml.firstNode(key)
        return child?.children?.map {
            let subChild:XML = $0 as! XML
            return unWrapDict(subChild)//$0.hasComplexContent ? .. : nil
        } ?? [[K:T]?]()
    }
}
