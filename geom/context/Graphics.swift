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
 * EXAMPLE: (add this to a subClass of NSView drawRect() method)
 * let graphics:Graphics = Graphics()
 * var path:CGPath = CGPathParser.rect(200,200)//Shapes
 * CGPathModifier.translate(&path,20,20)//Transformations
 * graphics.line(12)//Stylize the line
 * graphics.fill(NSColor.blueColor())//Stylize the fill
 * graphics.draw(path)//draw everything
 */
public class Graphics{
    enum FillMode:Int {case None = 0, Color, Gradient}
    enum StrokeMode:Int {case None = 0, Color, Gradient}
    public var context:CGContextRef?//let graphicsContext:NSGraphicsContext
    var fillMode:FillMode = FillMode.None
    var strokeMode:StrokeMode = StrokeMode.None
    var gradient:IGraphicsGradient = GraphicsGradient()/*This value exists because we will use it when doing radial and linear gradient construction and need access to matrix etc*/
    var cgGradient:CGGradientRef?/*This value exists because of performance*/
    var lineGradient:IGraphicsGradient = GraphicsGradient()/*This value exists because we will use it when doing radial and linear gradient construction and need access to matrix etc*/
    var cgLineGradient:CGGradientRef?/*This value exists because of performance*/
    var dropShadow:DropShadow?
    var lineWidth:CGFloat = 1/*Needed to calculate the size of the Line-Gradient-Box, defualt is left at 1 as is the default in CGContext, There is no way to retrive lineWidth from CGContext*/
    public init(){
        if(NSGraphicsContext.currentContext() != nil){
            let graphicsContext = NSGraphicsContext.currentContext()!
            self.context = graphicsContext.CGContext/* Get the handle to the current context */
        }
    }
    /**
     * Initiate filling
     * EXAMPLE: fill(context,NSColor.greenColor())
     * TODO: add support for CGContextSetRGBFillColor in the future
     * NOTE: set color to NSColor.clearColor() if you want a clear fill or use the stopFill() call
     * NOTE: this method can be called pre context
     */
    public func fill(color:NSColor){
        //Swift.print("Graphics.fill()" + "\(color)")
        fillMode = FillMode.Color
        CGContextSetFillColorWithColor(context,color.CGColor)
    }
    /*
     * Initiate gradient filling
     * NOTE: this method can be called pre context
     */
    public func gradientFill(gradient:IGraphicsGradient/*IGradient*/){
        fillMode = FillMode.Gradient
        self.gradient = gradient
        self.cgGradient = GradientUtils.cgGradient(gradient)
    }
    /**
     * Set the current line style
     * NOTE: there is also a CGContextStrokePath(context) method availbale
     * NOTE: there are also these: //CGContextSetLineDash, CGContextSetStrokeColorSpace,CGContextSetStrokePattern,CGContextSetStrokePattern
     * NOTE: this method can be called pre context
     */
    public func line(lineWidth:CGFloat = 1,_ color:NSColor = NSColor.blackColor(), _ lineCap:CGLineCap = CGLineCap.Butt, _ lineJoin:CGLineJoin =  CGLineJoin.Miter, _ miterLimit:CGFloat = 10,_ phase:CGFloat = 0, _ lengths:Array<CGFloat> = []){
        //Swift.print("context: " + "\(context)")
        strokeMode = StrokeMode.Color
        self.lineWidth = lineWidth
        CGContextSetStrokeColorWithColor(context, color.CGColor)
        //set the stroke width!
        CGContextSetLineWidth(context, lineWidth)
        CGContextSetLineCap(context, lineCap)/*Butt is the default, CGLineCap.Square,CGLineCap.Round,CGLineCap.Butt*/
        CGContextSetLineJoin(context, lineJoin)/*Miter is the default, CGLineJoin.Round,CGLineJoin.Bevel,CGLineJoin.Miter*/
        CGContextSetMiterLimit(context, miterLimit)//The default Quartz miter limit is 10
        if(lengths.count > 0) {CGContextSetLineDash(context, phase, lengths, lengths.count)}/*Add dash if lengths are specified*/
    }
    /**
     * Set the current  gradient line style
     * Note: width is set by the method line
     * TODO: Contemplate including lineWidth etc in this call
     * @NOTE this method can be called pre context
     */
    public func gradientLine(gradient:IGraphicsGradient){
        strokeMode = StrokeMode.Gradient
        lineGradient = gradient
        cgLineGradient = GradientUtils.cgGradient(gradient)
    }
    /**
     * Stop all subsequent filling
     * @NOTE this method can be called pre context
     */
    public func stopFill(){
        //set the fill mode to void
        fillMode = FillMode.None
    }
    /**
     * Stop all subsequent stroking
     * Note could also potentially be called resetStroke, clearStroke etc or be omitted see old code
     * @NOTE this method can be called pre context
     */
    public func stopStroke(){
        strokeMode = StrokeMode.None
        //CGContextSetFillColorWithColor(context,NSColor.clearColor().CGColor)
        //test the end fill theory
    }
    /**
     * NOTE: you may need to implement the Tranceparency group scheme to get shadow and transperancy to play nice with the gradient and gradient stroke etc
     * @NOTE this method can only be called indirectly, the systm must init the call, and you must request a call from the system
     */
    public func draw(path:CGPath){
        //Swift.print("Grpahics.draw() ")
        drawFill(path)
        drawLine(path)
    }
    /**
     * NOTE: You can also use CGPathDrawingMode.FillStroke, but since we need to seperate stroking and filling because of we want to add dropshadow if applicaple we dont use it
     */
    public func drawFill(path:CGPath){
        CGContextAddPath(context,path)//Adds the path to the context
        beginOuterShadow(path)
        switch true{
            case (fillMode == FillMode.None)://no fill
                //Swift.print("gradient fill none")
                break;
            case (fillMode == FillMode.Color)://fill
                //Swift.print("color fill ")

                CGContextDrawPath(context, CGPathDrawingMode.Fill)
            case (fillMode == FillMode.Gradient)://gradientFill
                //Swift.print("gradient fill")
                CGContextSaveGState(context)/*we only want to apply a temporary clip*/
                CGContextClip(context) /*create a mask for the gradient to be drawn into, we do this here since the GradientStroke uses drawGradientFill call aswell*/
                Utils.drawGradientFill(path, context!, gradient, cgGradient)
                CGContextRestoreGState(context)/*we only want to apply a temporary clip*/
            default:
                fatalError("THIS DRAW METHOD IS NOT SUPPORTED: fillMode: " + "\(fillMode)" + " strokeMode: " + "\(strokeMode)")
                break;
        }
        endOuterShadow()
        applyInnerShadow(path)/*init inner shadow*/
    }
    /**
     * NOTE:apperantly you dont need to add the path a second time when stroking, this may not be the case if you ad dropshadow etc
     */
    public func drawLine(path:CGPath){
        //the change to the bellow line is need in order to get the fill and line working together
        /*if(dropShadow != nil) {*/CGContextAddPath(context,path)/*}*///Adds a new path to the context if a dropshadow is present (this may only be the case for inner, and you may mitigate this by doing GState save and restore, though this is less performant i think)
        switch true {
            case (strokeMode == StrokeMode.None)://no stroke
                //Swift.print("no stroke")
                break
            case (strokeMode == StrokeMode.Color)://color stroke
                //Swift.print("color stroke")
                CGContextDrawPath(context, CGPathDrawingMode.Stroke)
            case (strokeMode == StrokeMode.Gradient)://gradient stroke
                //Swift.print("gradient stroke")
                Utils.drawGradientStroke(path, context!, lineGradient, cgLineGradient, lineWidth)
            default:
                fatalError("THIS STROKE METHOD IS NOT SUPPORTED" +  " strokeMode: " + "\(strokeMode)")
                break;
            }
    }
}
private class Utils{
    /*
     * Draws a gradient into the current path in the context
     * TODO: the boundingbox call can be moved up one level if its better for performance, but wait untill you impliment matrix etc
     */
    class func drawGradientFill(path:CGPath,_ context:CGContextRef,_ gradient:IGraphicsGradient, _ cgGradient:CGGradientRef?){
        //let boundingBox:CGRect = CGPathGetBoundingBox(path) /*creates a boundingbox derived from the bounds of the path*/
        //Swift.print("Graphics.drawGradientFill() boundingBox: " + String(boundingBox))
        
        //CGContextSaveGState(context)//why is this here again?
        
        if(gradient is LinearGraphicsGradient) {/*Linear*/
            drawAxialGradient(path, context, cgGradient, /*boundingBox,*/ gradient as! LinearGraphicsGradient)
        }else if(gradient is RadialGraphicsGradient){/*Radial*/
            drawRadialGradient(path, context, cgGradient, /*boundingBox,*/ gradient as! RadialGraphicsGradient)
        }else{fatalError("type not supported: " + "\(gradient)")}
        //CGContextRestoreGState(context)//why is this here again?
    }
    /**
     * Draws a gradient into the current outline of the stroke of the current path in the context
     */
    class func drawGradientStroke(path:CGPath,_ context:CGContextRef,_ lineGradient:IGraphicsGradient,_ cgLineGradient:CGGradientRef?, _ lineWidth:CGFloat){
        //var boundingBox:CGRect = CGPathGetBoundingBox(path) // this method can be moved up one level if its better for performance, but wait untill you impliment matrix etc
        //boundingBox = boundingBox.outset(lineWidth/2, lineWidth/2)/*Outset the boundingbox to cover the entire stroke*/
        CGContextSaveGState(context)//store the graphic state so that the mask call bellow doesnt become the permanant mask
        CGContextReplacePathWithStrokedPath(context)//here is where magic happens to create a sort of outline of a stroke, you can also achive the same thing with: CGPathCreateCopyByStrokingPath, by the way the code behind this call is imensly complex. And probably cpu hungry. The more intersecting curves the worse the performance becomes
        CGContextClip(context) //create a mask for the gradient to be drawn into
        if(lineGradient is LinearGraphicsGradient) {
            drawAxialGradient(path, context, cgLineGradient, /*boundingBox,*/ lineGradient as! LinearGraphicsGradient)
        }else if(lineGradient is RadialGraphicsGradient){
            drawRadialGradient(path, context, cgLineGradient, /*boundingBox,*/ lineGradient as! RadialGraphicsGradient)
        }else{fatalError("this type is not supported: " + "\(lineGradient)")}
        CGContextRestoreGState(context)//restore the graphic mask
    }
    /**
     * Axial gradient "Linear"
     * NOTE: If you don't need to set the p1 and p2 radius then use: CGContextDrawLinearGradient(c: CGContext?, _ gradient: CGGradient?, _ startPoint: CGPoint, _ endPoint: CGPoint, _ options: CGGradientDrawingOptions)
     */
    class func drawAxialGradient(path:CGPath,_ context:CGContextRef,_ cgGradient:CGGradientRef?,/* _ boundingBox:CGRect, */_ gradient:LinearGraphicsGradient){
        //Swift.print("Graphics.drawAxialGradient()")
        //Swift.print("gradient.p1: " + "\(gradient.p1)")
        //Swift.print("gradient.p2: " + "\(gradient.p2)")
        //Swift.print("gradient.transformation: " + "\(gradient.transformation)")
        
        //Swift.print("points: " + "\(points)")
        CGContextDrawLinearGradient(context, cgGradient, gradient.p1, gradient.p2, [CGGradientDrawingOptions.DrawsBeforeStartLocation,CGGradientDrawingOptions.DrawsAfterEndLocation])//CGGradientDrawingOptions.DrawsBeforeStartLocation or CGGradientDrawingOptions.DrawsAfterEndLocation
    }
    /**
     * Radial gradient
     * NOTE: to support radial gradients that end their gradient with a color that is transperant we needed to make the background a mask. Think shape with a hole, the hole is the area of the radial gradient
     * TODO: The current way this works is to use a clipping with EOClip (EvenOdd) but this could be easily done with two paths one being drawn with reverese winding. This approche may be faster aswell. so try it
     * TODO: You may consider drawing the elliptical shape from the top left to get better edge rendering. 
     * TODO: You should research the internet for ideas on how to imporve the code in this method, speed and rendering and less code etc. This works for now though
     */
    class func drawRadialGradient(path:CGPath,_ context:CGContextRef,_ cgGradient:CGGradientRef?, /*_ boundingBox:CGRect,*/_ gradient:RadialGraphicsGradient){
        //Swift.print("Graphics.drawRadialGradient")
        /*begin drawing the radial gradient*/
        CGContextSaveGState(context)/*save the current context*/
        if(gradient.transformation != nil) {CGContextConcatCTM(context, gradient.transformation!)}/*transform the current context, so that radial gradient can have a squeezed look*/
        CGContextDrawRadialGradient(context, cgGradient, gradient.startCenter, gradient.startRadius, gradient.endCenter, gradient.endRadius, [CGGradientDrawingOptions.DrawsAfterEndLocation])/*Draw the actual radial graphics*///CGGradientDrawingOptions.DrawsBeforeStartLocation,CGGradientDrawingOptions.DrawsAfterEndLocation//CGGradientDrawingOptions.DrawsBeforeStartLocation or CGGradientDrawingOptions.DrawsAfterEndLocation
        CGContextRestoreGState(context)/*restore the context that was saved*/
        /*end drawing the radial gradient*/
    }
}
extension Graphics{//private class ShadowUtils
    /**
     *
     */
    func beginOuterShadow(path:CGPath){
        //Swift.print("Graphics.beginOuterShadow")
        if(dropShadow != nil && !dropShadow!.inner){/*has outer drop shadow*/
            //Swift.print("dropShadow.description: " + "\(dropShadow!.description)");
            CGContextSaveGState(context)/*initates the GState so that subsequent drawing also gets a shade*/
            dropShadow!.shadow.set()/*<- dont use this if you plan to use this method with CALAyer, see how it is done with innerShadow. One can also do CGContextSetShadowWithColor*/
        }
    }
    /**
     *
     */
    func endOuterShadow(){
        //Swift.print("endOuterShadow()")
        if(dropShadow != nil && !dropShadow!.inner){CGContextRestoreGState(context)}//stops drawing the shadow on subsequent drawing
    }
    /**
     *
     */
    func applyInnerShadow(path:CGPath){
        //Swift.print("Graphics.applyInnerShadow: " + "\(context)")
        /*
        let context = graphics.context
        let dropShadow = graphics.dropShadow
        */
        if(dropShadow != nil && dropShadow!.inner){
            CGContextSaveGState(context);/*init the gState*/
            CGContextAddPath(context, path);/*add The clipping path to the context*/
            CGContextClip(context);/*The clipping ensures that the shadow is within its shape that it tries to cast an inset shadow on*/
            CGContextSetAlpha(context, CGColorGetAlpha(dropShadow!.color.CGColor));//this can be simpler
            CGContextBeginTransparencyLayer(context, nil);
            CGContextSetShadowWithColor(context, dropShadow!.offset, dropShadow!.blurRadius, dropShadow!.opaqueColor.CGColor);/*This is where the setting of the shadow happens*/
            //dropShadow!.opaqueShadow.set()/*<-- dont use this, since you need to ref context if you use CALayer. This is where the setting of the shadow happens*/
            CGContextSetBlendMode(context, CGBlendMode.SourceOut);/*The blend mode creates the hole in the shadow so that it appears like an inner shadow*/
            CGContextSetFillColorWithColor(context, dropShadow!.color.alpha(1.0).CGColor);//this can be made more optimized
            CGContextAddPath(context, path);
            CGContextFillPath(context);
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);/*end the gState*/
        }
    }
}

//Note there is probably a peformace gain by not drawing past start and end, you could mediate this by calculating the amount of gradient you need to cover your area etc. maybe, tests are needed

/*_ graphicsContext:NSGraphicsContext*//*context:CGContextRef*/
/*self.context = context*/

/* 

Linear "Axial" gradient:

Fill the current clipping region of `context' with a linear gradient from
`startPoint' to `endPoint'. The location 0 of `gradient' corresponds to
`startPoint'; the location 1 of `gradient' corresponds to `endPoint';
colors are linearly interpolated between these two points based on the
values of the gradient's locations. The option flags control whether the
gradient is drawn before the start point or after the end point. 
*/

/*

the code you need for the gradientStroke:

// Use the magic call to create a fillable path.
CGContextReplacePathWithStrokedPath(context);

// Turn the fillable path in to a clipping region.
CGContextClip(context);
*/