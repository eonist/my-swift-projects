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
    /**
     *  Converts a color from RGB format into an HSBColor.
     *  @param rgb The RGB color.
     *  @return The HSBColor object representing the RGB color. Hue:0-360, Saturate:0-1, brightness:0-1
     */
    class func hsb(color:NSColor)->HSBColor {
        //let someColor:NSColor = NSColor.redColor()
        let rgb:UInt = ColorUtils.rgb(color)
        var hue:UInt = 0//<--the zero was recently added to get the code to compile. Shouldnt be there
        var saturation:UInt
        var brightness:UInt
        let r:UInt = ((rgb >> 16) & 0xff) / 255
        let g:UInt = ((rgb >> 8) & 0xff) / 255
        let b:UInt = (rgb & 0xff) / 255
        let max:UInt = Swift.max(r, Swift.max(g, b))
        let min:UInt = Swift.min(r, Swift.min(g, b))
        let delta:UInt = max - min
        brightness = max
        saturation = max != 0 ? delta / max : 0
        if (saturation == 0) {hue = 0} /*this was set to NaN, but 0 seemed more suitable*/
        else {
            if(r == max){
                hue = (g - b) / delta
            }else if(g == max){
                hue = 2 + (b - r) / delta
            }else if(b == max){
                hue = 4 + (r - g) / delta
                hue = hue * 60
                if(hue < 0) {hue += 360}
            }
        }
        return HSBColor(hue.cgFloat, saturation.cgFloat, brightness.cgFloat)
    }
    /**
     * @Note flacky at some values like magenta
     * @return h: 0-240, s: 0-1, v 0-1
     */
    class func hsv(r:CGFloat, _ g:CGFloat, _ b:CGFloat)->HSV{
        let max:CGFloat = Swift.max(r, g, b)
        let min:CGFloat = Swift.min(r, g, b)
        var hue:CGFloat = 0
        var saturation:CGFloat = 0
        var value:CGFloat = 0
        if(max == min){hue = 0}/*get Hue*/
        else if(max == r){hue = (60 * (g-b) / (max-min) + 360) % 360}
        else if(max == g){hue = (60 * (b-r) / (max-min) + 120)}
        else if(max == b){hue = (60 * (r-g) / (max-min) + 240)}
        value = max/*get Value*/
        saturation = max == 0 ? 0 : (max - min) / max /*get Saturation*/
        return HSV(hue, saturation, (value / 255))
    }
    /**
     * @return 
     */
    class func hsv(color:NSColor)->HSV {
        let rgb = ColorParser.rgba(color)
        return ColorParser.hsv(rgb.r,rgb.g,rgb.b)
    }
    /**
     *
     */
    class func hls(color:NSColor)->HLS{
        let rgb = ColorParser.rgba(color)
        return ColorParser.hls(rgb.r,rgb.g,rgb.b)
    }
    /**
     * This was created with references to a few anonymous calculations written in other languages, None of which were very accurate
     * @Note // You can compare these values to those produced in the Windows Color Picker (MS Paint, etc)
     * @Example
     * var r:uint = 145;
     * var g:uint = 100;
     * var b:uint = 120;
     * var hls:Object = hlsByRgb(r,g,b);
     * print(hls.h);   // outputs a scale of 0-240
     * print(hls.l);   // outputs a scale of 0-240
     * print(hls.s);   // outputs a scale of 0-240
     * NOTE: We cant use UInt here because UInt doesnt support NaN
     */
    class func hls(r:CGFloat,_ g:CGFloat,_ b:CGFloat)->HLS {
        var h:CGFloat = 0//<<--this wasnt here before but its need to be able to compile. 
        var l:CGFloat
        var s:CGFloat
        let max:CGFloat = (Swift.max(Swift.max(r, g), b))/255
        let min:CGFloat = (Swift.min(Swift.min(r, g), b))/255
        let delta:CGFloat = max-min
        l = (max+min)/2
        s = (max == min) ? 0 : ((l <= 0.5) ? delta/l/2 : delta/(2-l*2))
        if(r/255 == max) {h = (g-b)/delta/255}
        else if(g/255 == max) {h = 2+(b-r)/delta/255}
        else if(b/255 == max) {h = 4+(r-g)/delta/255}
        h *= 40
        if(h < 0) {h += 240}
        h = round(h)
        return HLS(((h.isNaN) ? 0 : h), round(l*240), round(s*240))
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