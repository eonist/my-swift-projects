import Foundation
/*
 * TODO: add an example here
 * FACT: 1. if you use userSpaceOnUse and % values from 0 to 100% then the svg-view box is used to calculate the position of the start and end gradient points. multiply width and height with 0 to 1 to represent 0% to 100% values
 * FACT: 2. if you use userSpaceOnUse and non-percentage values then the gradient points are set in the coordinatespce of the viewBox (aboslute values)
 * FACT: 3. if you use objectBoundingBox and % values from 0 to 100% then the boundingbox of the path is used to calculate the postion of the gradient start and end. multiply with and height with 0 to 1 to represent 0% to 100% values
 * FACT: 4. if you use objectBoundingBox and non-percentage values then the points are set in the coordinatespace of the boundingBox of the path (aboslute values)
 * FACT: gradientUnits="'userSpaceOnUse' or 'objectBoundingBox'. Use the view box or object to determine relative position of vector points. (Default 'objectBoundingBox')"
 * FACT: gradientTransform="the transformation to apply to the gradient"
 * FACT: x1="the x start point of the gradient vector (number or % - 0% is default)"
 * FACT: y1="the y start point of the gradient vector. (0% default)"
 * FACT: x2="the x end point of the gradient vector. (100% default)"
 * FACT: y2="the y end point of the gradient vector. (0% default)"
 * NOTE: there is also preserveAspectRatio in the SVG specs
 * NOTE: The opacity of the color of this stop-point. If opacity changes from one stop-point with 1 to another stop-point with opacity 0, then the color will gradually become more and more transparent.
 */
struct SVGGradient:SVGGradientKind{
    var element:SVGElementKind
	var offsets:[CGFloat]/*How far into the shape this color starts (if the first color of the gradient) or stops (if the last color of the gradient). Specified as percentages of the shape (really the gradient vector) the gradient is applied to. For instance, 10% means that the color should start / stop 10% into the shape.*/
	var colors:[CGColor]/*The color of this stop-point. The color the gradient changes from / to.*/
	var spreadMethod:String/*This value defines how the gradient is spread out through the shape. There are 3 possible values: pad, repeat, and reflect. 'pad' means that the first/last color of the gradient is padded (spread out) before and after the gradient. ''repeat' means that the gradient is repeated throughout the shape. 'reflect' means that gradient is mirrored in the shape. The spread method is only relevant if the gradient does not fill out the shape completely (see offset attributes of the <stop> elements.*/
	var gradientUnits:String /*If the gradientUnits attribute has the value objectBoundingBox, the coordinates are taken as a percentage of bounding box's dimensions (this is the default). If the value is set to userSpaceOnuse, the coordinates are taken to be in the coordinate system used by the object that is being filled.*/
	var gradientTransform:CGAffineTransform?/*You can transform (e.g. rotate) the gradient before it is applied. See SVG Transformation for more details.*/
    init(_ offsets:[CGFloat],_ colors:[CGColor],_ spreadMethod:String,_ id:String,_ gradientUnits:String,_ gradientTransform:CGAffineTransform? = nil) {
		self.offsets = offsets
		self.colors = colors
		self.spreadMethod = spreadMethod
		self.gradientUnits = gradientUnits/*Sets whether you want to use the viewbox ('userSpaceOnUse') or the the shape the gradient is applied to, for the calculation of x1, y1 and x2,y2.*/
		self.gradientTransform = gradientTransform
		self.element = SVGElement(id)
	}
}
