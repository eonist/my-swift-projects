import Cocoa

class HSBParser {
    /**
     * Converts a color from RGB format into an HSBColor.
     * @param rgb The RGB color.
     * @return The HSBColor object representing the RGB color. Hue:0-360, Saturate:0-1, brightness:0-1
     */
    class func hsb(rgb:RGB)->HSBColor {
        var hue:UInt = 0//<--the zero was recently added to get the code to compile. Shouldnt be there
        var saturation:UInt
        var brightness:UInt
        let r:UInt = rgb.r / 255
        let g:UInt = rgb.g / 255
        let b:UInt = rgb.b / 255
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
}