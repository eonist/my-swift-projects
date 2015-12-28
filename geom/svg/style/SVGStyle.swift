import Foundation
/**
 * // :TODO: impliment stroke-dasharray
 */
class SVGStyle {
    var fill : *;/*The fill color or SVGLinearGradient instance*/
    var fillOpacity : CGFloat;/*A number ranging from 0.0 to 1.0; 0.0 is entirely transparent, 1.0 is entirely opaque.*/
    var fillRule : String;/*not implimented yet, This attribute can have the values "nonzero" or "evenodd", which apply different rules for determining whether a point is inside or outside a shape. These rules generate different effects only when a shape has intersecting lines or "holes" in it. Details are in "Filling Polygons That Have Intersecting Lines" earlier in this chapter.*/
    var strokeWidth : CGFloat;
    var stroke : CGFloat;
    var strokeOpacity : CGFloat;
    var strokeLineCap : String;
    var strokeLineJoin : String;
    var strokeMiterLimit : CGFloat;
    init(fill:* = NaN,fillOpacity:CGFloat = NaN,fillRule:String = null,strokeWidth:CGFloat = NaN,stroke:Number = NaN ,strokeOpacity:CGFloat = NaN,strokeLineCap:String = null,strokeLineJoin:String = null, strokeMiterLimit:CGFloat = NaN) {
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
