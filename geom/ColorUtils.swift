import Cocoa

class ColorUtils {
    /**
    * untested
    */
    class func  nsColor(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat)->NSColor{
       return NSColor.init(calibratedRed: r/255, green: g/255, blue: b/255, alpha: a)
    }
}