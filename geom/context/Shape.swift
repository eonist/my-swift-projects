import Cocoa

class Shape : CALayer{
    lazy var graphics: Graphics = Graphics()//Delays the creation of graphics until it is needed, keep in mind that you cant create this instance before drawRect is called
    var path:CGMutablePath = CGPathCreateMutable()
    /*
    override func drawInContext(ctx: CGContext) {
    Swift.print("Shape.drawInContext()")
    }
    */
}
