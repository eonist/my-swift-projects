import Cocoa
/*
 * What the Graphics class does:
 * 1. Clear the graphics
 * 2. BeginFill or beginStroke or both (save the Graphics State of the context)
 * 3. Draw your path (universal draw method, knows when to use gradient draw, and clip correctly etc)
 * 4. End fill (i guess resets the fill, stroke, clipping etc etc. ready for new graphics) and restore the graphic state of the context
 * NOTE: Why Graphics class exists: basically because Quartz is dificult to use and complex when dealing with gradients and gradientStrokes and also so that one can seperate content and style better
 * NOTE: The reason we need a class like Graphics to manage the above process is because we need to know about what type of fill was applied in order to draw using one universal draw method. Also an easy way to store and restore the Graphic state of the context
 * NOTE: In the future Graphics may be able to extend CGContext or even employ a extension  scheme of sorts
 * NOTE: This class also simplifies the use of gradient as fill type, since that always involves clipping etc. Esspecially for gradient strokes. Since this isnt really supported in quartz directly.
 * NOTE: If you ever need the use the BoundingBox in this class then: you could add a bounds:CGRect to the Graphics class as a way to optimize it
 * NOTE: there is probably a peformace gain by not drawing past start and end, you could mediate this by calculating the amount of gradient you need to cover your area etc. maybe, tests are needed
 * EXAMPLE: (add this to a subClass of NSView drawRect() method)
 * let graphics:Graphics = Graphics()
 * var path:CGPath = CGPathParser.rect(200,200)//Shapes
 * CGPathModifier.translate(&path,20,20)//Transformations
 * graphics.line(12)//Stylize the line
 * graphics.fill(NSColor.blueColor())//Stylize the fill
 * graphics.draw(path)//draw everything
 * TODO: ⚠️️ Convert to struct?
 */
public class Graphics{
    lazy public var context:CGContext = {
        return NSGraphicsContext.current?.cgContext ?? {fatalError("Context not available")}()/* Get the handle to the current context */
    }()
    var mode:(fill:FillMode,stroke:StrokeMode) = (.None, .None)
    var gradient:GraphicsGradientKind?/* = GraphicsGradient()*//*This value exists because we will use it when doing radial and linear gradient construction and need access to matrix etc*/
    var lineGradient:GraphicsGradientKind?/* = GraphicsGradient()*//*This value exists because we will use it when doing radial and linear gradient construction and need access to matrix etc*/
    var dropShadow:DropShadow?
    var lineWidth:CGFloat = 1/*Needed to calculate the size of the Line-Gradient-Box, default is left at 1 as is the default in CGContext, There is no way to retrive lineWidth from CGContext*/
    /**
     * Initiate filling
     * NOTE: set color to NSColor.clearColor() if you want a clear fill or use the stopFill() call
     * NOTE: this method can be called pre context
     * EXAMPLE: fill(context,NSColor.greenColor())
     * TODO: ⚠️️ Add support for CGContextSetRGBFillColor in the future
     */
    public func fill(_ color:NSColor){
        mode.fill = .Color
        context.setFillColor(color.cgColor)
    }
    /*
     * Initiate gradient filling
     * NOTE: this method can be called pre context
     */
    public func gradientFill(_ gradient:GraphicsGradientKind){
        mode.fill = .Gradient
        self.gradient = gradient
    }
    /**
     * Set the current line style
     * NOTE: there is also a CGContextStrokePath(context) method availbale
     * NOTE: there are also these: //CGContextSetLineDash, CGContextSetStrokeColorSpace,CGContextSetStrokePattern,CGContextSetStrokePattern
     * NOTE: this method can be called pre context
     */
    public func line(_ lineWidth:CGFloat = 1,_ color:NSColor = .black, _ lineCap:CGLineCap = .butt, _ lineJoin:CGLineJoin =  .miter, _ miterLimit:CGFloat = 10,_ phase:CGFloat = 0, _ lengths:[CGFloat] = []){
        mode.stroke = .Color
        self.lineWidth = lineWidth
        context.setStrokeColor(color.cgColor)
        context.setLineWidth(lineWidth)
        context.setLineCap(lineCap)/*Butt is the default, CGLineCap.Square,CGLineCap.Round,CGLineCap.Butt*/
        context.setLineJoin(lineJoin)/*Miter is the default, CGLineJoin.Round,CGLineJoin.Bevel,CGLineJoin.Miter*/
        context.setMiterLimit(miterLimit)/*The default Quartz miter limit is 10*/
        if !lengths.isEmpty {context.setLineDash(phase:phase, lengths:lengths)}/*Add dash if lengths are specified*/
    }
    /**
     * Set the current  gradient line style
     * NOTE: width is set by the method line
     * NOTE: this method can be called pre context
     * TODO: ⚠️️ Contemplate including lineWidth etc in this call
     */
    public func gradientLine(_ gradient:GraphicsGradientKind){
        mode.stroke = .Gradient
        lineGradient = gradient
    }
    /**
     * Stop all subsequent filling
     * NOTE: this method can be called pre context
     */
    public func stopFill(){
        mode.fill = .None/*set the fill mode to void*/
    }
    /**
     * Stop all subsequent stroking
     * NOTE: could also potentially be called resetStroke, clearStroke etc or be omitted see old code
     * NOTE: this method can be called pre context
     */
    public func stopStroke(){
        mode.stroke = .None
    }
    /**
     * NOTE: You may need to implement the Tranceparency group scheme to get shadow and transperancy to play nice with the gradient and gradient stroke etc
     * NOTE: This method can only be called indirectly, the systm must init the call, and you must request a call from the system
     */
    public func draw(_ path:CGPath){
        drawFill(path)
        drawLine(path)
    }
    /**
     * NOTE: You can also use CGPathDrawingMode.FillStroke, but since we need to seperate stroking and filling because of we want to add dropshadow if applicaple we dont use it
     */
    public func drawFill(_ path:CGPath){
        context.addPath(path)/*Adds the path to the context*/
        beginOuterShadow(path)
        switch mode.fill{
            case .None:/*no fill*/
                break;
            case .Color:/*fill*/
                context.drawPath(using: .fill)
            case .Gradient:/*gradientFill*/
                context.saveGState()/*we only want to apply a temporary clip*/
                context.clip() /*create a mask for the gradient to be drawn into, we do this here since the GradientStroke uses drawGradientFill call aswell*/
                Utils.drawGradientFill(path, context, gradient!)
                context.restoreGState()/*we only want to apply a temporary clip*/
        }
        endOuterShadow()
        applyInnerShadow(path:path)/*init inner shadow*/
    }
    /**
     * NOTE: apperantly you dont need to add the path a second time when stroking, this may not be the case if you ad dropshadow etc
     */
    public func drawLine(_ path:CGPath){
        context.addPath(path)/*Adds a new path to the context if a dropshadow is present (this may only be the case for inner, and you may mitigate this by doing GState save and restore, though this is less performant i think)*/
        switch mode.stroke {
            case .None:/*no stroke*/
                break
            case .Color:/*color stroke*/
                context.drawPath(using: .stroke)
            case .Gradient :/*gradient stroke*/
                Utils.drawGradientStroke(path, context, lineGradient!, lineWidth)
        }
    }
}
private class Utils{
    /**
     * Draws a gradient into the current path in the context
     * TODO: ⚠️️ The boundingbox call can be moved up one level if its better for performance, but wait untill you impliment matrix etc
     */
    static func drawGradientFill(_ path:CGPath,_ context:CGContext,_ gradient:GraphicsGradientKind){
        switch gradient{
            case let gradient as LinearGraphicsGradient:/*Linear*/
                drawAxialGradient(path, context, gradient)
            case let gradient as RadialGraphicsGradient:/*Radial*/
                drawRadialGradient(path, context, gradient)
            default:
                fatalError("gradient type not supported: " + "\(gradient)")
        }
    }
    /**
     * Draws a gradient into the current outline of the stroke of the current path in the context
     */
    static func drawGradientStroke(_ path:CGPath,_ context:CGContext,_ lineGradient:GraphicsGradientKind, _ lineWidth:CGFloat){
        context.saveGState()/*Store the graphic state so that the mask call bellow doesnt become the permanant mask*/
        context.replacePathWithStrokedPath()/*Here is where magic happens to create a sort of outline of a stroke, you can also achive the same thing with: CGPathCreateCopyByStrokingPath, by the way the code behind this call is imensly complex. And probably cpu hungry. The more intersecting curves the worse the performance becomes*/
        context.clip()/*Create a mask for the gradient to be drawn into*/
        switch lineGradient{
            case let lineGradient as LinearGraphicsGradient:
                drawAxialGradient(path, context, lineGradient)
            case let lineGradient as RadialGraphicsGradient:
                drawRadialGradient(path, context, lineGradient)
            default:
                fatalError("this type is not supported: " + "\(lineGradient)")
        }
        context.restoreGState()/*Restore the graphic mask*/
    }
    /**
     * Axial gradient "Linear"
     * NOTE: If you don't need to set the p1 and p2 radius then use: CGContextDrawLinearGradient(c: CGContext?, _ gradient: CGGradient?, _ startPoint: CGPoint, _ endPoint: CGPoint, _ options: CGGradientDrawingOptions)
     */
    static func drawAxialGradient(_ path:CGPath,_ context:CGContext,_ gradient:LinearGraphicsGradient){
        context.drawLinearGradient(gradient.cgGradient, start: gradient.p1, end: gradient.p2, options: [CGGradientDrawingOptions.drawsBeforeStartLocation,CGGradientDrawingOptions.drawsAfterEndLocation])//CGGradientDrawingOptions.DrawsBeforeStartLocation or CGGradientDrawingOptions.DrawsAfterEndLocation
    }
    /**
     * Radial gradient
     * NOTE: to support radial gradients that end their gradient with a color that is transperant we needed to make the background a mask. Think shape with a hole, the hole is the area of the radial gradient
     * TODO: ⚠️️ The current way this works is to use a clipping with EOClip (EvenOdd) but this could be easily done with two paths one being drawn with reverese winding. This approche may be faster aswell. so try it
     * TODO: ⚠️️ You may consider drawing the elliptical shape from the top left to get better edge rendering.
     * TODO: ⚠️️ You should research the internet for ideas on how to imporve the code in this method, speed and rendering and less code etc. This works for now though
     */
    static func drawRadialGradient(_ path:CGPath,_ context:CGContext,_ gradient:RadialGraphicsGradient){
        context.saveGState()/*Save the current context, begin drawing the radial gradient*/
        if let transformation = gradient.transformation {context.concatenate(transformation)}/*Transform the current context, so that radial gradient can have a squeezed look*/
        context.drawRadialGradient(gradient.cgGradient, startCenter: gradient.startCenter, startRadius: gradient.startRadius, endCenter: gradient.endCenter, endRadius: gradient.endRadius, options:[CGGradientDrawingOptions.drawsAfterEndLocation])/*Draw the actual radial graphics*///CGGradientDrawingOptions.DrawsBeforeStartLocation,CGGradientDrawingOptions.DrawsAfterEndLocation//CGGradientDrawingOptions.DrawsBeforeStartLocation or CGGradientDrawingOptions.DrawsAfterEndLocation
        context.restoreGState()/*Restore the context that was saved, end drawing the radial gradient*/
    }
}
extension Graphics{
    enum FillMode:Int {case None = 0, Color, Gradient}
    enum StrokeMode:Int {case None = 0, Color, Gradient}
    private func beginOuterShadow(_ path:CGPath){
        if let dropShadow = dropShadow, !dropShadow.inner{/*Has outer drop shadow*/
            context.saveGState()/*Initates the GState so that subsequent drawing also gets a shade*/
            dropShadow.shadow.set()/*<--Don't use this if you plan to use this method with CALAyer, see how it is done with innerShadow. One can also do CGContextSetShadowWithColor*/
        }
    }
    private func endOuterShadow(){
        if let dropShadow = dropShadow, !dropShadow.inner{
            context.restoreGState()
        }/*Stops drawing the shadow on subsequent drawing*/
    }
    private func applyInnerShadow(path:CGPath){
        if let dropShadow = dropShadow, dropShadow.inner {
            context.saveGState()/*Init the gState*/
            context.addPath(path)/*Add The clipping path to the context*/
            context.clip()/*The clipping ensures that the shadow is within its shape that it tries to cast an inset shadow on*/
            context.setAlpha(dropShadow.color.cgColor.alpha)//this can be simpler
            context.beginTransparencyLayer(auxiliaryInfo: nil)
            context.setShadow(offset: dropShadow.offset, blur: dropShadow.blurRadius, color: dropShadow.opaqueColor.cgColor)/*This is where the setting of the shadow happens*/
            context.setBlendMode(.sourceOut)/*The blend mode creates the hole in the shadow so that it appears like an inner shadow*/
            context.setFillColor(dropShadow.color.alpha(1.0).cgColor)//TODO: ⚠️️ this can be made more optimized
            context.addPath(path)
            context.fillPath()
            context.endTransparencyLayer()
            context.restoreGState()/*End the gState*/
        }
    }
}
