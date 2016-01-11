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
     * @NOTE: we use the Shape instance here because we need the frame offset to calculate the correct gradient p1 and p2 when using userspace
     * @NOTE: userspace uses real coordinates, nonuserspace uses relative coordinates 0 - 1 etc
     * @NOTE: userSpaceOnUse — x1, y1, x2, y2 represent coordinates in the current user coordinate system. In other words the values in the gradient are absolute values.
     * @NOTE: objectBoundingBox — x1, y1, x2, y2 represent coordinates in a system established by the bounding box of the element to which the gradient is applied. In other words the gradient scales with the element it’s applied to.
     * TODO: there is also: gradientTransform="rotate(90, 50, 30)" the origin of the rotation would be 50, 30
     * @NOTE: <radialGradient id="grad1" cx="50%" cy="50%" r="50%" fx="50%" fy="50%">
     * @NOTE: The cx, cy and r attributes define the outermost circle and the fx and fy define the innermost circle
     */
    class func beginGradientFill(shape:Shape,_ gradient:SVGGradient) {
        let graphics:Graphics = shape.graphics
        //Swift.print("SVGGraphicModifier.beginGradientFill");
        let gradientType = gradient is SVGLinearGradient ? GradientType.Linear : GradientType.Radial;
        //Swift.print("gradientType: " + gradientType);
        //var matrix:Matrix = Utils.matrix(graphic);
        if(gradient is SVGLinearGradient && gradient.gradientTransform != nil) {
            //matrix.concat(gradient.gradientTransform)
        }
        //var spreadMethod:String = gradient.spreadMethod || SpreadMethod.PAD;
        //Swift.print("spreadMethod: " + spreadMethod);
        //var interpolationMethod:String = InterpolationMethod.RGB;/*InterpolationMethod.LINEAR_RGB*/
        //Swift.print("interpolationMethod: " + interpolationMethod);
        //let focalPointRatio:CGFloat = 0;/*from -1 to 1;*/
        if(gradient is SVGRadialGradient && !((gradient as! SVGRadialGradient).fx).isNaN) {
            //focalPointRatio = Utils.focalPointRatio(gradient as! SVGRadialGradient);
        }
        //Swift.print("focalPointRatio: " + focalPointRatio);
        //Swift.print("gradient.colors: " + gradient.colors);
        //Swift.print("gradient.opacities: " + gradient.opacities);
        //Swift.print("gradient.offsets: " + gradient.offsets);
        if(gradient is SVGLinearGradient){
            let gradient:SVGLinearGradient = gradient as! SVGLinearGradient
            let userSpaceOnUse:Bool = gradient.gradientUnits == "userSpaceOnUse";////The gradientUnits attribute takes two familiar values, userSpaceOnUse and objectBoundingBox, which determine whether the gradient scales with the element that references it or not. It determines the scale of x1, y1, x2, y2.
            var p1:CGPoint = /*userSpaceOnUse && !gradient.x1.isNaN && !gradient.y1.isNaN ? */CGPoint(gradient.x1,gradient.y1)/* :nil*/
            var p2:CGPoint = /*userSpaceOnUse && !gradient.x2.isNaN && !gradient.y2.isNaN ? */CGPoint(gradient.x2,gradient.y2)/* :nil*/
            if(userSpaceOnUse){/*we offset the p1,p2 to operate in the 0,0 space that the path is drawn in, inside frame*/
                p1 -= shape.frame.origin
                p2 -= shape.frame.origin
            }
            let grad:IGradient = Gradient(gradient.colors,gradient.offsets,gradientType,0,nil,nil,nil,nil,p1,p2,!userSpaceOnUse)
            graphics.gradientFill(grad)
        }
    }
}
private class Utils{
    
}