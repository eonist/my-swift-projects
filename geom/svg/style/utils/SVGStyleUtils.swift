import Foundation
/**
 * DISCUSSION:Probably move this into a more central place, but in the spirit of moving on!, Or not since its probably only related to how svg names these variables
 * NOTE: these methods provide a central place to convert values from the svg value scheme to the quartz value scheme
 */
class SVGStyleUtils {
    /**
     * TODO: try to find a method in swift that can extract enum values by providing a string
     */
    class func lineCap(lineCap:String?)->CGLineCap{
        let strokeLineCap = lineCap != nil && lineCap != "" ? lineCap : "butt"/*<-this was none, but it doesnt need to be since we wont extract this value from */
        if(strokeLineCap == "butt"){return CGLineCap.Butt}
        else if(strokeLineCap == "round"){return CGLineCap.Round}
        else if(strokeLineCap == "square"){return CGLineCap.Square}
        else{fatalError("this lineCap type is not supported")}
    }
    /**
     *
     */
    class func lineJoin(lineJoin:String?)->CGLineJoin{
        let strokeLineJoin = lineJoin != nil && lineJoin != "" ? lineJoin : "miter";
        if(strokeLineJoin == "miter"){return CGLineJoin.Miter}
        else if(strokeLineJoin == "round"){return CGLineJoin.Round}
        else if(strokeLineJoin == "Bevel"){return CGLineJoin.Bevel}
        else{fatalError("this strokeLineJoin type is not supported")}
    }
    /**
     *
     */
    class func miterLimit(miterLimit:CGFloat)->CGFloat{
        return !miterLimit.isNaN ? miterLimit : 10/*<--was 1.414*/;
    }
    /**
     *
     */
    class func strokeWidth(strokeWidth:CGFloat)->CGFloat{
        return !(strokeWidth.isNaN) ? strokeWidth : 0
    }
}
