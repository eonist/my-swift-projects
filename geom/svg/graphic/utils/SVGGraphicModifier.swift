import Cocoa

class SVGGraphicModifier {
    /**
    * Applies the @param strokeStyle to the @param graphics
    * @Note: If @param strokeStyle Does not have a variable, the default flash variable is applied
    */
    class func applyStrokeStyle(graphics:Graphics, style:SVGStyle) {
        var strokeWidth:CGFloat = !(style.strokeWidth.isNaN) ? style.strokeWidth : 0;
        var strokeMiterLimit:CGFloat = !(style.strokeMiterLimit.isNaN) ? style.strokeMiterLimit : 1.414;
        var strokeLineCap:String = style.strokeLineCap! == "" ? style.strokeLineCap! : "none";
        var strokeLineJoin:String = style.strokeLineJoin == "" ? style.strokeLineJoin! : "miter";
        /*color*/
        let colorVal:Double = !(style.fill as! Double).isNaN ? style.fill as! Double : Double(0x000000)
        var strokeOpacity:CGFloat = !(style.strokeOpacity.isNaN) ? style.strokeOpacity : 1;
        let color:NSColor = NSColorParser.nsColor(UInt(colorVal), strokeOpacity)
        graphics.line(strokeWidth, color, Utils.strokeLineCap(strokeLineCap), strokeLineJoin, strokeMiterLimit)
    }
}
/**
 * Probably move this into a more central place, but in the spirit of moving on!
 */
private class Utils{
    class func strokeLineCap(strokeLineCap:String)->CGLineCap{
        if(strokeLineCap == "Butt"){return CGLineCap.Butt}
        else if(strokeLineCap == "Round"){return CGLineCap.Round}
        else{/*Square*/return CGLineCap.Square}
    }
    class func strokeLineJoin(strokeLineJoin:String)->CGLineCap{
        if(strokeLineCap == "Butt"){return CGLineCap.Butt}
        else if(strokeLineCap == "Round"){return CGLineCap.Round}
        else{/*Square*/return CGLineCap.Square}
    }
}

//CGLineCap,CGLineJoin