import Cocoa
//Continue here: what you do is that you extend the Types you want to unWrap.
//And use inference similar to the way you made that cast method.
//For more complex types see if they them selfs are UnWrappable. NICE!
/**
 * NOTE: Using init with extension, protocol and classes is a bit troublesome. So a method is used instead of init
 */
protocol UnWrappable {
    static func unWrap<T>(xml:XML) -> T?//add to custom classes
    static func unWrap<T:UnWrappable>(xml:XML,_ key:String) -> T?//used to unWrap values
    static func unWrap<T>(value:String) -> T?
}
extension UnWrappable{
    static func unWrap<T>(xml:XML) -> T?{
        return nil//override in subClass
    }
    static func unWrap<T>(value:String) -> T? {
        return nil//override in subClass
    }
    /**
     * NOTE: looks at the type and converts that the value into a type
     */
    static func unWrap<T:UnWrappable>(xml:XML,_ key:String) -> T?{
        if(xml.childCount == 0 || xml.value.count == 0){//return nil if the node has no value and no subNodes
            return nil
        }
        //let type:String = xml.firstNode(key)!["type"]!//<-- type not important anymore since we use T
        let value:String = xml.firstNode(key)!.value
        Swift.print("value: " + "\(value)")
        return unWrap(value)//use T to your advantage when converting the value (A protocol extension switch, polymorphism)
    }
}
extension CGFloat:UnWrappable{
    static func unWrap<T>(value:String) -> T? {
        return value.cgFloat as? T
    }
}
extension Bool:UnWrappable{
    static func unWrap<T>(value:String) -> T? {
        return value.bool as? T
    }
}
extension NSColor:UnWrappable{
    static func unWrap<T>(value:String) -> T? {
        Swift.print("NSColor.unWrap()")
        return NSColorParser.nsColor(value) as? T
    }
}



/*
old code:

switch(true) {
case type == "String":return value as? T
case type == "CGFloat":return value.cgFloat as? T
case type == "Double":return value.double as? T
case type == "Int":return value.int as? T
case type == "UInt":return value.uint as? T
case type == "Bool":return value.bool as? T
case type == "DropShadow":return value as? T
//if T is UNWrappable then (T as unwrappaple).unwrap(xml)
//TODO: add the types above to extensions instead
default : fatalError("TYPE NOT SUPPORTED: " + "\(type)" + " value: " + "\(value)")
}

*/
