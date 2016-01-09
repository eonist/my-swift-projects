import Foundation

class SVGStyleUtils {
    /**
     * DISCUSSION:Probably move this into a more central place, but in the spirit of moving on!, Or not since its probably only related to how svg names these variables
     * TODO: try to find a method in swift that can extract enum values by providing a string
     */
    class func strokeLineCap(strokeLineCap:String)->CGLineCap{
        if(strokeLineCap == "butt"){return CGLineCap.Butt}
        else if(strokeLineCap == "round"){return CGLineCap.Round}
        else if(strokeLineCap == "square"){return CGLineCap.Square}
        else{fatalError(strokeLineCap + " not supported")}
    }
    class func strokeLineJoin(strokeLineJoin:String)->CGLineJoin{
        if(strokeLineJoin == "miter"){return CGLineJoin.Miter}
        else if(strokeLineJoin == "round"){return CGLineJoin.Round}
        else if(strokeLineJoin == "Bevel"){return CGLineJoin.Bevel}
        else{fatalError(strokeLineJoin + " not supported")}
    }
}
