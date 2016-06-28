import Cocoa

class TempCALayer:CALayer{
    override init() {
        Swift.print("TempCALayer.init()")
        super.init()
        //needsDisplay()
        //displayIfNeeded()
        //layoutIfNeeded()
        //needsLayout()
    }
    override init(layer: AnyObject) {
        Swift.print("TempCALayer.init(_layer_)")
        super.init(layer: layer)
    }
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}    
    /*
    override func drawLayer(layer: CALayer, inContext ctx: CGContext) {
        Swift.print("TempCALayer.drawLayer")
        super.drawLayer(layer,inContext: ctx)
    }
    */
    /**/
    /*
     * NOTE: Remember to set self.frame to something, else this wont be called. You also need to call display() in order for this to be called
     */
    override func drawInContext(ctx: CGContext) {
        Swift.print("TempCALayer.drawInContext()")
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
        CGContextSetFillColorWithColor(context,NSColor.random.CGColor)
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
    override func display() {
        Swift.print("TempCALayer.display()")
        super.display()
    }
    override func displayIfNeeded() {
        Swift.print("TempCALayer.displayIfNeeded()")
        super.displayIfNeeded()
    }
    */
    /**/
}