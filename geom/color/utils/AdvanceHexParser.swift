import Foundation

class AdvanceHexParser {
    /**
     * Converts a 32-bit ARGB color value into a hexidecimal String representation
     * PARAM: a: A uint from 0 to 255 representing the alpha value
     * PARAM: r: A uint from 0 to 255 representing the red color value
     * PARAM: g: A uint from 0 to 255 representing the green color value
     * PARAM: b: A uint from 0 to 255 representing the blue color value
     * RETURN: Returns a hexidecimal color as a String
     * EXAMPLE: hexByRgba(128, 255, 0, 255)//FF00FF80
     */
    static func hexString(r:UInt, _ g:UInt, _ b:UInt, _ a:UInt) -> String {
        var rr:String = String(format:"%X", Int(r))
        var gg:String = String(format:"%X", Int(g))
        var bb:String = String(format:"%X", Int(b))
        var aa:String = String(format:"%X", Int(a))
        rr = (rr.count == 1) ? "0" + rr : rr
        gg = (gg.count == 1) ? "0" + gg : gg
        bb = (bb.count == 1) ? "0" + bb : bb
        aa = (aa.count == 1) ? "0" + aa : aa
        return (rr + gg + bb + aa).uppercased()
    }
}