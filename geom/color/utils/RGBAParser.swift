import Cocoa

class RGBAParser {
    /**
     * EXAMPLE: rgba(NSColor.redColor()).r//Outputs //1.0
     * IMPORTANT: this return 0-1.0 values
     */
    static func rgba(nsColor:NSColor)->RGBA{//<--was: (r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat)
        let ciColor:CIColor = CIColor(color: nsColor)!
        return RGBA(ciColor.red * 255,ciColor.green * 255,ciColor.blue * 255,ciColor.alpha * 255)//<--you could just do: color.redComponent.uint etc, nopp you can't, redComponent requires colorspace etc see: http://stackoverflow.com/questions/15682923/convert-nscolor-to-rgb/34115587#34115587
    }
    /**
     * Returns values like: FF0000FF (which is blue with 100% opacity)
     */
    static func hex(color:NSColor)->String{
        let rgba:RGBA = RGBAParser.rgba(color)
        let r:UInt = rgba.r
        //Swift.print("r: " + "\(r)")
        let g:UInt = rgba.g
        //Swift.print("g: " + "\(g)")
        let b:UInt = rgba.b
        ////Swift.print("b: " + "\(b)")
        let a:UInt = rgba.a
        //Swift.print("a: " + "\(a)")
        let hex:String = HexParser.hexString(a,r,g,b)
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
        //Swift.print("rgba32: " + "\(color)")
        let r = color >> 16 & 0xFF
        //Swift.print("r: " + "\(r)")
        let g = color >> 8 & 0xFF
        //Swift.print("g: " + "\(g)")
        let b = color & 0xFF
        //Swift.print("b: " + "\(b)")
        let a = color >> 24 & 0xFF
        Swift.print("a: " + "\(a)")
        return RGBA(r,g,b,a)
    }
    /**
     * rgba32("FF0000FF")//outputs blue with 100% opacity
     */
    static func rgba32(color:String) -> RGBA{
        let uint:UInt = UInt(Double("0x" + color)!)
        return rgba32(uint)
    }
}