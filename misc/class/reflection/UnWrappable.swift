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
     * non-nested values (NSColor,Int,CGFloat etc)
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
        if(xml.childCount > 0 && xml.value.count == 0){//complex node:Has child nodes
            return T.unWrap(xml)//<--this could be an infinte loop, be cautiouse
        }else if(xml.value.count > 0 && key.count > 0){//simple node content: Text
            let value:String = xml.firstNode(key)!.value//first child node that has the key
            Swift.print("value: " + "\(value)")
            Swift.print("xml.value.count: " + "\(xml.stringValue?.count)")
            return T.unWrap(value) //use T to your advantage when converting the value (A protocol extension switch, polymorphism)
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
//Simple types:
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
extension CGColorRef:UnWrappable{
    static func unWrap<T>(value:String) -> T? {
        Swift.print("CGColor.unWrap() value: " + "\(value)")
        return NSColorParser.nsColor(value).CGColor as? T
    }
    
}
//Complex types:
extension Gradient:UnWrappable{
    static func unWrap<T>(xml:XML) -> T? {
        let colors:Array<CGColor?> = unWrap(xml, "colors")
        let locations:Array<CGFloat?> = unWrap(xml, "locations")
        let rotation:CGFloat = unWrap(xml, "rotation")!
        let transformation:CGTransform? = unWrap(xml, "transformation")
        return Gradient(colors.flatMap{$0}, locations.flatMap{$0}, rotation, transformation) as? T
    }
}
extension CGTransform:UnWrappable{
    static func unWrap<T>(value:String) -> T? {
        Swift.print("CGTransform.unWrap()")
        let identities:Array<CGFloat> = StringParser.split(value, ",").map{$0.cgFloat}
        let transformation:CGTransform = CGAffineTransformMake(identities[0], identities[1], identities[2], identities[3], identities[4], identities[5])
        return transformation as? T
    }
}
extension DropShadow:UnWrappable{
    static func unWrap<T>(xml:XML) -> T? {
        let color:NSColor = unWrap(xml, "color")!
        let offsetX:CGFloat = unWrap(xml, "offsetX")!
        let offsetY:CGFloat = unWrap(xml, "offsetY")!
        let blurRadius:CGFloat = unWrap(xml, "blurRadius")!
        let inner:Bool = unWrap(xml, "inner")!
        return DropShadow(color, offsetX,offsetY, blurRadius, inner) as? T
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
