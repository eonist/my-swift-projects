import Cocoa

class ColorParser {/*Covers returning hex colors etc*/
    /**
     * Converts an RGB color value into a hexidecimal String representation.
     * @param r: A uint from 0 to 255 representing the red color value.
     * @param g: A uint from 0 to 255 representing the green color value.
     * @param b: A uint from 0 to 255 representing the blue color value.
     * @return Returns a hexidecimal color as a String.
     * @example
     * var hexColor : String = ColorParser.hexByRgb(1, 0, 1);
     * trace(hexColor); // Traces FF00FF
     */
    
    func hexColor(r:CGFloat,g:CGFloat,b:CGFloat)->String{
        var rr:String = String(format:"%X", Int(r * 255));
        var gg:String = String(format:"%X", Int(g * 255));
        var bb:String = String(format:"%X", Int(b * 255));
        rr = (rr.count == 1) ? "0" + rr : rr;
        gg = (gg.count == 1) ? "0" + gg : gg;
        bb = (bb.count == 1) ? "0" + bb : bb;
        return (rr + gg + bb)/*.toUpperCase()*/;
    }
    /**
     * EXAMPLE: rgba(NSColor.redColor()).r//Outputs //1.0
     */
    class func rgba(nsColor:NSColor)->(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat){
        let ciColor:CIColor = CIColor(color: nsColor)!
        return (ciColor.red,ciColor.green,ciColor.blue,ciColor.alpha)
    }
}

extension ColorParser{
    class func hexColor(nsColor:NSColor)->String {
        let rgba = nsColor.rgba
        return hexColor(rgba.r,rgba.g,rgba.b)
    }
}