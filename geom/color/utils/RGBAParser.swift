import Cocoa

class RGBAParser {
    /**
     * EXAMPLE: rgba(NSColor.redColor()).r//Outputs //1.0
     */
    static func rgba(nsColor:NSColor)->RGBA{//<--was: (r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat)
        let ciColor:CIColor = CIColor(color: nsColor)!
        return RGBA(ciColor.red,ciColor.green,ciColor.blue,ciColor.alpha)
    }
    /**
     *
     */
    class func hex(color:NSColor)->String{
        let rgba:RGBA = RGBAParser.rgba(color)
        HexParser.hexString(rgba, r: <#T##UInt#>, g: <#T##UInt#>, b: <#T##UInt#>)
    }
    /**
     * Converts a 32-bit ARGB color value into an ARGB object.
     * @param color: The 32-bit ARGB color value.
     * @return Returns an object with the properties a, r, g, and b defined.
     * @example
     * var rgb:RGB = rgba(0xFF00FFCC)
     * print("Alpha = " + myRGB.a)
     * print("Red = " + myRGB.r)
     * print("Green = " + myRGB.g)
     * print("Blue = " + myRGB.b)
     */
    static func rgba32(color:UInt) -> RGBA{
        let r = color >> 16 & 0xFF
        let g = color >> 8 & 0xFF
        let b = color & 0xFF
        let a = color >> 24 & 0xFF
        return RGBA(r,g,b,a)
    }
}