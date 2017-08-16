import Cocoa

class SVGGraphicModifier {
    /**
     * Applies the PARAM: strokeStyle to the PARAM: graphics
     * NOTE: If PARAM: strokeStyle Does not have a variable, the default flash variable is applied
     * NOTE: For example, a miter limit of 1.414 converts miters to bevels for theta less than 90 degrees, a limit of 4.0 converts them for theta less than approximately 29 degrees, and a limit of 10.0 converts them for theta less than approximately 11.5 degrees.
     * NOTE: miterLength / stroke-width = 1 / sin ( theta / 2 ) The ratio of miter length (distance between the outer tip and the inner corner of the miter) to stroke-width is directly related to the angle (theta) between the segments in user space by the formula:
     * NOTE: miterlimit The limit on the ratio of the miter length to the stroke-width. The value of <miterlimit> must be a <number> greater than or equal to 1.
     */
    static func applyStrokeStyle(_ graphics:Graphics, _ style:SVGStyle){
        let lineStyle:LineStylable = SVGLineStyleUtils.colorLineStyle(style)
        graphics.line(lineStyle.thickness, lineStyle.color, lineStyle.lineCap, lineStyle.lineJoin, lineStyle.miterLimit)
    }
    /**
     * Applies a gradientStrokeStyle to the Graphics
     */
    static func applyGradientStrokeStyle(_ shape:Shape,_ style:SVGStyle){
        let lineStyle:LineStylable = SVGLineStyleUtils.colorLineStyle(style)
        shape.graphics.line(lineStyle.thickness, lineStyle.color, lineStyle.lineCap, lineStyle.lineJoin, lineStyle.miterLimit)
        let graphicsGradient:GraphicsGradientKind = SVGLineStyleUtils.lineGraphicsGradient(shape, style)
        shape.graphics.gradientLine(graphicsGradient)
    }
    /**
     * Begins a gradient fill on PARAM: graphics with PARAM: gradient
     */
    static func beginGradientFill(_ shape:Shape,_ gradient:SVGGradient){
        let graphicsGradient:GraphicsGradientKind = SVGFillStyleUtils.fillGraphicGradient(shape, gradient)
        shape.graphics.gradientFill(graphicsGradient)
    }
}
