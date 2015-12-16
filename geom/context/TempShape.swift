import Cocoa

class TempShape:Shape{
    override func drawInContext(ctx: CGContext) {
        //graphics.context = ctx
        self.graphics.fill(NSColor.blueColor())//Stylize the fill
        self.graphics.draw(path)//draw everything
    }
}
