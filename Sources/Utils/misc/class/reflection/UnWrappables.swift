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
        let values:Array<CGFloat> = StringParser.split(value, ",").map{$0.cgFloat}
        return CGPoint(values[0],values[1]) as? T
    }
}
extension CGSize:UnWrappable{
    static func unWrap<T>(_ value:String) -> T? {
        let values:Array<CGFloat> = StringParser.split(value, ",").map{$0.cgFloat}
        return CGSize(values[0],values[1]) as? T
    }
}
extension RadialGradient:UnWrappable{//TODO: move to RadialGradient.swift
    static func unWrap<T>(_ xml:XML) -> T? {
        let linearGradient:LinearGradient? = LinearGradient.unWrap(xml)
        let startCenter:CGPoint? = unWrap(xml, "startCenter")
        let endCenter:CGPoint? = unWrap(xml, "endCenter")
        let startRadius:CGSize? = unWrap(xml, "startRadius")
        let endRadius:CGSize? = unWrap(xml, "endRadius")/*Should be 0,0 to mimic the focal ratio radial gradient system*/
        return RadialGradient(linearGradient!.colors, linearGradient!.locations, linearGradient!.rotation,startCenter,endCenter,startRadius,endRadius, linearGradient!.transformation) as? T
    }
}
extension LinearGradient:UnWrappable{//TODO: move to LinearGradient.swift
    static func unWrap<T>(_ xml:XML) -> T? {
        //Swift.print("LinearGradient.unWrap()")
        let colors:Array<CGColor?> = unWrap(xml, "colors")
        //Swift.print("colors: " + "\(colors)")
        let locations:Array<CGFloat?> = unWrap(xml, "locations")
        //Swift.print("locations: " + "\(locations)")
        let rotation:CGFloat = unWrap(xml, "rotation")!
        //Swift.print("rotation: " + "\(rotation)")
        let transformation:CGTransform? = unWrap(xml, "transformation")
        //Swift.print("transformation: " + "\(transformation)")
        return LinearGradient(colors.flatMap{$0}, locations.flatMap{$0}, rotation, transformation) as? T
    }
}
extension CGTransform:UnWrappable{
    static func unWrap<T>(_ value:String) -> T? {
        //Swift.print("CGTransform.unWrap()")
        let identities:Array<CGFloat> = StringParser.split(value, ",").map{$0.cgFloat}
        let transformation:CGTransform = CGAffineTransform(identities[0], identities[1], identities[2], identities[3], identities[4], identities[5])//swift 3 upgrade -> was->CGAffineTransformMake()
        return transformation as? T
    }
}
extension DropShadow:UnWrappable{//TODO: move to DropShadow.swift
    static func unWrap<T>(_ xml:XML) -> T? {
        let color:NSColor = unWrap(xml, "color")!
        let offsetX:CGFloat = unWrap(xml, "offsetX")!
        let offsetY:CGFloat = unWrap(xml, "offsetY")!
        let blurRadius:CGFloat = unWrap(xml, "blurRadius")!
        let inner:Bool = unWrap(xml, "inner")!
        return DropShadow(color, offsetX,offsetY, blurRadius, inner) as? T
    }
}
