import Foundation
/**
 * This class creates a straight line
 * TODO: a line can only have a stroke, since it cant be continued as a path would
 * EXAMPLE: <line x1="75" y1="95" x2="135" y2="85" style="stroke: black;" />
 * TODO: simplify by using points , and add id
 */
class SVGLine:SVGGraphic{
    var x1:CGFloat
    var y1:CGFloat
    var x2:CGFloat
    var y2:CGFloat
    init(_ x1:CGFloat,_ y1:CGFloat,_ x2:CGFloat,_ y2:CGFloat,_ style:SVGStyle,_ id:String) {//TODO: figure out if svg supports alpha on line?// :TODO: use p1:Point and p2:Point ?
        self.x1 = x1
        self.y1 = y1
        self.x2 = x2
        self.y2 = y2
        super.init(style,id)
    }
    override func beginFill() {
        /*we override this method to avoid drawing a path in the fill shape*/
    }
    /**
     * NOTE: strokeWidth should always be >= 0 if there is a lineStyle (asserting if there is a linestyle is done by the caller of this method)
     * TODO: you have to set the frame here
     */
    override func draw() {
        let boundingBox:CGRect = CGPointParser.cornersToRectangle(CGPoint(x1,y1),CGPoint(x2, y2))
        let lineOffsetRect = RectGraphicUtils.lineOffsetRect(boundingBox, style!.strokeWidth!, OffsetType(OffsetType.center))
        lineShape.frame = lineOffsetRect.lineFrameRect
        let offset:CGPoint = CGPointParser.difference(lineOffsetRect.lineFrameRect.origin, boundingBox.origin)
        lineShape.path = CGPathParser.line(p1 + offset - boundingBox.origin,p2 + offset - boundingBox.origin)/*<-we offset the original points to make them relative to the frame*/
    }
    required init(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
/**
 * Convenience
 */
extension SVGLine{
    var p1:CGPoint {get{return CGPoint(x1,y1)}set {x1 = newValue.x;y1 = newValue.y}}
    var p2:CGPoint {get{return CGPoint(x2,y2)}set {x2 = newValue.x;y2 = newValue.y}}
}
