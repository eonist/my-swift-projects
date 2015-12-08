import Cocoa

class ColorParser {/*Covers returning hex colors etc*/
    /**
     *
     */
    class func hexColor2(nsColor:NSColor)->String{
        let rgba = nsColor.rgba
        /*
        let rgbString:String = "\(UInt(rgba.r * 255))"
        Swift.print("rgbString: " + rgbString)
        let rgbValue = (rgba.r + rgba.g + rgba.b)
        Swift.print("rgbValue" + "\(rgbValue)")
        */
        let tempRGB = StringParser.color("FF0000")
        Swift.print("tempRGB: " + "\(tempRGB)")
        
        let hexValue = String(format:"%X", Int(rgba.r * 255)) + String(format:"%X", Int(rgba.g * 255)) + String(format:"%X", Int(rgba.b * 255))
        Swift.print("hexValue: " + "\(hexValue)")
        
        let stringR = UIntParser.digit(UInt(rgba.r * 255), 3)
        Swift.print("stringR: " + "\(stringR)")
        let stringG = UIntParser.digit(UInt(rgba.g * 255), 3)
        Swift.print("stringG: " + "\(stringG)")
        let stringB = UIntParser.digit(UInt(rgba.b * 255), 3)
        Swift.print("stringB: " + "\(stringB)")
        let temp:String = stringR + stringG + stringB
        Swift.print("temp: " + "\(temp)")
        let numericTemp:Double = Double(temp)!
        let floatTemp:Float = Float(numericTemp)
        let intTemp:Int = Int(floatTemp)
        let uintTemp:UInt = UInt(intTemp)
        return ColorUtils.hexString(uintTemp)
    }
    /**
     * Converts an RGB color value into a hexidecimal String representation.
     * @param r: A uint from 0 to 255 representing the red color value.
     * @param g: A uint from 0 to 255 representing the green color value.
     * @param b: A uint from 0 to 255 representing the blue color value.
     * @return Returns a hexidecimal color as a String.
     * @example
     * var hexColor : String = ColorParser.hexByRgb(255, 0, 255);
     * trace(hexColor); // Traces FF00FF
     */
    class func hexColor(nsColor:NSColor)->String {
        let rgba = nsColor.rgba
        var rr:String = String(format:"%X", Int(rgba.r * 255));
        var gg:String = String(format:"%X", Int(rgba.g * 255));
        var bb:String = String(format:"%X", Int(rgba.b * 255));
        rr = (rr.count == 1) ? "0" + rr : rr;
        gg = (gg.count == 1) ? "0" + gg : gg;
        bb = (bb.count == 1) ? "0" + bb : bb;
        return (rr + gg + bb)/*.toUpperCase()*/;
    }
    /**
     * EXAMPLE: rgba(NSColor.redColor()).r//Outputs //1.0
     */
    class func rgba(nsColor:NSColor)->(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat){
        let ciColor:CIColor = CIColor(color: nsColor)!
        return (ciColor.red,ciColor.green,ciColor.blue,ciColor.alpha)
    }
}
