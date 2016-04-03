import Cocoa

class RGBParser {
    /**
     *  Converts an HSB color specified by the parameters to a uint RGB color.
     *  @param hue The hue. 0-360
     *  @param saturation The saturation. 0-1
     *  @param brightness The brightness. 0-1
     *  @return An RGB color.
     *  @Example: rgbByHue(360,1,1);//0xFF0000
     *  // :TODO: rename to rgbValueByHsb?!?
     */
    class func rgb(hue:CGFloat, _ saturation:CGFloat, _ brightness:CGFloat)->UInt {
        var r:CGFloat 
        var g:CGFloat 
        var b:CGFloat
        if (saturation == 0) {r = brightness; g = brightness;b = brightness}
        else {
            let h:CGFloat = (hue % 360) / 60
            let i:Int = Int(h)
            let f:CGFloat = h - i.cgFloat//<--this seems strange
            let p:CGFloat = brightness * (1 - saturation)
            let q:CGFloat = brightness * (1 - (saturation * f))
            let t:CGFloat = brightness * (1 - (saturation * (1 - f)))
            switch(i) {
                case 0:
                    r = brightness
                    g = t
                    b = p
                    break 
                case 1:
                    r = q                    
                    g = brightness
                    b = p
                    break 
                case 2:
                    r = p
                    g = brightness
                    b = t 
                    break
                case 3:
                    r = p
                    g = q
                    b = brightness
                    break 
                case 4:
                    r = t
                    g = p
                    b = brightness 
                    break
                case 5: 
                    r = brightness
                    g = p
                    b = q
                    break
                default:
                    break;
            }
        }
        r *= 255
        g *= 255
        b *= 255
        let rgb:UInt = (UInt(r) << 16 | UInt(g) << 8 | UInt(b))
        let color:NSColor = NSColorParser.nsColor(rgb)
        return color
    }
}
