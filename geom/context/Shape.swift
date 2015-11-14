import Foundation

class Shape:FlippedView{
    var hasClear:Bool = false
    var graphics:Graphics
    init(_ width:Int = 400, _ height:Int = 400) {
        let frame = NSRect(x: 0, y: 0, width: width, height: height)
        graphics = Graphics()
        super.init(frame: frame)
        self.wantsLayer = false//this avoids calling drawLayer() and enables drawingRect()
        
    }
    /*
    * Required by super class
    */
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /**
     *
     */
    override func drawRect(dirtyRect: NSRect) {
        Swift.print("drawRect: " + "\(hasClear)")
        if(!hasClear){
            var path:CGPath = CGPathParser.rect(200,200)//Shapes
            //CGPathModifier.translate(&path,CGFloat(x),CGFloat(y))//Transformations
            //graphics.line(12)//Stylize the line
            //graphics.fill(color)//Stylize the fill
            graphics.draw(path)//draw everything
            hasClear = false;
        }
        
        
        
        
        //super.drawRect(dirtyRect)
    }
    /**
     *
     */
    func clear(){
        Swift.print("clear()")
        hasClear = true
        //drawRect(frame)
        needsDisplay = true
    }
}
