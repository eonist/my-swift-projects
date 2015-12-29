import Foundation

class SVGStyleModifier {
    /**
     * Merges if a value isnt present already
     * // :TODO: a boolean flag should toggle overide if a value exists already
     */
    class func merge(a:SVGStyle,_ b:SVGStyle){
        //Swift.print("a.fill: " + a.fill);
        //Swift.print("b.fill: " + b.fill);
        if((a.fill.isNaN) && !(b.fill.isNaN)) {a.fill = b.fill}/*Fill*/
		if(isNaN(a.fillOpacity) && !isNaN(b.fillOpacity)) a.fillOpacity = b.fillOpacity;
		if(a.fillRule == null && b.fillRule != null) a.fillRule = b.fillRule;
		if(isNaN(a.stroke) && !isNaN(b.stroke)) a.stroke = b.stroke;/*Stroke*/
		if(isNaN(a.strokeWidth) && !isNaN(b.strokeWidth)) a.strokeWidth = b.strokeWidth;
		if(isNaN(a.strokeOpacity) && !isNaN(b.strokeOpacity)) a.strokeOpacity = b.strokeOpacity;
		if(a.strokeLineCap == null && b.strokeLineCap != null) a.strokeLineCap = b.strokeLineCap;
		if(a.strokeLineJoin == null && b.strokeLineJoin != null) a.strokeLineJoin = b.strokeLineJoin;
		if(isNaN(a.strokeMiterLimit) && isNaN(b.strokeMiterLimit)) a.strokeMiterLimit = b.strokeMiterLimit;
    }
}
