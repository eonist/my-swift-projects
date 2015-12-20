import Cocoa
/**
 * NOTE: Shape is a convenient way to seperate drawing the stroke and the fill. (composite drawing) 
 */
class Shape : CALayer{
    lazy var graphics: Graphics = Graphics()//Delays the creation of graphics until it is needed, keep in mind that you cant create this instance before drawRect is called
    var path:CGMutablePath = CGPathCreateMutable()
    
    /*
    override func drawInContext(ctx: CGContext) {
        Swift.print("Shape.drawInContext()")
    }
    */
    /**/
    override init(){
        super.init()
        //drawsAsynchronously = true;
        //Swift.print("graphics.context: " + "\(graphics.context)")
        //Swift.print("Shape.NSScreen().backingScaleFactor: " + "\(NSScreen().backingScaleFactor)")//this is not the contentsScale it returns 0,0
        self.contentsScale = 2.0/*Makes lines smooth on retina screends, you may want to consider toggeling this on non-retina displays. From apple docs: The default value of this property is 1.0. For layers attached to a view, the view changes the scale factor automatically to a value that is appropriate for the current screen. For layers you create and manage yourself, you must set the value of this property yourself based on the resolution of the screen and the content you are providing. Core Animation uses the value you specify as a cue to determine how to render your content.*/
    }
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
