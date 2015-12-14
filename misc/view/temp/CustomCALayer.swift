import Cocoa
class CustomCALayer:CALayer{
    var color:NSColor = NSColor.magentaColor()
    override init() {
        super.init()
        
    }
    /*
    override func containsPoint(p: CGPoint) -> Bool {
    Swift.print("CustomCALayer.containsPoint")
    return true
    }
    */
    override init(layer: AnyObject) {
        Swift.print("CustomCALayer.init(_layer_)")
        super.init(layer: layer)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(_ color:NSColor){
        self.color = color
        super.init()
    }
    
    override func drawLayer(layer: CALayer, inContext ctx: CGContext) {
        Swift.print("CustomCALayer.drawLayer")
        super.drawLayer(layer,inContext: ctx)
    }
    /**/
    override func drawInContext(ctx: CGContext) {
        Swift.print("CustomCALayer.drawInContext()")
        let context = ctx
        let path:CGMutablePathRef  = CGPathCreateMutable();
        /* Here are our rectangle boundaries */
        let rectangle:CGRect = CGRectMake(0.0, 0.0, 50.0, 50.0);
        //let circle:CGEl
        /* Add the rectangle to the path */
        CGPathAddRect(path,nil, rectangle);
        
        //CGContextAddArc(context, circleCenter.x, circleCenter.y, circleRadius,startingAngle, endingAngle, 0);
        
        CGContextDrawPath(context, CGPathDrawingMode.Fill);
        CGContextAddPath(context,path)
        
        
        
        CGContextSaveGState(context)
        /*offset,blur and color*/
        
        
        
        
        
        //CGContextSetShadowWithColor(context, CGSizeMake(-14, -14), 17.0, NSColor.grayColor().CGColor);//offset,bl
        
        
        //CGContextSetRGBFillColor(
        //CGContextStrokePath(context)
        CGContextSetFillColorWithColor(context,color.CGColor)
        //CGContextSetStrokeColorWithColor(context, NSColor.blueColor().CGColor)
        //set the stroke width!
        //CGContextSetLineWidth(context, 15.0)
        CGContextDrawPath(context, CGPathDrawingMode.Fill)
        CGContextRestoreGState(context);
        /*
        let l = self
        l.backgroundColor = NSColor.greenColor().CGColor
        //l.backgroundColor = UIColor.blueColor().CGColor
        l.borderWidth = 4
        l.cornerRadius = 8
        
        l.borderColor = NSColor.redColor().CGColor
        
        //l.borderColor = UIColor.redColor().CGColor
        
        l.shadowOpacity = 0.7
        l.shadowOffset = CGSizeMake(0, 3);
        l.shadowRadius = 5.0;
        l.shadowColor = NSColor.grayColor().CGColor
        l.shadowOpacity = 0.8;
        */
    }
    /*
    override func drawLayer(layer: CALayer, inContext ctx: CGContext) {
    Swift.print("CustomCALayer.drawLayer")
    super.drawLayer(layer, inContext: ctx)
    }
    override func display() {
    Swift.print("CustomCALayer.display()")
    super.display()
    }
    override func displayIfNeeded() {
    Swift.print("CustomCALayer.displayIfNeeded()")
    super.displayIfNeeded()
    }
    */
    /**/
    
    override func hitTest(p: CGPoint) -> CALayer? {
        Swift.print("p: " + String(p))
        //self.hitTestFromViewRelativeToFrame(p,frame)//theEvent.locationInWindow
        let pos = convertPoint(p, fromLayer: nil)
        Swift.print("pos: " + "\(pos)")
        Swift.print("containsPoint(p): " + String(containsPoint(p)))
        
        return self
    }
}
