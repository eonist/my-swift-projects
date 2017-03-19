import Cocoa
/**
 * Standard types
 */
extension String:UnWrappable{
    static func unWrap<T>(_ value:String) -> T? {
        return "\(value)" as? T
    }
}
extension Double:UnWrappable{
    static func unWrap<T>(_ value:String) -> T? {
        return value.double as? T
    }
}
extension CGFloat:UnWrappable{
    static func unWrap<T>(_ value:String) -> T? {
        return value.cgFloat as? T
    }
}
extension Int:UnWrappable{
    static func unWrap<T>(_ value:String) -> T? {
        return value.int as? T
    }
}
extension Bool:UnWrappable{
    static func unWrap<T>(_ value:String) -> T? {
        return value.bool as? T
    }
}
extension NSColor:UnWrappable{/*We use 32 bit RGBA values when storing color data (This also stores the alpha value)*/
    static func unWrap<T>(_ value:String) -> T? {
        //Swift.print("NSColor.unWrap()")
        return NSColorParser.color(value) as? T//turns string values like: FF0000FF into NSColor blue
    }
}
extension CGColor:UnWrappable{
    static func unWrap<T>(_ value:String) -> T? {
        //Swift.print("CGColor.unWrap() value: " + "\(value)")
        return NSColorParser.color(value).cgColor as? T//turns string values like: FF0000FF into CGColor blue
    }
}
extension CGPoint:UnWrappable{
    static func unWrap<T>(_ value:String) -> T? {
        let values:[CGFloat] = StringParser.split(value, ",").map{$0.cgFloat}
        return CGPoint(values[0],values[1]) as? T
    }
}
extension CGSize:UnWrappable{
    static func unWrap<T>(_ value:String) -> T? {
        let values:[CGFloat] = StringParser.split(value, ",").map{$0.cgFloat}
        return CGSize(values[0],values[1]) as? T
    }
}
extension CGTransform:UnWrappable{
    static func unWrap<T>(_ value:String) -> T? {
        //Swift.print("CGTransform.unWrap()")
        let identities:[CGFloat] = StringParser.split(value, ",").map{$0.cgFloat}
        let transformation:CGTransform = CGTransform(identities[0], identities[1], identities[2], identities[3], identities[4], identities[5])//swift 3 upgrade -> was->CGAffineTransformMake()
        return transformation as? T
    }
}
