import Foundation

class FillShape :Shape{
    override func drawInContext(ctx: CGContext) {
        Swift.print("TempShape.drawInContext")
        graphics.context = ctx
        self.graphics.fill(fillStyle.color)//Stylize the fill
        self.graphics.draw(path)//draw everything
        
    }
}
