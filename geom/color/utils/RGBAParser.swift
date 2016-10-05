import Cocoa

class RGBAParser {
    /**
     * EXAMPLE: rgba(NSColor.redColor()).r//Outputs //1.0
     * TODO: does this return 0-1.0 values or 0-255 values. clearify!
     */
    static func rgba(nsColor:NSColor)->RGBA{//<--was: (r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat)
        let ciColor:CIColor = CIColor(color: nsColor)!
        return RGBA(ciColor.red,ciColor.green,ciColor.blue,ciColor.alpha)
    }
    /**
     * Returns values like: 00FF00FF
     */
    static func hex(color:NSColor)->String{
        let r:UInt = color.redComponent.uint
        Swift.print("r: " + "\(r)")
        let g:UInt = color.redComponent.uint
        Swift.print("g: " + "\(g)")
        let b:UInt = color.redComponent.uint
        Swift.print("b: " + "\(b)")
        let a:UInt = color.alphaComponent.uint
        Swift.print("a: " + "\(a)")
        //let alpha:UInt = (rgba.a / 100) * 255/*we need alpha value to be between 0 and 255*/
        let hex:String = HexParser.hexString(a,r,g,b)
        Swift.print("hex: " + "\(hex)")
        return hex
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