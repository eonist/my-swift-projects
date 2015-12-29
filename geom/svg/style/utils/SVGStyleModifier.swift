import Foundation

class SVGStyleModifier {
    /**
     * Merges if a value isnt present already
     * // :TODO: a boolean flag should toggle overide if a value exists already
     */
    class func merge(a:SVGStyle,_ b:SVGStyle){
        //Swift.print("a.fill: " + a.fill);
        //Swift.print("b.fill: " + b.fill);
        if((!(a.fill is Double) && !(b.fill is Double)) || ((a.fill as! Double).isNaN && !(b.fill as! Double).isNaN)) {a.fill = b.fill}/*Fill*/
        if((a.fillOpacity.isNaN) && !(b.fillOpacity.isNaN)) {a.fillOpacity = b.fillOpacity}
        if(a.fillRule == nil && b.fillRule != nil) {a.fillRule = b.fillRule}
        if(a.stroke.isNaN && !(b.stroke.isNaN)) {a.stroke = b.stroke}/*Stroke*/
        if((a.strokeWidth.isNaN) && !(b.strokeWidth.isNaN)) {a.strokeWidth = b.strokeWidth}
        if((a.strokeOpacity.isNaN) && !(b.strokeOpacity.isNaN)) {a.strokeOpacity = b.strokeOpacity}
		if(a.strokeLineCap == nil && b.strokeLineCap != nil) {a.strokeLineCap = b.strokeLineCap}
		if(a.strokeLineJoin == nil && b.strokeLineJoin != nil) {a.strokeLineJoin = b.strokeLineJoin}
		if((a.strokeMiterLimit.isNaN) && (b.strokeMiterLimit.isNaN)) {a.strokeMiterLimit = b.strokeMiterLimit}
    }
}
