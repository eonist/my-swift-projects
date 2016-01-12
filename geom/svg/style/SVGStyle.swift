import Foundation
/**
 * // :TODO: impliment stroke-dasharray
 */
class SVGStyle {
    var fill : Any?/*The fill color or SVGLinearGradient instance*/
    var fillOpacity : CGFloat/*A number ranging from 0.0 to 1.0; 0.0 is entirely transparent, 1.0 is entirely opaque.*/
    var fillRule : String?/*not implimented yet, This attribute can have the values "nonzero" or "evenodd", which apply different rules for determining whether a point is inside or outside a shape. These rules generate different effects only when a shape has intersecting lines or "holes" in it. Details are in "Filling Polygons That Have Intersecting Lines" earlier in this chapter.*/
    var strokeWidth : CGFloat/*Stroke needs to be of type Any? since it needs to support gradient stroke aswell*/
    var stroke : Any?/*TODO: Stroke needs to be of type Any? since it needs to support gradient stroke aswell*/
    var strokeOpacity : CGFloat
    var strokeLineCap : String?
    var strokeLineJoin : String?
    var strokeMiterLimit : CGFloat
    
    //CGFloat.NaN should probably be nil instead?
    
    init(_ fill:Any? = CGFloat.NaN,_ fillOpacity:CGFloat = CGFloat.NaN,_ fillRule:String? = nil,_ strokeWidth:CGFloat = CGFloat.NaN,_ stroke:Any? = CGFloat.NaN ,_ strokeOpacity:CGFloat = CGFloat.NaN,_ strokeLineCap:String? = nil,_ strokeLineJoin:String? = nil, _ strokeMiterLimit:CGFloat = CGFloat.NaN) {
        self.fill = fill;
        self.fillOpacity = fillOpacity;
        self.fillRule = fillRule;
        self.strokeWidth = strokeWidth;
        self.stroke = stroke;
        self.strokeOpacity = strokeOpacity;
        self.strokeLineCap = strokeLineCap;
        self.strokeLineJoin = strokeLineJoin;
        self.strokeMiterLimit = strokeMiterLimit;
    }
}