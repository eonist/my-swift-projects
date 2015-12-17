import Foundation

class FillShape :Shape{
    var fillStyle:IFillStyle?;
    
        
    
    override func drawInContext(ctx: CGContext) {
        //Swift.print("FillShape.drawInContext")
        graphics.context = ctx
        self.graphics.fill(fillStyle!.color)//Stylize the fill
        self.graphics.draw(path)//draw everything
        
    }
}
