import Cocoa

class HexParser {
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
}
extension HexParser{
    /**
     * Support for NSColor
     */
    class func hexColor(nsColor:NSColor)->String {
        let rgba = nsColor.rgba
        return HexParser.hexColor(rgba.r,rgba.g,rgba.b)
    }
}