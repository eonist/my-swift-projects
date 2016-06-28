import Cocoa

class TempInteractiveView : InteractiveView{
    var name:String = ""/*Makes it easier to test*/
    /**
     * NOTE: draws a 100 by 100 square with a random color
     */
    override func drawRect(dirtyRect: NSRect) {
        Swift.print("InteractiveView.drawRect()")
        let graphicsContext = NSGraphicsContext.currentContext()!
        let context = graphicsContext.CGContext/* Get the handle to the current context */
        let path = CGRect(0,0,100,100).path
        CGContextAddPath(context, path)
        CGContextSetFillColorWithColor(context,NSColor.random.CGColor)
        CGContextDrawPath(context, CGPathDrawingMode.Fill)
        //super.drawRect(dirtyRect)
    }
    override func mouseOut() {
        Swift.print(name+" mouseOut")
    }
    override func mouseOver() {
        Swift.print(name+" mouseOver")
    }
    override func mouseUpInside(theEvent: NSEvent) {
        Swift.print(name+" mouseUpInside")
    }
    override func mouseUpOutside(theEvent: NSEvent) {
        Swift.print(name+" mouseUpOutside")
    }
    override func mouseMove(){
        //Swift.print(name + " mouseMove")
    }
}