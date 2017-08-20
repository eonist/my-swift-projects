import Foundation

class SVGStyleModifier {
    /**
     * Merges if a value isn't present already
     * TODO: ⚠️️ A boolean flag should toggle overide if a value exists already
     */
    static func merge(_ a:inout SVGStyle,_ b:SVGStyle){
        if(!(a.fill is Double) && !(b.fill is Double)) || ((a.fill as! Double).isNaN && !(b.fill as! Double).isNaN) {a.fill = b.fill}/*Fill*/
        if(a.fillOpacity == nil || a.fillOpacity!.isNaN) && (b.fillOpacity != nil && !b.fillOpacity!.isNaN) {a.fillOpacity = b.fillOpacity}
        if a.fillRule == nil && b.fillRule != nil {a.fillRule = b.fillRule}
        if (!(a.stroke is Double) && !(b.stroke is Double)) || ((a.stroke as! Double).isNaN && !(b.stroke as! Double).isNaN) {a.stroke = b.stroke}/*Stroke*/
        if (a.strokeWidth == nil || a.strokeWidth!.isNaN) && (a.strokeWidth != nil && !b.strokeWidth!.isNaN) {a.strokeWidth = b.strokeWidth}
        if (a.strokeOpacity == nil || a.strokeOpacity!.isNaN) && (a.strokeOpacity != nil && !b.strokeOpacity!.isNaN) {a.strokeOpacity = b.strokeOpacity}
		if a.strokeLineCap == nil && b.strokeLineCap != nil {a.strokeLineCap = b.strokeLineCap}
		if a.strokeLineJoin == nil && b.strokeLineJoin != nil {a.strokeLineJoin = b.strokeLineJoin}
		if a.strokeMiterLimit == nil || a.strokeMiterLimit!.isNaN && (b.strokeMiterLimit != nil && !b.strokeMiterLimit!.isNaN) {a.strokeMiterLimit = b.strokeMiterLimit}
    }
}
