import Foundation
class LineGraphic:SizeableDecorator {
    var p1:CGPoint;
    var p2:CGPoint;
    init(_ p1:CGPoint = CGPoint(), _ p2:CGPoint = CGPoint(), _ decoratable:GraphicDecoratableKind = BaseGraphic(nil,LineStyle())) {
        self.p1 = p1
        self.p2 = p2
        super.init(decoratable)
    }
    override func drawLine() {
        let pos:CGPoint = getPosition()
        let size:CGSize = getSize()
        let rect:CGRect = CGRect(pos,size)
        let lineOffsetRect = RectGraphicUtils.lineOffsetRect(rect, graphic.lineStyle!.thickness, graphic.lineOffsetType)
        graphic.lineShape.frame = lineOffsetRect.lineFrameRect
        let a:CGPoint = lineOffsetRect.lineRect.topLeft + p1-pos//<--p1,p2 is now in 0,0 coordinate space. Since the frame should only cover the actual path. We also offset the points to support the lineoffset
        let b:CGPoint = lineOffsetRect.lineRect.topLeft + p2-pos
        graphic.lineShape.path = CGPathParser.line(a, b)
    }
    override func drawFill() {
        /*Must be overriden, there is no fill when using the LineGraphic*/
    }
    func setPoints(_ p1:CGPoint, _ p2:CGPoint) {
        self.p1 = p1
        self.p2 = p2
        draw()//<--new
    }
    /**
     * Untested
     */
    override func getSize()->CGSize{
        let relativeDifference = CGPointParser.relativeDifference(getPosition(), CGPoint(max(p1.x,p2.x),max(p1.y,p2.y)))
        return CGSize(relativeDifference.x,relativeDifference.y)
    }
    /**
     * Returns the boundingBox topLeft corner
     * Untested
     */
    override func getPosition() -> CGPoint {
        return CGPoint(min(p1.x,p2.x),min(p1.y,p2.y))//topLeft
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}

