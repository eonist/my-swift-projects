import Foundation
/**
* This class creates a straight line
* // :TODO: a line can only have a stroke, since it cant be continued as a path would
* @example <line x1="75" y1="95" x2="135" y2="85" style="stroke: black;" />
*/
class SVGLine:SVGGraphic{ // :TODO: simplify by using points , and add id{
    var x1:CGFloat
    var y1:CGFloat
    var x2:CGFloat
    var y2:CGFloat
    init(_ x1:CGFloat,_ y1:CGFloat,_ x2:CGFloat,_ y2:CGFloat,_ style:SVGStyle,_ id:String) {// :TODO: figure out if svg supports alpha on line?// :TODO: use p1:Point and p2:Point ?
        self.x1 = x1
        self.y1 = y1
        self.x2 = x2
        self.y2 = y2
        super.init(style,id);
    }
    override func beginFill() {
        //do nothing
    }
    override func draw() {
        //fillShape.path = CGPathParser.line(CGPoint(x1,y1),CGPoint(x2, y2))
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
