import Foundation

class CMYKParser {
    /**
     * RGB from the respective figures, HSV sequences in terms of returns.
     * RGB values are as follows
     * R - a number from 0 to 255
     * G - a number from 0 to 255
     * B - a number from 0 to 255
     *
     * CMYK values are as follows.
     * C - a number between 0 to 255 representing cyan
     * M - number between 0 to 255 representing magenta
     * Y - number between 0 to 255 representing yellow
     * K - number between 0 to 255 representing black
     *
     * Can not compute, including alpha.
     * PARAM: r the red (R) indicating the number (0x00 to 0xFF to)
     * PARAM: g green (G) indicates the number (0x00 to 0xFF to)
     * PARAM: b blue (B) shows the number (0x00 to 0xFF to)
     * RETURN: CMYK values into an array of [H, S, V] 
     */
    static func cmyk(_ rgb:RGB)->CMYK {
        let r:CGFloat = rgb.r.cgFloat; let g:CGFloat = rgb.g.cgFloat; let b:CGFloat = rgb.b.cgFloat;
        var c:CGFloat=0
        var m:CGFloat=0
        var y:CGFloat=0
        var k:CGFloat=0
        c = 255 - r
        m = 255 - g
        y = 255 - b
        k = 255
        if (c < k){k=c}
        if (m < k){k=m}
        if (y < k){k=y}
        if (k == 255){
            c=0
            m=0
            y=0
        }else{
            c=round(255*(c-k)/(255-k))
            m=round(255*(m-k)/(255-k))
            y=round(255*(y-k)/(255-k))
        }
        return CMYK(c,m,y,k)
    }
}