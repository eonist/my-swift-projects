import Cocoa

class ColorParser {/*Covers returning hex colors etc*/
    /**
     * 
     */
    class func hexColor(nsColor:NSColor)->String{
        let rgba = nsColor.rgba
        let rgbString:String = "\(UInt(rgba.r * 255))" 
        Swift.print("rgbString: " + rgbString)
        let rgbValue = (rgba.r + rgba.g + rgba.b)
        Swift.print("rgbValue" + "\(rgbValue)")
        return ColorUtils.hexString(UInt(rgbValue))
    }
    /**
     * EXAMPLE: rgba(NSColor.redColor()).r//Outputs //1.0
     */
    class func rgba(nsColor:NSColor)->(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat){
        let ciColor:CIColor = CIColor(color: nsColor)!
        return (ciColor.red,ciColor.green,ciColor.blue,ciColor.alpha)
    }
}
