import Cocoa

class FillShape :Shape{
    var fillStyle:IFillStyle?;
    /*
    override func displayLayer(layer: CALayer) {
       //if you use this method drawInContext wont be called, the upside is that you can get the context the same way you would get it when using drawRect
    }
    */
    /*
    override func drawInContext(ctx: CGContext) {
        //Swift.print("FillShape.drawInContext")
        graphics.context = ctx
        
        //TODO:you only need to call the draw method from here, the fill setting etc can be done in the decoratable classes
        
        self.graphics.fill(fillStyle!.color)//Stylize the fill
        //Swift.print("inside drawInContext")
        self.graphics.draw(path)//draw everything
        
    }
    */
}
