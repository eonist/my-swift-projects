import Cocoa

class HSBParser {
    /**
     * Converts a color from RGB format into an HSBColor.
     * @param rgb The RGB color.
     * @return The HSBColor object representing the RGB color. Hue:0-360, Saturate:0-1, brightness:0-1
     */
    class func hsb(rgb:RGB)->HSB{
        let r:CGFloat = rgb.r.cgFloat / 255;let g:CGFloat = rgb.g.cgFloat / 255;let b:CGFloat = rgb.b.cgFloat / 255;
        var hue:CGFloat = 0//<--the zero was recently added to get the code to compile. Shouldnt be there
        var saturation:CGFloat
        var brightness:CGFloat
        let max:CGFloat = Swift.max(r, Swift.max(g, b))
        let min:CGFloat = Swift.min(r, Swift.min(g, b))
        let delta:CGFloat = max - min
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
        Swift.print("hue: " + "\(hue)")
        Swift.print("saturation: " + "\(saturation)")
        Swift.print("brightness: " + "\(brightness)")
        return HSB(abs(hue), abs(saturation), abs(brightness))
    }
    /**
     *
     */
    class func hsb2(rgb:RGB)->HSB{
        let r:CGFloat = rgb.r.cgFloat; let g:CGFloat = rgb.g.cgFloat; let b:CGFloat = rgb.b.cgFloat;
        let hsb:HSB = HSB()
        let max:CGFloat = Swift.max(r,g,b)
        Swift.print("max: " + "\(max)")
        let min:CGFloat = Swift.min(r,g,b)
        hsb.s = (max != 0) ? (max - min) / max * 100 : 0
        hsb.b = max / 255 * 100
        if(hsb.s == 0){
            hsb.h = 0;
        }else{
            switch(max){
                case r:
                    Swift.print("case r")
                    hsb.h = (g - b)/(max - min)*60 + 0
                case g:
                    Swift.print("case g")
                    hsb.h = (b - r)/(max - min)*60 + 120
                case b:
                    Swift.print("case b")
                    hsb.h = (r - g)/(max - min)*60 + 240
                default:break;
            }
        }
        hsb.h = Swift.min(360, Swift.max(0, round(hsb.h)))
        hsb.s = Swift.min(100, Swift.max(0, round(hsb.s)))
        hsb.b = Swift.min(100, Swift.max(0, round(hsb.b)))
        return hsb
    }
}