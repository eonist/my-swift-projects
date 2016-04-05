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
        return HSB(abs(hue).uint, abs(saturation).uint, abs(brightness).uint)
    }
    /**
     *
     */
    class func hsb2(rgb:RGB)->HSB{
        let r:CGFloat = rgb.r.cgFloat; let g:CGFloat = rgb.g.cgFloat; let b:CGFloat = rgb.b.cgFloat;
        
        var h:CGFloat; var s:CGFloat; var b:CGFloat;
        var _max:CGFloat = Swift.max(r,g,b)
        var _min:CGFloat = Swift.min(r,g,b)
        
        hsb.s = (_max != 0) ? (_max - _min) / _max * 100 : 0
        hsb.b = _max / 255 * 100
        
        if(hsb.s == 0){
            hsb.h = 0;
        }else{
            switch(_max)
            {
            case r:
                hsb.h = (g - b)/(_max - _min)*60 + 0;
                break;
            case g:
                hsb.h = (b - r)/(_max - _min)*60 + 120;
                break;
            case b:
                hsb.h = (r - g)/(_max - _min)*60 + 240;
                break;
            }
        }
        
        hsb.h = Math.min(360, Math.max(0, Math.round(hsb.h)))
        hsb.s = Math.min(100, Math.max(0, Math.round(hsb.s)))
        hsb.b = Math.min(100, Math.max(0, Math.round(hsb.b)))
        
        return hsb;
        
        
        // OUTPUT
        // RGB: 51, 102, 0
        // HSB: 90, 100, 40
    }
}