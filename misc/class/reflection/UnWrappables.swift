import Cocoa
//Simple types:
extension String:UnWrappable{
    static func unWrap<T>(value:String) -> T? {
        return value as? T
    }
}
extension CGFloat:UnWrappable{
    static func unWrap<T>(value:String) -> T? {
        return value.cgFloat as? T
    }
}
extension Int:UnWrappable{
    static func unWrap<T>(value:String) -> T? {
        return value.int as? T
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
extension CGPoint:UnWrappable{
    static func unWrap<T>(value:String) -> T? {
        let values:Array<CGFloat> = StringParser.split(value, ",").map{$0.cgFloat}
        return CGPoint(values[0],values[1]) as? T
    }
}
extension CGSize:UnWrappable{
    static func unWrap<T>(value:String) -> T? {
        let values:Array<CGFloat> = StringParser.split(value, ",").map{$0.cgFloat}
        return CGSize(values[0],values[1]) as? T
    }
}
//Complex types:
extension RadialGradient:UnWrappable{
    static func unWrap<T>(xml:XML) -> T? {
        Swift.print("RadialGradient.unWrap()")
        let linearGradient:LinearGradient? = LinearGradient.unWrap(xml)
        let startCenter:CGPoint? = unWrap(xml, "startCenter")
        let endCenter:CGPoint? = unWrap(xml, "endCenter")
        let startRadius:CGSize? = unWrap(xml, "startRadius")
        let endRadius:CGSize? = unWrap(xml, "endRadius")/*should be 0,0 to mimic the focal ratio radial gradient system*/
        return RadialGradient(linearGradient!.colors, linearGradient!.locations, linearGradient!.rotation,startCenter,endCenter,startRadius,endRadius, linearGradient!.transformation) as? T
    }
}
extension LinearGradient:UnWrappable{
    static func unWrap<T>(xml:XML) -> T? {
        Swift.print("LinearGradient.unWrap()")
        let colors:Array<CGColor?> = unWrap(xml, "colors")
        Swift.print("colors: " + "\(colors)")
        let locations:Array<CGFloat?> = unWrap(xml, "locations")
        Swift.print("locations: " + "\(locations)")
        let rotation:CGFloat = unWrap(xml, "rotation")!
        Swift.print("rotation: " + "\(rotation)")
        let transformation:CGTransform? = unWrap(xml, "transformation")
        Swift.print("transformation: " + "\(transformation)")
        return LinearGradient(colors.flatMap{$0}, locations.flatMap{$0}, rotation, transformation) as? T
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
extension StyleProperty:UnWrappable{
    static func unWrap<T>(xml:XML) -> T? {
        let name:String = unWrap(xml, "name")!
        //continue here: make Any UnWrappable? and then look at the type attribute in the xml ?
        let type:String = XMLParser.attribute(xml.firstNode("value")!, "type")!
        if(type == String(CGFloat)){
            let value:CGFloat = unWrap(xml, "value")!
        }else{
            let value:CGFloat = unWrap(xml, "value")!
        }
        
        let depth:Int = unWrap(xml, "depth")!
        return StyleProperty(name,value,depth) as? T
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

