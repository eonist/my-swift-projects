import Foundation
 /**
  * NOTE: Double.NaN represents stroke:"none" and nil represents no value for stroke, this is important when you export
  * NOTE: Same logic goes for Fill
  * NOTE: why do we use Double and not CGFloat for the color? I dont know, either works, why not use UInt? because UInt doesnt support NaN, May revert to using CGFloat in the future
  * TODO: impliment stroke-dasharray
  */
struct SVGStyle {
    var fill:Any?/*The fill color or SVGLinearGradient instance*/
    var fillOpacity:CGFloat?/*A number ranging from 0.0 to 1.0; 0.0 is entirely transparent, 1.0 is entirely opaque.*/
    var fillRule:String?/*not implimented yet, This attribute can have the values "nonzero" or "evenodd", which apply different rules for determining whether a point is inside or outside a shape. These rules generate different effects only when a shape has intersecting lines or "holes" in it. Details are in "Filling Polygons That Have Intersecting Lines" earlier in this chapter.*/
    var strokeWidth:CGFloat?/*Stroke needs to be of type Any? since it needs to support gradient stroke aswell*/
    var stroke:Any?/*TODO: Stroke needs to be of type Any? since it needs to support gradient stroke aswell*/
    var strokeOpacity:CGFloat?
    var strokeLineCap:String?
    var strokeLineJoin:String?
    var strokeMiterLimit:CGFloat?
    /**
     * NOTE: all values should be nil, since we don't want "none" values by default as these may get exported, and if they didnt exist on the import they should exist on export. nil means no value, none or NaN means variable with none value
     */
    init(_ fill:Any? = nil,_ fillOpacity:CGFloat? = nil,_ fillRule:String? = nil,_ strokeWidth:CGFloat? = nil,_ stroke:Any? = nil ,_ strokeOpacity:CGFloat? = nil,_ strokeLineCap:String? = nil,_ strokeLineJoin:String? = nil, _ strokeMiterLimit:CGFloat? = nil) {
        self.fill = fill
        self.fillOpacity = fillOpacity
        self.fillRule = fillRule
        self.strokeWidth = strokeWidth
        self.stroke = stroke
        self.strokeOpacity = strokeOpacity
        self.strokeLineCap = strokeLineCap
        self.strokeLineJoin = strokeLineJoin
        self.strokeMiterLimit = strokeMiterLimit
    }
}
