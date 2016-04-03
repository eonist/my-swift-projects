import Cocoa
/**
 * HSB, HSL and HSV , hex, cmyk, rgb
 * // :TODO: create new Classes called RGB,HLS,HSV,HSB, internal at first and maybe public later? its benefitial, when you want to use RGB as an argument etc nice!, use ,g,b etc as variables, not red,green,blue etc since these values will be in the calculations and they are easier to read if they are shorthand
 */
class ColorParser {/*Covers returning hex colors etc*/
    /**
     * Converts an RGB color value into a hexidecimal String representation.
     * @param r: A CGFloat from 0 to 1 representing the red color value.
     * @param g: A CGFloat from 0 to 1 representing the green color value.
     * @param b: A CGFloat from 0 to 1 representing the blue color value.
     * @return Returns a hexidecimal color as a String.
     * @example
     * var hexColor : String = ColorParser.hexByRgb(1, 0, 1);
     * print(hexColor); // prints FF00FF
     * TODO: maybe make another method that takes int from 0-255?
     */
    class func hexColor(r:CGFloat,_ g:CGFloat,_ b:CGFloat)->String{
        var rr:String = String(format:"%X", Int(r * 255))
        var gg:String = String(format:"%X", Int(g * 255))
        var bb:String = String(format:"%X", Int(b * 255))
        rr = (rr.count == 1) ? "0" + rr : rr
        gg = (gg.count == 1) ? "0" + gg : gg
        bb = (bb.count == 1) ? "0" + bb : bb
        return (rr + gg + bb)/*.toUpperCase()*/
    }
    /**
     * EXAMPLE: rgba(NSColor.redColor()).r//Outputs //1.0
     */
    class func rgba(nsColor:NSColor)->(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat){
        let ciColor:CIColor = CIColor(color: nsColor)!
        return (ciColor.red,ciColor.green,ciColor.blue,ciColor.alpha)
    }
}

extension ColorParser{
    /**
     * Support for NSColor
     */
    class func hexColor(nsColor:NSColor)->String {
        let rgba = nsColor.rgba
        return ColorParser.hexColor(rgba.r,rgba.g,rgba.b)
    }
}