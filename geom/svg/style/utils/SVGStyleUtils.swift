import Foundation
/**
 * DISCUSSION:Probably move this into a more central place, but in the spirit of moving on!, Or not since its probably only related to how svg names these variables
 * NOTE: these methods provide a central place to convert values from the svg value scheme to the quartz value scheme
 */
class SVGStyleUtils {
    /**
     * TODO: try to find a method in swift that can extract enum values by providing a string
     */
    class func lineCap(strokeLineCap:String)->CGLineCap{
        if(strokeLineCap == "butt"){return CGLineCap.Butt}
        else if(strokeLineCap == "round"){return CGLineCap.Round}
        else if(strokeLineCap == "square"){return CGLineCap.Square}
        else{fatalError(strokeLineCap + " not supported")}
    }
    class func lineJoin(strokeLineJoin:String)->CGLineJoin{
        if(strokeLineJoin == "miter"){return CGLineJoin.Miter}
        else if(strokeLineJoin == "round"){return CGLineJoin.Round}
        else if(strokeLineJoin == "Bevel"){return CGLineJoin.Bevel}
        else{fatalError(strokeLineJoin + " not supported")}
    }
    /**
     * 
     */
    class func miterLimit(strokeMiterLimit:CGFloat)->CGFloat{
        return !strokeMiterLimit.isNaN ? strokeMiterLimit : 10/*<--was 1.414*/;
    }
}
