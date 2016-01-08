import Foundation

class SVGGraphicModifier {
    /**
    * Applies the @param strokeStyle to the @param graphics
    * @Note: If @param strokeStyle Does not have a variable, the default flash variable is applied
    */
    class func applyStrokeStyle(graphics:Graphics, style:SVGStyle) {
        var strokeWidth:CGFloat = !(style.strokeWidth.isNaN) ? style.strokeWidth : 0;
        var strokeOpacity:CGFloat = !(style.strokeOpacity.isNaN) ? style.strokeOpacity : 1;
        var strokeMiterLimit:CGFloat = !(style.strokeMiterLimit.isNaN) ? style.strokeMiterLimit : 1.414;
        var strokeLineCap:String = style.strokeLineCap == "" ? style.strokeLineCap : "none";
        var strokeLineJoin:String = style.strokeLineJoin == "" ? style.strokeLineJoin : "miter";
        graphics.lineStyle(strokeWidth , style.stroke, strokeOpacity, false/*<-pixelHinting*/, "normal"/*<-lineScaleMode*/, strokeLineCap, strokeLineJoin , strokeMiterLimit);
    }
}
