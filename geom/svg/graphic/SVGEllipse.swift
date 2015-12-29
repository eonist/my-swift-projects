import Foundation
/**
 * Creates an ellipse instance
 * @example <ellipse cx="30" cy="80" rx="10" ry="20" style="stroke: black; fill: none;" />
 */
class SVGEllipse : SVGGraphic{
	var cx : CGFloat;//center x
	var cy : CGFloat;//center y
	var rx : CGFloat;
	var ry : CGFloat;
	init(_ cx:CGFloat,_ cy:CGFloat,_ rx:CGFloat,_ ry:CGFloat,_ style:SVGStyle? = nil,_ id:String? = nil) {
		self.cx = cx;
		self.cy = cy;
		self.rx = rx;
		self.ry = ry;
		super.init(style, id);
	}
	/**
	 * @Note if the cx or cy is omitted (nan), it is presumed to be zero.
	 * @Note If the radius is zero, no shape will be displayed
	 * @Note it is an error to provide a negative radius.
	 */
	override func draw() {
		if(!(rx.isNaN) && !(ry.isNaN)) {
			//fillShape.path = CGPathParser.ellipse(rx * 2, ry * 2, (!cx.isNaN ? cx : 0)- rx, (!cy.isNaN ? cy : 0)- ry)
		}
	}
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
