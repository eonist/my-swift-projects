import Cocoa

class DropShadow {
    var color:NSColor
    var offsetX:CGFloat
    var offsetY:CGFloat
    var blurRadius:CGFloat
    var inner:Bool
    init(_ color:NSColor,_ offsetX:CGFloat,_ offsetY:CGFloat,_ blurRadius:CGFloat,_ inner:Bool){
        self.color = color
        self.offsetX = offsetX
        self.offsetY = offsetY
        self.blurRadius = blurRadius
        self.inner = inner
    }
}
extension DropShadow:CustomStringConvertible{
    /**
     * For easier printing of the class variables
     */
    var description: String { get{return "Color: " + color.hexString + "\n" + "offsetX: " + String(describing:offsetX) + "\n" + "offsetY: " + String(describing: offsetY)} }//missing blur
    /**
     * NSShadow(NSColor.blackColor().alpha(1.0),0.1,0.1,15)
     * NOTE: The class should extend NSShadow instead but we do this for now
     */
    var shadow:NSShadow{get{return NSShadow(color,offsetX,offsetY,blurRadius)} }
    /**
     * NOTE: We need a copy of the shadow color with alpha set to 1.0
     */
    var opaqueShadow:NSShadow{get{return NSShadow(opaqueColor,offsetX,offsetY,blurRadius)} }
    var opaqueColor:NSColor{return color.alpha(1.0)}
    var offset:CGSize{return CGSize(offsetX,offsetY)}
}
extension DropShadow:UnWrappable{/*Makes DropShadow UnWrappable*/
    static func unWrap<T>(_ xml:XML) -> T? {
        let color:NSColor = unWrap(xml, "color")!
        let offsetX:CGFloat = unWrap(xml, "offsetX")!
        let offsetY:CGFloat = unWrap(xml, "offsetY")!
        let blurRadius:CGFloat = unWrap(xml, "blurRadius")!
        let inner:Bool = unWrap(xml, "inner")!
        return DropShadow(color, offsetX,offsetY, blurRadius, inner) as? T
    }
}
private class Utils{
    /**
     * We need a copy of the shadow color as CGColor with alpha set to 1.0
     * NOTE: this isn't used anymore
     */
    static func opaqueColor(color:NSColor)->CGColor{
        return color.cgColor.copy(alpha: 1.0)!
    }
}
