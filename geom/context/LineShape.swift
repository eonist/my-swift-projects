import Foundation

class LineShape :Shape{
    var fillStyle:IFillStyle?;
    var lineStyle:ILineStyle?;
    override func drawInContext(ctx: CGContext) {
        Swift.print("TempShape.drawInContext")
        graphics.context = ctx
        self.graphics.line(lineStyle!.thickness)//Stylize the line
        self.graphics.draw(thePath)//draw everything
    }
}
