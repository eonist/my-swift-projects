import Cocoa

class HLSParser {
    /**
     * This was created with references to a few anonymous calculations written in other languages, None of which were very accurate
     * NOTE: You can compare these values to those produced in the Windows Color Picker (MS Paint, etc)
     * NOTE: We can't use UInt here because UInt doesnt support NaN
     * EXAMPLE:
     * var r:uint = 145
     * var g:uint = 100
     * var b:uint = 120
     * var hls:Object = hlsByRgb(r,g,b);
     * print(hls.h)   // outputs a scale of 0-240
     * print(hls.l)   // outputs a scale of 0-240
     * print(hls.s)  // outputs a scale of 0-240
     */
    static func hls(_ rgb:RGB)->HLS {
        let r:CGFloat = rgb.r.cgFloat; let g:CGFloat = rgb.g.cgFloat; let b:CGFloat = rgb.b.cgFloat;
        var h:CGFloat = 0/*<<--this wasn't here before but its need to be able to compile.*/
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
