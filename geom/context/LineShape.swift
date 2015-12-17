import Foundation

class LineShape :Shape{
    var lineStyle:ILineStyle?;
    override func drawInContext(ctx: CGContext) {
        Swift.print("LineShape.drawInContext")
        graphics.context = ctx
        self.graphics.line(lineStyle!.thickness,lineStyle!.color,lineStyle!.lineCap, lineStyle!.lineJoin, lineStyle!.miterLimit)//Stylize the line
        self.graphics.draw(path)//draw everything
    }
}
