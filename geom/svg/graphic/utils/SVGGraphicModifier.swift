import Cocoa

class SVGGraphicModifier {
    /**
    * Applies the @param strokeStyle to the @param graphics
    * @Note: If @param strokeStyle Does not have a variable, the default flash variable is applied
    * @NOTE: For example, a miter limit of 1.414 converts miters to bevels for theta less than 90 degrees, a limit of 4.0 converts them for theta less than approximately 29 degrees, and a limit of 10.0 converts them for theta less than approximately 11.5 degrees.
    * @NOTE: miterLength / stroke-width = 1 / sin ( theta / 2 ) The ratio of miter length (distance between the outer tip and the inner corner of the miter) to stroke-width is directly related to the angle (theta) between the segments in user space by the formula:
     * @NOTE: miterlimit The limit on the ratio of the miter length to the stroke-width. The value of <miterlimit> must be a <number> greater than or equal to 1.
    */
    class func applyStrokeStyle(graphics:Graphics, _ style:SVGStyle) {
        let strokeWidth:CGFloat = !(style.strokeWidth.isNaN) ? style.strokeWidth : 0;
        let strokeMiterLimit:CGFloat = !(style.strokeMiterLimit.isNaN) ? style.strokeMiterLimit : 4/*<--was 1.414*/;
        let strokeLineCap:String = style.strokeLineCap != nil && style.strokeLineCap! == "" ? style.strokeLineCap! : "butt";/*<-this was none, but it doesnt need to be since we wont extract this value from */
        let strokeLineJoin:String = style.strokeLineJoin != nil && style.strokeLineJoin! == "" ? style.strokeLineJoin! : "miter";
        /*color*/
        //Swift.print("style.stroke: " + "\(style.stroke)")
        let colorVal:Double = !(style.stroke.isNaN) ? style.stroke : Double(0x000000)
        //Swift.print("colorVal: " + "\(colorVal)")
        let strokeOpacity:CGFloat = !(style.strokeOpacity.isNaN) ? style.strokeOpacity : 1;
        //Swift.print("strokeOpacity: " + "\(strokeOpacity)")
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
        if(strokeLineCap == "butt"){return CGLineCap.Butt}
        else if(strokeLineCap == "round"){return CGLineCap.Round}
        else if(strokeLineCap == "square"){return CGLineCap.Square}
        else{fatalError(strokeLineCap + " not supported")}
    }
    class func strokeLineJoin(strokeLineJoin:String)->CGLineJoin{
        if(strokeLineJoin == "miter"){return CGLineJoin.Miter}
        else if(strokeLineJoin == "round"){return CGLineJoin.Round}
        else if(strokeLineJoin == "Bevel"){return CGLineJoin.Bevel}
        else{fatalError(strokeLineJoin + " not supported")}
    }
}