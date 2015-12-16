import Cocoa

class TempShape:Shape{
    override func drawLayer(layer: CALayer, inContext ctx: CGContext) {
        Swift.print("TempShape.drawLayer")
    }
    override func drawInContext(ctx: CGContext) {
        Swift.print("TempShape.drawInContext")
        graphics.context = ctx
        self.graphics.fill(NSColor.blueColor())//Stylize the fill
        self.graphics.draw(path)//draw everything
    }
}
