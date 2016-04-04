import Cocoa

class RGBParser {
    /**
     *  Converts an HSB color specified by the parameters to a uint RGB color.
     *  @param hue The hue. 0-360
     *  @param saturation The saturation. 0-1
     *  @param brightness The brightness. 0-1
     *  @return An RGB color.
     *  @Example: rgbByHue(360,1,1);//0xFF0000
     */
    class func rgb(hsb:HSB)->RGB {
        let hue:CGFloat = hsb.h.cgFloat; let saturation:CGFloat = hsb.s.cgFloat; let brightness:CGFloat = hsb.b.cgFloat;
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
                    fatalError("this can't happen")
                    break;
            }
        }
        r *= 255
        g *= 255
        b *= 255
        return RGB(r,g,b)
    }
    /**
     * You can compare these values to those produced in the Windows Color Picker (MS Paint, etc)
     * @param h h = 145;   //  0-240
     * @param l l = 100;   //  0-240
     * @param s = 120;   //  0-240
     * @example trace(rgbByHls(h,l,s)["r"])//0-255;
     */
    class func rgb(hls:HLS)->RGB {
        var h:CGFloat = hls.h; var l:CGFloat = hls.l; var s:CGFloat = hls.s;
        var r:CGFloat = NaN;var g:CGFloat = NaN;var b:CGFloat = NaN;//<---the NaN values were added to make the code compile
        if(s == 0) {
            r = round(l/240*255);g = r;b = r;
        }else {
            h /= 240; l /= 240; s /= 240;
            var temp4:CGFloat;var temp3:CGFloat;
            let temp2:CGFloat = (l < 0.5) ? l*(s+1) : l+s-l*s
            let temp1:CGFloat = l*2 - temp2
            for(var i:uint=0; i<3; i++) {
                switch(i) {
                    case 0: temp3 = h+1/3
                    case 1: temp3 = h
                    case 2: temp3 = h-1/3
                    default:fatalError("can't happen");
                }
                if(temp3 < 0) {temp3++}
                else if(temp3 > 1) {temp3--}
                if(temp3*6 < 1) {temp4 = temp1+(temp2-temp1)*6*temp3}
                else if(temp3*2 < 1) {temp4 = temp2}
                else if(temp3*3 < 2) {temp4 = temp1+(temp2-temp1)*((2/3)-temp3)*6}
                else {temp4 = temp1}
                switch(i) {
                    case 0: r = round(temp4*255)
                    case 1: g = round(temp4*255)
                    case 2: b = round(temp4*255)
                    default: fatalError("can't happen");
                }
            }
        }
        return RGB(r,g,b)
    }
    /**
     * @Note untested
     */
    class func rgb(hsv:HSV) -> RGB{
        let h:CGFloat = hsv.h; let s:CGFloat = hsv.s; let v:CGFloat = hsv.v;
        let hi:Int = Int(floor(h / 60) % 6)//the casting to int part is new
        let f:CGFloat = h / 60 - floor(h / 60)
        let r:CGFloat,g:CGFloat,b:CGFloat
        let p:CGFloat = (v * (1 - s))
        let q:CGFloat = (v * (1 - f * s))
        let t:CGFloat = (v * (1 - (1 - f) * s))
        switch(hi){
            case 0: r = v; g = t; b = p; break;
            case 1: r = q; g = v; b = p; break;
            case 2: r = p; g = v; b = t; break;
            case 3: r = p; g = q; b = v; break;
            case 4: r = t; g = p; b = v; break;
            case 5: r = v; g = p; b = q; break;
            default:fatalError("can't happen");
        }
        return RGB(round(r * 255),round(g * 255),round(b * 255))
    }
    /**
     * RGB from each of the CMYK values to determine a return as an array.
     * CMYK values are as follows.
     * C - a number between 0 to 255 representing cyan
     * M - number between 0 to 255 representing magenta
     * Y - number between 0 to 255 representing yellow
     * K - number between 0 to 255 representing black
     **/
    class func rgb(cmyk:CMYK) -> RGB{
        var c:CGFloat = cmyk.c; var m:CGFloat = cmyk.m; var y:CGFloat = cmyk.y; var k:CGFloat = cmyk.k;
        c = 255 - c
        m = 255 - m
        y = 255 - y
        k = 255 - k
        return RGB((255 - c) * (255 - k) / 255,(255 - m) * (255 - k) / 255,((255 - y) * (255 - k) / 255))
    }
    /**
     * @Note this is approximate but close enough
     */
     class func rgb2(cmyk:CMYK) -> RGB {
        let c:CGFloat = cmyk.c; let m:CGFloat = cmyk.m; let y:CGFloat = cmyk.y; let k:CGFloat = cmyk.k;
        var r:CGFloat = 255 - (round (2.55 * (c + k)))
        var g:CGFloat = 255 - (round (2.55 * (m + k)))
        var b:CGFloat = 255 - (round (2.55 * (y + k)))
        if (r < 0) {r = 0}
        if (g < 0) {g = 0}
        if (b < 0) {b = 0}
        return RGB(r,g,b)
    }
    /**
     * Converts a 24-bit RGB color value into an RGB object.
     * @param color: The 24-bit RGB color value.
     * @return Returns an object with the properties r, g, and b defined.
     * @example
     * var myRGB:Object = rbg24(0xFF00FF);
     * print("Red = " + myRGB.r);
     * print("Green = " + myRGB.g);
     * print("Blue = " + myRGB.b);
     */
    class func rbg24(hexColor:UInt) -> RGB {
        let r = hexColor >> 16 & 0xFF
        let g = hexColor >> 8 & 0xFF
        let b = hexColor & 0xFF
        return RGB(r,g,b)
    }
}
