import Cocoa

class SVGGraphicModifier {
    /**
     * Applies the @param strokeStyle to the @param graphics
     * @Note: If @param strokeStyle Does not have a variable, the default flash variable is applied
     * @NOTE: For example, a miter limit of 1.414 converts miters to bevels for theta less than 90 degrees, a limit of 4.0 converts them for theta less than approximately 29 degrees, and a limit of 10.0 converts them for theta less than approximately 11.5 degrees.
     * @NOTE: miterLength / stroke-width = 1 / sin ( theta / 2 ) The ratio of miter length (distance between the outer tip and the inner corner of the miter) to stroke-width is directly related to the angle (theta) between the segments in user space by the formula:
     * @NOTE: miterlimit The limit on the ratio of the miter length to the stroke-width. The value of <miterlimit> must be a <number> greater than or equal to 1.
     */
    class func applyStrokeStyle(graphics:Graphics, _ style:SVGStyle){
        //Swift.print("SVGGraphicModifier.applyStrokeStyle()")
        let lineStyle:ILineStyle = SVGLineStyleConverter.colorLineStyle(style)
        graphics.line(lineStyle.thickness, lineStyle.color, lineStyle.lineCap, lineStyle.lineJoin, lineStyle.miterLimit)
    }
    /**
     * Applies a gradientStrokeStyle to the Graphics
     */
    class func applyGradientStrokeStyle(shape:Shape,_ style:SVGStyle){
        //Swift.print("applyGradientStrokeStyle: " + "\(applyGradientStrokeStyle)")
        let lineStyle:ILineStyle = SVGLineStyleConverter.colorLineStyle(style)
        shape.graphics.line(lineStyle.thickness, lineStyle.color, lineStyle.lineCap, lineStyle.lineJoin, lineStyle.miterLimit)
        let graphicsGradient:IGraphicsGradient = SVGUtils.lineGraphicsGradient(shape, style)
        shape.graphics.gradientLine(graphicsGradient)
    }
    /**
     * Begins a gradient fill on @param graphics with @param gradient
     */
    class func beginGradientFill(shape:Shape,_ gradient:SVGGradient){
        //let graphics:Graphics = shape.graphics
        //Swift.print("SVGGraphicModifier.beginGradientFill");
        let graphicsGradient:IGraphicsGradient = SVGUtils.fillGraphicGradient(shape, gradient)
        shape.graphics.gradientFill(graphicsGradient)
    }
}