import Foundation
/*
 * // :TODO: add an example here
 */
class SVGGradient:SVGElement{
	var offsets : Array<CGFloat>/*How far into the shape this color starts (if the first color of the gradient) or stops (if the last color of the gradient). Specified as percentages of the shape (really the gradient vector) the gradient is applied to. For instance, 10% means that the color should start / stop 10% into the shape.*/
	var colors : Array<CGColor>/*The color of this stop-point. The color the gradient changes from / to.*/
	//var opacities : Array<CGFloat>/*The opacity of the color of this stop-point. If opacity changes from one stop-point with 1 to another stop-point with opacity 0, then the color will gradually become more and more transparent.*/
	var spreadMethod : String/*This value defines how the gradient is spread out through the shape. There are 3 possible values: pad, repeat, and reflect. 'pad' means that the first/last color of the gradient is padded (spread out) before and after the gradient. ''repeat' means that the gradient is repeated throughout the shape. 'reflect' means that gradient is mirrored in the shape. The spread method is only relevant if the gradient does not fill out the shape completely (see offset attributes of the <stop> elements.*/
	var gradientUnits:String /*If the gradientUnits attribute has the value objectBoundingBox, the coordinates are taken as a percentage of bounding box's dimensions (this is the default). If the value is set to userSpaceOnuse, the coordinates are taken to be in the coordinate system used by the object that is being filled.*/
	var gradientTransform:CGAffineTransform?/*Matrix*/
	//gradientTransform /*You can transform (e.g. rotate) the gradient before it is applied. See SVG Transformation for more details.*/

	
    init(_ offsets:Array<CGFloat>,_ colors:Array<CGColor>,/*_ opacities:Array<CGFloat>,*/_ spreadMethod:String,_ id:String,_ gradientUnits:String,_ gradientTransform:CGAffineTransform? = nil/**/) {
		self.offsets = offsets;
		self.colors = colors;
		//self.opacities = opacities;
		self.spreadMethod = spreadMethod;
		self.gradientUnits = gradientUnits;/*Sets whether you want to use the viewbox ('userSpaceOnUse') or the the shape the gradient is applied to, for the calculation of x1, y1 and x2,y2.*/
		self.gradientTransform = gradientTransform;/**/

		super.init(id);
	}
}