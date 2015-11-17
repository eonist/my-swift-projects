import Cocoa
/*
 * What the Graphics class does:
 * 1. clear the graphics
 * 2. beginFill or beginStroke or both (save the Graphics State of the context)
 * 3. draw your path (universal draw method, knows when to use gradient draw, and clip correctly etc)
 * 4. end fill (i guess resets the fill, stroke, clipping etc etc. ready for new graphics) and restore the graphic state of the context
 * Why Graphics class exists: basically because Quartz is dificult to use and complex when dealing with gradients and  gradientStrokes and also so that one can seperate content and style better
 * Note: the reason we need a class like Graphics to manage the above process is because we need to know about what type of fill was applied in order to draw using one universal draw method. Also an easy way to store and restore the Graphic state of the context
 * Note: in the future Graphics may be able to extend CGContext or even employ a extension  scheme of sorts
 * Note: this class also simplifies the use of gradient as fill type, since that always involves clipping etc. Esspecially for gradient strokes. Since this isnt really supported in quartz directly.
 * Example: (add this to a subClass of NSView drawRect() method)
 * let graphics:Graphics = Graphics()
 * var path:CGPath = CGPathParser.rect(200,200)//Shapes
 * CGPathModifier.translate(&path,20,20)//Transformations
 * graphics.line(12)//Stylize the line
 * graphics.fill(NSColor.blueColor())//Stylize the fill
 * graphics.draw(path)//draw everything
 */
public class Graphics{
    enum FillMode: Int {case None = 0, Color, Gradient}
    enum StrokeMode: Int {case None = 0, Color, Gradient}
    public var context:CGContextRef
    let graphicsContext:NSGraphicsContext
    var fillMode:FillMode = FillMode.None
    var strokeMode:StrokeMode = StrokeMode.None
    var gradient:Gradient = Gradient()/*This value exists because we will use it when doing radial and linear gradient construction and need access to matrix etc*/
    var cgGradient:CGGradientRef?/*This value exists because of performance*/
    var lineGradient:Gradient = Gradient()/*This value exists because we will use it when doing radial and linear gradient construction and need access to matrix etc*/
    var cgLineGradient:CGGradientRef?/*This value exists because of performance*/
    public init(){
        self.graphicsContext = NSGraphicsContext.currentContext()!
        self.context = graphicsContext.CGContext/* Get the handle to the current context */
    }
    /**
     * Initiate filling
     * EXAMPLE: fill(context,NSColor.greenColor())
     * TODO: add support for CGContextSetRGBFillColor in the future
     * Note: set color to NSColor.clearColor() if you want a clear fill or use the stopFill() call
     */
    public func fill(color:NSColor){
        //Swift.print("Graphics.fill()")
        fillMode = FillMode.Color
        CGContextSetFillColorWithColor(context,color.CGColor)
    }
    /*
     * Initiate gradient filling
     */
    public func gradientFill(gradient:Gradient){
        fillMode = FillMode.Gradient
        self.gradient = gradient
        self.cgGradient = GradientUtils.cgGradient(gradient)
    }
    /**
     * Set the current line style
     * NOTE: there is also a CGContextStrokePath(context) method availbale
     * NOTE: there are also these: //CGContextSetLineDash, CGContextSetStrokeColorSpace,CGContextSetStrokePattern,CGContextSetStrokePattern
     */
    public func line(lineWidth:CGFloat = 1,_ color:NSColor = NSColor.blackColor(), _ lineCap:CGLineCap = CGLineCap.Butt, _ lineJoin:CGLineJoin =  CGLineJoin.Miter, _ miterLimit:CGFloat = 10){
        strokeMode = StrokeMode.Color
        CGContextSetStrokeColorWithColor(context, color.CGColor)
        //set the stroke width!
        CGContextSetLineWidth(context, lineWidth)
        CGContextSetLineCap(context, lineCap)/*Butt is the default, CGLineCap.Square,CGLineCap.Round,CGLineCap.Butt*/
        CGContextSetLineJoin(context, lineJoin)/*Miter is the default, CGLineJoin.Round,CGLineJoin.Bevel,CGLineJoin.Miter*/
        CGContextSetMiterLimit(context, miterLimit)//The default Quartz miter limit is 10
    }
    /**
     * Set the current  gradient line style
     * Note: width is set by the method line
     * TODO: Contemplate including lineWidth etc in this call
     */
    public func gradientLine(gradient:Gradient){
        strokeMode = StrokeMode.Gradient
        lineGradient = gradient
        cgLineGradient = GradientUtils.cgGradient(gradient)
    }
    /**
     * Stop all subsequent filling
     */
    public func stopFill(){
        //set the fill mode to void
        fillMode = FillMode.None
    }
    /**
     * Stop all subsequent stroking
     * Note could also potentially be called resetStroke, clearStroke etc or be omitted see old code
     */
    public func stopStroke(){
        strokeMode = StrokeMode.None
        //CGContextSetFillColorWithColor(context,NSColor.clearColor().CGColor)
        //test the end fill theory
    }
    /**
     * NOTE: you may need to implement the Tranceparency group scheme to get shadow and transperancy to play nice with the gradient and gradient stroke etc
     */
    public func draw(path:CGPath){
        //Swift.print("Grpahics.draw() ")
        CGContextAddPath(context,path)//Adds the path to the context
        
        switch true{
            case (fillMode == FillMode.Color) && (strokeMode == StrokeMode.None)://fill only
                //Swift.print("fill")
                CGContextDrawPath(context, CGPathDrawingMode.Fill)
            case (fillMode == FillMode.None) && (strokeMode == StrokeMode.Color)://stroke  only
                //Swift.print("stroke")
                CGContextDrawPath(context, CGPathDrawingMode.Stroke)
            case (fillMode == FillMode.Color) && (strokeMode == StrokeMode.Color)://fill and stroke
                //Swift.print("fill & stroke")
                CGContextDrawPath(context, CGPathDrawingMode.FillStroke)
            case (fillMode == FillMode.Gradient) && (strokeMode == StrokeMode.None)://gradientFill only
                //Swift.print("gradient fill")
                Utils.drawGradientFill(path, context, gradient, cgGradient)
            case (fillMode == FillMode.Gradient) && (strokeMode == StrokeMode.Color)://gradientFill and color stroke
                CGContextAddPath(context,path)//Adds the path to the context
                //Swift.print("gradient fill and color stroke")
                Utils.drawGradientFill(path, context, gradient, cgGradient)
                CGContextAddPath(context,path)//Adds the path to the context since it was consumed by the clipping of the gradient
                CGContextDrawPath(context, CGPathDrawingMode.Stroke)
            case (fillMode == FillMode.None) && (strokeMode == StrokeMode.Gradient)://gradient stroke only
                //Swift.print("gradient stroke")
                Utils.drawGradientStroke(path, context, lineGradient, cgLineGradient)
            case (fillMode == FillMode.Gradient) && (strokeMode == StrokeMode.Gradient)://gradient  fill and gradient stroke
                //Swift.print("gradient fill & gradient stroke")
                Utils.drawGradientFill(path, context, gradient, cgGradient)
                CGContextAddPath(context,path)//Adds the path to the context since it was consumed by the clipping of the gradient
                Utils.drawGradientStroke(path, context, lineGradient, cgLineGradient)
            case (fillMode == FillMode.Color) && (strokeMode == StrokeMode.Gradient)://gradient stroke only
                //Swift.print("color fill & gradient stroke")
                CGContextDrawPath(context, CGPathDrawingMode.Fill)
                CGContextAddPath(context,path)//Adds the path to the context since it was consumed by the color fill call
                Utils.drawGradientStroke(path, context, lineGradient, cgLineGradient)
            default:
                fatalError("THIS DRAW METHOD IS NOT SUPPORTED: " + "\(fillMode)")
                break;
        }
    }
}
private class Utils{
    /*
    * Draws a gradient into the current path in the context
    * TODO: the boundingbox call can be moved up one level if its better for performance, but wait untill you impliment matrix etc
    */
    class func drawGradientFill(path:CGPath,_ context:CGContextRef,_ gradient:Gradient, _ cgGradient:CGGradientRef?){
        let boundingBox:CGRect = CGPathGetBoundingBox(path) //creates a boundingbox derived from the bounds of the path
        
        CGContextSaveGState(context)
        CGContextClip(context);
        if(gradient.gradientType == GradientType.Axial) {/*Linear*/
            drawAxialGradient(path, context, cgGradient, boundingBox, gradient.rotation)
        }else{/*Radial*/
            drawRadialGradient(path, context, cgGradient, boundingBox)
        }
        CGContextRestoreGState(context)
    }
    /**
     * Draws a gradient into the current outline of the stroke of the current path in the context
     */
    class func drawGradientStroke(path:CGPath,_ context:CGContextRef,_ lineGradient:Gradient,_ cgLineGradient:CGGradientRef?){
        let boundingBox:CGRect = CGPathGetBoundingBox(path) // this method can be moved up one level if its better for performance, but wait untill you impliment matrix etc
       
        CGContextSaveGState(context)//store the graphic state so that the mask call bellow doesnt become the permanant mask
        CGContextReplacePathWithStrokedPath(context)//here is where magic happens to create a sort of outline of a stroke, you can also achive the same thing with: CGPathCreateCopyByStrokingPath, by the way the code behind this call is imensly complex. And probably cpu hungry. The more intersecting curves the worse the performance becomes
        CGContextClip(context) //create a mask for the gradient to be drawn into
        if(lineGradient.gradientType == GradientType.Axial) {
            drawAxialGradient(path, context, cgLineGradient, boundingBox, lineGradient.rotation)
        }else{
            drawRadialGradient(path, context, cgLineGradient, boundingBox)
        }
        CGContextRestoreGState(context)//restore the graphic mask
    }
    /**
     * Axial gradient "Linear"
     */
    class func drawAxialGradient(path:CGPath,_ context:CGContextRef,_ cgGradient:CGGradientRef?, _ boundingBox:CGRect, _ rotation:Double){
        Swift.print("drawAxialGradient.rotation: " + "\(rotation)")
        let a:CGPoint = CGPoint(boundingBox.midX, boundingBox.midY)
        //Swift.print(a)
        let b:CGPoint = PointParser.polarPoint(90,-rotation) + a
        //Swift.print(b)
        CGContextDrawLinearGradient(context, cgGradient, a, b, [])//CGGradientDrawingOptions.DrawsBeforeStartLocation or CGGradientDrawingOptions.DrawsAfterEndLocation
    }
    /**
     * Radial gradient
     */
    class func drawRadialGradient(path:CGPath,_ context:CGContextRef,_ cgGradient:CGGradientRef?, _ boundingBox:CGRect){
        let startCenter:CGPoint = NSMakePoint(NSMidX(boundingBox), NSMidY(boundingBox))
        let startRadius:CGFloat = min( ((boundingBox.size.width/2.0) - 2.0),((boundingBox.size.height/2.0) - 2.0) )
        let endCenter:CGPoint = NSMakePoint(startCenter.x + 60.0, startCenter.y + 60.0)
        let endRadius:CGFloat = 0.0
        CGContextDrawRadialGradient(context, cgGradient, startCenter, startRadius, endCenter, endRadius, [CGGradientDrawingOptions.DrawsBeforeStartLocation,CGGradientDrawingOptions.DrawsAfterEndLocation])//CGGradientDrawingOptions.DrawsBeforeStartLocation or CGGradientDrawingOptions.DrawsAfterEndLocation
    }
}

//NOte there is probably a peformace gain by not drowing past start and end, you could mediate this by calculating the amount of gradient you need to cover your area etc. maybe, tests are needed

/*_ graphicsContext:NSGraphicsContext*//*context:CGContextRef*/
/*self.context = context*/

/* 

Linear "Axial" gradient:

Fill the current clipping region of `context' with a linear gradient from
`startPoint' to `endPoint'. The location 0 of `gradient' corresponds to
`startPoint'; the location 1 of `gradient' corresponds to `endPoint';
colors are linearly interpolated between these two points based on the
values of the gradient's locations. The option flags control whether the
gradient is drawn before the start point or after the end point. */

/*

Radial gradient:

Fill the current clipping region of `context' with a radial gradient
between two circles defined by the center point and radius of each
circle. The location 0 of `gradient' corresponds to a circle centered at
`startCenter' with radius `startRadius'; the location 1 of `gradient'
corresponds to a circle centered at `endCenter' with radius `endRadius';
colors are linearly interpolated between these two circles based on the
values of the gradient's locations. The option flags control whether the
gradient is drawn before the start circle or after the end circle. */


/*

the code you need for the gradientStroke:

// Use the magic call to create a fillable path.
CGContextReplacePathWithStrokedPath(context);

// Turn the fillable path in to a clipping region.
CGContextClip(context);
*/