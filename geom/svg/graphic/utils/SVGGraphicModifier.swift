import Cocoa

class SVGGraphicModifier {
    /**
    * Applies the @param strokeStyle to the @param graphics
    * @Note: If @param strokeStyle Does not have a variable, the default flash variable is applied
    */
    class func applyStrokeStyle(graphics:Graphics, _ style:SVGStyle) {
        let strokeWidth:CGFloat = !(style.strokeWidth.isNaN) ? style.strokeWidth : 0;
        let strokeMiterLimit:CGFloat = !(style.strokeMiterLimit.isNaN) ? style.strokeMiterLimit : 1.414;
        let strokeLineCap:String = style.strokeLineCap != nil && style.strokeLineCap! == "" ? style.strokeLineCap! : "none";
        let strokeLineJoin:String = style.strokeLineJoin != nil && style.strokeLineJoin! == "" ? style.strokeLineJoin! : "miter";
        /*color*/
        Swift.print("style.fill: " + "\(style.fill)")
        let colorVal:Double = !(style.fill as! Double).isNaN ? style.fill as! Double : Double(0x000000)
        Swift.print("colorVal: " + "\(colorVal)")
        let strokeOpacity:CGFloat = !(style.strokeOpacity.isNaN) ? style.strokeOpacity : 1;
        Swift.print("strokeOpacity: " + "\(strokeOpacity)")
        let color:NSColor = NSColorParser.nsColor(UInt(colorVal), strokeOpacity)
        graphics.line(strokeWidth, color, Utils.strokeLineCap(strokeLineCap), Utils.strokeLineJoin(strokeLineJoin), strokeMiterLimit)
    }
}
/**
 * DISCUSSION:Probably move this into a more central place, but in the spirit of moving on!, Or not since its probably only related to how svg names these variables
 * TODO: try to find a method in swift that can extract enum values by providing a string
 */
private class Utils{
    class func strokeLineCap(strokeLineCap:String)->CGLineCap{
        if(strokeLineCap == "Butt"){return CGLineCap.Butt}
        else if(strokeLineCap == "Round"){return CGLineCap.Round}
        else{/*Square*/return CGLineCap.Square}
    }
    class func strokeLineJoin(strokeLineJoin:String)->CGLineJoin{
        if(strokeLineJoin == "miter"){return CGLineJoin.Miter}
        else if(strokeLineJoin == "round"){return CGLineJoin.Round}
        else{/*Bevel*/return CGLineJoin.Bevel}
    }
}