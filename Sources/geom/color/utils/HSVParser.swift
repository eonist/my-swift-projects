import Cocoa

class HSVParser {
    /**
     * NOTE: flacky at some values like magenta
     * RETURN: h: 0-240, s: 0-1, v 0-1
     */
    static func hsv(_ rgb:RGB)->HSV{
        let r:CGFloat = rgb.r.cgFloat
        let g:CGFloat = rgb.g.cgFloat
        let b:CGFloat = rgb.b.cgFloat
        let max:CGFloat = Swift.max(r, g, b)
        let min:CGFloat = Swift.min(r, g, b)
        var hue:CGFloat = 0
        var saturation:CGFloat = 0
        var value:CGFloat = 0
        if(max == min){hue = 0}/*get Hue*/
        else if(max == r){hue = (60 * (g-b) / (max-min) + 360) %% 360}
        else if(max == g){hue = (60 * (b-r) / (max-min) + 120)}
        else if(max == b){hue = (60 * (r-g) / (max-min) + 240)}
        value = max/*get Value*/
        saturation = max == 0 ? 0 : (max - min) / max /*get Saturation*/
        return HSV(hue, saturation, value / 255)
    }
}
