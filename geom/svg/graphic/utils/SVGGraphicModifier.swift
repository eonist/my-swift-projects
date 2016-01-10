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
        let strokeWidth:CGFloat = SVGStyleUtils.strokeWidth(style.strokeWidth)
        let strokeMiterLimit:CGFloat = SVGStyleUtils.miterLimit(style.strokeMiterLimit)
        let strokeLineCap:CGLineCap = SVGStyleUtils.lineCap(style.strokeLineCap)
        let strokeLineJoin:CGLineJoin = SVGStyleUtils.lineJoin(style.strokeLineJoin)
        let color:NSColor = SVGStyleUtils.strokeColor(style.stroke, style.strokeOpacity)
        graphics.line(strokeWidth, color, strokeLineCap, strokeLineJoin, strokeMiterLimit)
    }
    /**
    * Begins a gradient fill on @param graphics with @param gradient
    */
    class func beginGradientFill(graphic:SVGGraphic,gradient:SVGGradient) {
        //			trace("beginGradientFill");
        var gradientType = gradient is SVGLinearGradient ? GradientType.Linear : GradientType.Radial;
        //			trace("gradientType: " + gradientType);
        //var matrix:Matrix = Utils.matrix(graphic);
        if(gradient is SVGLinearGradient && gradient.gradientTransform != nil) {
            //matrix.concat(gradient.gradientTransform)
        }
        //var spreadMethod:String = gradient.spreadMethod || SpreadMethod.PAD;
        //			trace("spreadMethod: " + spreadMethod);
        //var interpolationMethod:String = InterpolationMethod.RGB;/*InterpolationMethod.LINEAR_RGB*/
        //			trace("interpolationMethod: " + interpolationMethod);
        var focalPointRatio:CGFloat = 0;/*from -1 to 1;*/
        if(gradient is SVGRadialGradient && !isNaN(SVGRadialGradient(gradient).fx)) {
            focalPointRatio = Utils.focalPointRatio(gradient as SVGRadialGradient);
        }
        //			trace("focalPointRatio: " + focalPointRatio);
        //			trace("gradient.colors: " + gradient.colors);
        //			trace("gradient.opacities: " + gradient.opacities);
        //			trace("gradient.offsets: " + gradient.offsets);
        graphic.graphics.beginGradientFill(gradientType, gradient.colors,gradient.opacities, gradient.offsets, matrix, spreadMethod, interpolationMethod, focalPointRatio);
    }
}

private class Utils{
    
}