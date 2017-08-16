import Foundation

protocol SVGGradientDecoratable:SVGGradientKind{
    var gradient:SVGGradientKind {get set}
}
extension SVGGradientDecoratable{
    var element:SVGElementKind {get{return gradient.element} set{gradient.element = newValue}}
    var offsets:[CGFloat] {get{return gradient.offsets} set{gradient.offsets = newValue}}
    var colors:[CGColor] {get{return gradient.colors} set{gradient.colors = newValue}}
    var spreadMethod:String {get{return gradient.spreadMethod} set{gradient.spreadMethod = newValue}}
    var gradientUnits:String {get{return gradient.gradientUnits} set{gradient.gradientUnits = newValue}}
    var gradientTransform:CGAffineTransform? {get{return gradient.gradientTransform} set{gradient.gradientTransform = newValue}}
}
