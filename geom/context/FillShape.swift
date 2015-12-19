import Foundation

class FillShape :Shape{
    var fillStyle:IFillStyle?;
    override init(_ frame:NSRect){
        super.init(frame)
        
    }
    

    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
        
    
    
    
    override func drawInContext(ctx: CGContext) {
        Swift.print("FillShape.drawInContext")
        graphics.context = ctx
        
        //TODO:you only need to call the draw method from here, the fill setting etc can be done in the decoratable classes
        
        self.graphics.fill(fillStyle!.color)//Stylize the fill
        self.graphics.draw(path)//draw everything
        
    }
}
