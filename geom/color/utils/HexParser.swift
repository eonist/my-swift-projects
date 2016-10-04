import Cocoa

class HexParser {
    /**
     * EXAMPLE: hexNumber(FF0000)//Output:16711680
     */
    static func hexValue(hex:String) -> UInt{
        return UInt(Float(hex)!)
    }
    /**
     * Convenience method (since extensions can only return one type of each var)
     * EXAMPLE: rgb(NSColor.redColor())//16711680
     */
    static func hexValue(color:NSColor) -> UInt{
        return UInt(CGFloat(color.hexVal!))
    }
    static func hexValue(color:NSColor) -> Double?{
        return Double("0x" + HexParser.hexString(color))
    }
    /**
     *
     */
    func hexValue(hsb:HSB) -> UInt{
        let rgb:RGB = RGBParser.rgb(hsb)
        let hex:UInt = (rgb.r << 16 | rgb.g << 8 | rgb.b)
        return hex
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
     * print(hexColor); // prints 80FF00FF
     */
    static func hexValue(r:UInt, _ g:UInt, _ b:UInt, _ a:UInt = 255) -> UInt {
        return (a << 24) | (r << 16) | (g << 8) | b
    }
    
    /**
     * EXAMPLE: hexString(16711680)//Output: FF0000
     */
    static func hexString(hex:UInt) -> String{
        return NSString(format: "%2X", hex) as String
    }
    /**
     * Converts a 32-bit ARGB color value into a hexidecimal String representation.
     * 
     * @param a: A uint from 0 to 255 representing the alpha value.
     * @param r: A uint from 0 to 255 representing the red color value.
     * @param g: A uint from 0 to 255 representing the green color value.
     * @param b: A uint from 0 to 255 representing the blue color value.
     * @return Returns a hexidecimal color as a String.
     * @example
     * <code>
     * var hexColor : String = hexString(128, 255, 0, 255);
     * print(hexColor) // Prints 80FF00FF
     * </code>
     */
    static func hexString(a:UInt, _ r:UInt, _ g:UInt, _ b:UInt) -> String {
        
        var aa:String = String(format:"%X", Int(a))
        var rr:String = String(format:"%X", Int(r))
        var gg:String = String(format:"%X", Int(g))
        var bb:String = String(format:"%X", Int(b))
        
        aa = (rr.count == 1) ? "0" + aa : aa
        rr = (rr.count == 1) ? "0" + rr : rr
        gg = (gg.count == 1) ? "0" + gg : gg
        bb = (bb.count == 1) ? "0" + bb : bb
        return (aa + rr + gg + bb).uppercaseString
   
    }
    /**
     * Support for NSColor
     * EXAMPLE: NSColor.redColor().hex//FF0000
     * EXAMPLE: Double("0x" + NSColor.red.hex)//255.0  this is great if you need the hex as a Double.
     */
    static func hexString(nsColor:NSColor)->String {
        let rgb:RGB = nsColor.rgb
        return HexParser.hexString(rgb.r.cgFloat,rgb.g.cgFloat,rgb.b.cgFloat)
    }
    /**
     * Converts an RGB color value into a hexidecimal String representation.
     * @param r: A CGFloat from 0 to 1 representing the red color value.
     * @param g: A CGFloat from 0 to 1 representing the green color value.
     * @param b: A CGFloat from 0 to 1 representing the blue color value.
     * @return Returns a hexidecimal color as a String.
     * EXAMPLE: print(ColorParser.hexByRgb(1, 0, 1)) // prints FF00FF
     * TODO: maybe make another method that takes int from 0-255?
     */
    static func hexString(r:CGFloat,_ g:CGFloat,_ b:CGFloat)->String{
        var rr:String = String(format:"%X", Int(r))
        var gg:String = String(format:"%X", Int(g))
        var bb:String = String(format:"%X", Int(b))
        rr = (rr.count == 1) ? "0" + rr : rr
        gg = (gg.count == 1) ? "0" + gg : gg
        bb = (bb.count == 1) ? "0" + bb : bb
        return (rr + gg + bb)/*.toUpperCase()*/
    } 
}