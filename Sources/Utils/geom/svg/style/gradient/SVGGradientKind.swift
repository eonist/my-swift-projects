import Foundation
/**
 * NOTE: this isn't really needed, but its more futureproof to code against a protocol than a class (The negative side is that it adds more code to maintain)
 * NOTE: The opacity of the color of this stop-point. If opacity changes from one stop-point with 1 to another stop-point with opacity 0, then the color will gradually become more and more transparent.
 */
protocol SVGGradientKind:SVGElementKind {
    var element:SVGElementKind {get set}
    var offsets:[CGFloat]{get set}/*How far into the shape this color starts (if the first color of the gradient) or stops (if the last color of the gradient). Specified as percentages of the shape (really the gradient vector) the gradient is applied to. For instance, 10% means that the color should start / stop 10% into the shape.*/
    var colors:[CGColor]{get set}/*The color of this stop-point. The color the gradient changes from / to.*/
    var spreadMethod:String{get set}/*This value defines how the gradient is spread out through the shape. There are 3 possible values: pad, repeat, and reflect. 'pad' means that the first/last color of the gradient is padded (spread out) before and after the gradient. ''repeat' means that the gradient is repeated throughout the shape. 'reflect' means that gradient is mirrored in the shape. The spread method is only relevant if the gradient does not fill out the shape completely (see offset attributes of the <stop> elements.*/
    var gradientUnits:String{get set} /*If the gradientUnits attribute has the value objectBoundingBox, the coordinates are taken as a percentage of bounding box's dimensions (this is the default). If the value is set to userSpaceOnuse, the coordinates are taken to be in the coordinate system used by the object that is being filled.*/
    var gradientTransform:CGAffineTransform?{get set}/*You can transform (e.g. rotate) the gradient before it is applied. See SVG Transformation for more details.*/
}
extension SVGGradientKind{
    var id: String {get {return element.id} set {element.id = newValue}}
}
