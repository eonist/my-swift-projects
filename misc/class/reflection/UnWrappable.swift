import Cocoa
//Continue here: what you do is that you extend the Types you want to unWrap.
//And use inference similar to the way you made that cast method.
//For more complex types see if they them selfs are UnWrappable. NICE!
/**
 * NOTE: Using init with extension, protocol and classes is a bit troublesome. So a method is used instead of init
 * NOTE: We are accessing the classtype and casting it as UNWrappable and then calling unwrap on the correct type (this requires usage of static methods, but its the most elegant)
 */
protocol UnWrappable {
    static func unWrap<T>(xml:XML) -> T?
    static func unWrap<T:UnWrappable>(xml:XML,_ key:String) -> T?
    static func unWrap<T>(value:String) -> T?
}
extension UnWrappable{
    /**
     * This would be similar to an init method (add to custom classes)
     */
    static func unWrap<T>(xml:XML) -> T?{
        fatalError("must be overridden in subClass")
    }
    /**
     * non-nested values (NSColor,Int,CGFloat etc)
     */
    static func unWrap<T>(value:String) -> T? {
        fatalError("must be overridden in subClass")
    }
    /**
     * NOTE: used to unWrap nested values (DropShadow)
     * NOTE: looks at the type and converts that the value into a type
     */
    static func unWrap<T:UnWrappable>(xml:XML,_ key:String) -> T?{
       
        //let type:String = xml.firstNode(key)!["type"]!//<-- type not important anymore since we use T
        
        //TODO: Try to find an xml method that can assert complex value or simple value of a node
        
        if(xml.childCount > 0 && xml.value.count == 0){
            return T.unWrap(xml)//<--this could be an infinte loop, be cautiouse
        }else if(xml.value.count > 0){
            let value:String = xml.firstNode(key)!.value
            Swift.print("value: " + "\(value)")
            return T.unWrap(value) //use T to your advantage when converting the value (A protocol extension switch, polymorphism)
        }else{
            return nil//return nil if the node has no value and no subNodes
        }
        
        
        
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
