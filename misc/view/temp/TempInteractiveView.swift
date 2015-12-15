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
        //super.mouseOut()
    }
    override func mouseOver() {
        Swift.print(name+" mouseOver")
        //super.mouseOver()
    
        //Continue here:
        //1. make this method so that you dont need to call super, do the same with mouseOut
        //2. finish the interactiveview and then test it on button etc.
        //3. then make the GraphicSkin with a stroke and a fill CALayer
        //4. get the outer shadow to work on the layer and the inner shadow to work on the fill only
        //5. start making other Elements
        //6. mouseUpInside and mouseUpOutSide should work how the current mouseOut and mouseOver works. Respecting visible part of the view. 
        //7. mouseUpInside and mouseUpOutside is so general that we can include it in INteractiveView and thus the Button class will be alot simpler, which is good
        
    }
    override func mouseMove(){
        //Swift.print(name + " mouseMove")
    }
}
