import Cocoa
class ColorParser {
    /*
    * Returns NSColor for hex int
    * TODO: use UINT?
    * TODO: this does not work!!! more research needed, works on some hex ints but not all
    */
    class func nsColor(hex:Int, _ alpha: Float = 1.0)->NSColor{
        let hexString = NSString(format: "%2X", hex)
        print("hexString:" + "\(hexString)")
        return ColorParser.nsColor(hexString as String , alpha)
    }
    /**
    * NOTE: works for now
    * TODO: Improve this, check your libs
    * NOTE: the alpha support is nice
    * NOTE: hex to cg color: https://github.com/pketh/NSColor-fromHex-Swift/blob/master/NSColor%2BfromHex.swift
    */
    class func nsColor(hexStr:String, _ alpha: Float = 1.0)->NSColor{
        var hex = hexStr
        // Check for hash and remove the hash
        if hex.hasPrefix("#") {
            hex = hex.substringFromIndex(hex.startIndex.advancedBy(1))
        }
        if (hex.rangeOfString("(^[0-9A-Fa-f]{6}$)|(^[0-9A-Fa-f]{3}$)", options: .RegularExpressionSearch) != nil) {
            // Deal with 3 character Hex strings
            if hex.characters.count == 3 {
                let redHex   = hex.substringToIndex(hex.startIndex.advancedBy(1))
                let greenHex = hex.substringWithRange(Range<String.Index>(start: hex.startIndex.advancedBy(1), end: hex.startIndex.advancedBy(2)))
                let blueHex  = hex.substringFromIndex(hex.startIndex.advancedBy(2))
                hex = redHex + redHex + greenHex + greenHex + blueHex + blueHex
            }
            let redHex = hex.substringToIndex(hex.startIndex.advancedBy(2))
            let greenHex = hex.substringWithRange(Range<String.Index>(start: hex.startIndex.advancedBy(2), end: hex.startIndex.advancedBy(4)))
            let blueHex = hex.substringWithRange(Range<String.Index>(start: hex.startIndex.advancedBy(4), end: hex.startIndex.advancedBy(6)))
            var redInt:   CUnsignedInt = 0
            var greenInt: CUnsignedInt = 0
            var blueInt:  CUnsignedInt = 0
            NSScanner(string: redHex).scanHexInt(&redInt)
            NSScanner(string: greenHex).scanHexInt(&greenInt)
            NSScanner(string: blueHex).scanHexInt(&blueInt)
            return NSColor(red: CGFloat(redInt) / 255.0, green: CGFloat(greenInt) / 255.0, blue: CGFloat(blueInt) / 255.0, alpha: CGFloat(alpha))
        }else {
            print("clear color")
            return NSColor()
        }
    }
    /**
    * untested
    */
    class func nsColor(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat)->NSColor{
        return NSColor.init(calibratedRed: r/255, green: g/255, blue: b/255, alpha: a)
    }
}