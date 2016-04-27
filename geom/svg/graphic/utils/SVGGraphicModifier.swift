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
        //Swift.print("SVGGraphicModifier.applyStrokeStyle()")
        let lineStyle:ILineStyle = SVGUtils.lineStyle(style)
        graphics.line(lineStyle.thickness, lineStyle.color, lineStyle.lineCap, lineStyle.lineJoin, lineStyle.miterLimit)
    }
    /**
     * TODO: when you scale the lineGradient, remember to consider that you dont scale the lineWidth and so the gradient that is applied may not cover as it should. This means that you cant simply scale the SVGGradient.transformation, instead you have to scale the gradient that is attached to the indeviduel SVGGraphic, and you have to take into consideration that the strokeThickness is now different than the new relative size. Even though its the same, the relative difference between the strokeThickness and the size of the shape is different. So you have to recalculate the gradient.transformation matrix a little bit. Probably by insetting it by some relative value
     */
    class func applyGradientStrokeStyle(shape:Shape,_ style:SVGStyle){
        //Swift.print("applyGradientStrokeStyle: " + "\(applyGradientStrokeStyle)")
        let lineStyle:ILineStyle = SVGUtils.lineStyle(style)
        shape.graphics.line(lineStyle.thickness, lineStyle.color, lineStyle.lineCap, lineStyle.lineJoin, lineStyle.miterLimit)
        let graphicsGradient:IGraphicsGradient = SVGUtils.lineGraphicsGradient(shape, style)
        shape.graphics.gradientLine(graphicsGradient)
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
     * @DISCUSSION: you cant directly apply the matrix transformation in the Graphics since the graphics class operates in 0,0 space and the matrix transformation that comes in operates it 0,0 space from the point of ciew of the viewbox (this probably isnt true when doing gradientUnits=" 'objectBoundingBox' only when doing: 'userSpaceOnUse' or )
     * TODO: unless you offset it first! try this
     */
    class func beginGradientFill(shape:Shape,_ gradient:SVGGradient) {
        //let graphics:Graphics = shape.graphics
        //Swift.print("SVGGraphicModifier.beginGradientFill");
        
    }
}
private class Utils{
    
}