import Foundation
/**
 * Creates an ellipse instance
 * EXAMPLE: <ellipse cx="30" cy="80" rx="10" ry="20" style="stroke: black; fill: none;" />
 */
class SVGEllipse:SVGGraphic{
	var cx:CGFloat/*center x*/
	var cy:CGFloat/*center y*/
	var rx:CGFloat/*radius*/
	var ry:CGFloat
	init(_ cx:CGFloat,_ cy:CGFloat,_ rx:CGFloat,_ ry:CGFloat,_ style:SVGStyle? = nil,_ id:String? = nil) {
		self.cx = cx
		self.cy = cy
		self.rx = rx
		self.ry = ry
		super.init(style, id)
	}
	/**
	 * NOTE: if the cx or cy is omitted (nan), it is presumed to be zero.
	 * NOTE: If the radius is zero, no shape will be displayed
	 * NOTE: it is an error to provide a negative radius.
	 */
	override func draw() {
		if(!(rx.isNaN) && !(ry.isNaN)) {
			//fillShape.path = CGPathParser.ellipse(rx * 2, ry * 2, (!cx.isNaN ? cx : 0)- rx, (!cy.isNaN ? cy : 0)- ry)
            /*Fill*/
            let x:CGFloat = (!cx.isNaN ? cx : 0) - rx
            let y:CGFloat = (!cy.isNaN ? cy : 0) - ry
            let rect:CGRect = CGRect(x, y, rx*2, ry*2)
            let fillFrame = ((style!.stroke != nil && style!.stroke! is Double && !(style!.stroke! as! Double).isNaN)) || (style!.stroke != nil && style!.stroke! is SVGGradient) ? RectGraphicUtils.fillFrame(rect, style!.strokeWidth!, OffsetType(OffsetType.center)) : rect
            fillShape.frame = fillFrame/*Position and set the size of the frame*/
            fillShape.path = CGPathParser.ellipse(rect.width, rect.height, 0, 0)/*draws from the top left corner*/
            /*Line*/
            let lineOffsetRect = RectGraphicUtils.lineOffsetRect(rect, style!.strokeWidth!, OffsetType(OffsetType.center))
            lineShape.frame = lineOffsetRect.lineFrameRect
            lineShape.path = CGPathParser.ellipse(lineOffsetRect.lineRect)
		}
	}
    required init(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
extension SVGEllipse{
    var center:CGPoint {get{return CGPoint(cx,cy)}set{cx = newValue.x;cy = newValue.y}}
    var radius:CGPoint {get{return CGPoint(rx,ry)}set{rx = newValue.x;ry = newValue.y}}
}
