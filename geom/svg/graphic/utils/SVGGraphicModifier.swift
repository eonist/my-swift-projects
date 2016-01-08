import Cocoa

class SVGGraphicModifier {
    /**
    * Applies the @param strokeStyle to the @param graphics
    * @Note: If @param strokeStyle Does not have a variable, the default flash variable is applied
    */
    class func applyStrokeStyle(graphics:Graphics, style:SVGStyle) {
        var strokeWidth:CGFloat = !(style.strokeWidth.isNaN) ? style.strokeWidth : 0;
        var strokeOpacity:CGFloat = !(style.strokeOpacity.isNaN) ? style.strokeOpacity : 1;
        var strokeMiterLimit:CGFloat = !(style.strokeMiterLimit.isNaN) ? style.strokeMiterLimit : 1.414;
        var strokeLineCap:String = style.strokeLineCap! == "" ? style.strokeLineCap! : "none";
        var strokeLineJoin:String = style.strokeLineJoin == "" ? style.strokeLineJoin! : "miter";
        /*color*/
        let colorVal:Double = !(style.fill as! Double).isNaN ? style.fill as! Double : Double(0x000000)
        let opacity:CGFloat = !style.fillOpacity.isNaN ? style!.fillOpacity : 1
        let color:NSColor = NSColorParser.nsColor(UInt(colorVal), opacity)
        graphics.line(strokeWidth, style.stroke, strokeLineCap, strokeLineJoin, strokeMiterLimit)
    }
}
