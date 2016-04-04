import Cocoa

class HexParser {
    /**
     * Converts an RGB color value into a hexidecimal String representation.
     * @param r: A CGFloat from 0 to 1 representing the red color value.
     * @param g: A CGFloat from 0 to 1 representing the green color value.
     * @param b: A CGFloat from 0 to 1 representing the blue color value.
     * @return Returns a hexidecimal color as a String.
     * EXAMPLE: print(ColorParser.hexByRgb(1, 0, 1)) // prints FF00FF
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
     * EXAMPLE: hexNumber(FF0000)//Output:16711680
     */
    class func hexNumber(hex:String) -> UInt{
        return UInt(Float(hex)!)
    }
    /**
     * EXAMPLE: hexString(16711680)//Output: FF0000
     */
    class func hexString(hex:UInt) -> String{
        return NSString(format: "%2X", hex) as String
    }
    
    /**
     * Convenience method (since extensions can only return one type of each var)
     * EXAMPLE: rgb(NSColor.redColor())//16711680
     */
    class func rgb(color:NSColor) -> UInt{
        return UInt(CGFloat(color.rgb!))
    }
    /**
     * Converts a series of individual RGB(A) values to a 32-bit RGBA color value.    
     * @param r: A uint from 0 to 255 representing the red color value.
     * @param g: A uint from 0 to 255 representing the green color value.
     * @param b: A uint from 0 to 255 representing the blue color value.
     * @param a: A uint from 0 to 255 representing the alpha value. Default is <code>255</code>.
     * @return Returns a hexidecimal color as a String.
     * EXAMPLE:
     * var hexColor : String = ColorUtil.getHexStringFromARGB(128, 255, 0, 255);
     * print(hexColor); // Traces 80FF00FF
     */
    class func rgba(r:UInt, _ g:UInt, _ b:UInt, _ a:UInt = 255) -> UInt {
        return (a << 24) | (r << 16) | (g << 8) | b
    }
    /**
     *
     */
    func hsb(hsb:HSB) -> UInt{
        let rgb:RGB = RGBParser.rgb(hsb)
        let hex:UInt = (rgb.r << 16 | rgb.g << 8 | rgb.b)
        return hex
    }
}
extension HexParser{
     /**
      * Support for NSColor
      * EXAMPLE: NSColor.redColor().hex//FF0000
      * EXAMPLE: Double("0x" + NSColor.red.hex)//255.0  this is great if you need the hex as a Double.
      */
    class func hexColor(nsColor:NSColor)->String {
        let rgba = nsColor.rgba
        return HexParser.hexColor(rgba.r,rgba.g,rgba.b)
    }
}