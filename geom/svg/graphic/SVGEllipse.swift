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
		super(style, id);
	}
	//----------------------------------
	//  core methods
	//----------------------------------
	/**
	 * @Note if the cx or cy is omitted (nan), it is presumed to be zero.
	 * @Note If the radius is zero, no shape will be displayed
	 * @Note it is an error to provide a negative radius.
	 */
	override public function draw() : void {
		if(!isNaN(_rx) && !isNaN(_ry)) {
			graphics.drawEllipse((!isNaN(_cx) ? _cx : 0) - _rx, (!isNaN(_cy) ? _cy : 0) - _ry, _rx * 2, _ry * 2)
		}
	}
}
