import Foundation

class FillShape :Shape{
    var fillStyle:IFillStyle?
    init(_ fillStyle:IFillStyle? = nil) {
        super.init()
        self.fillStyle = fillStyle
    }
    override func drawInContext(ctx: CGContext) {
        if(fillStyle != nil){
            self.graphics.context = ctx
            self.graphics.fill(fillStyle!.color)
            //fillShape.graphics.gradientFill((a.fillStyle as! GradientFillStyle).gradient)
            self.graphics.drawFill(self.path)
        }
    }
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
