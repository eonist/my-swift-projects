import Cocoa
class ColorParser {
    private class func index(){
        cgColor(1, 0, 0, 1)//Output:CGColor that is red
        nsColor(250.0, 0, 0,100)//output:NSColor that is red
    }
    /**
    * r: from 0.0 to 1.0
    * Note: research: CGColorCreateGenericGray(gray: CGFloat, _ alpha: CGFloat) -> CGColor
    * Note: research: CGColorCreateGenericCMYK(cyan: CGFloat, _ magenta: CGFloat, _ yellow: CGFloat, _ black: CGFloat, _ alpha: CGFloat) -> CGCol
    */
    class func cgColor(r:CGFloat = 0.0, _ g:CGFloat = 0.0, _ b:CGFloat = 0.0, _ a:CGFloat = 1.0)->CGColor{
        return CGColorCreateGenericRGB(r,g,b,a)
    }

    /**
     * Note: ColorParser.nsColor(255, 0.0,  0.0) is the same thing as: NSColor.redColor()
     */
    class func nsColor(r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat = 100) -> NSColor{
        return NSColor.init(calibratedRed: r/255, green: g/255, blue: b/255, alpha: a)
    }
    /*
    * Returns NSColor for hex int
    * TODO: You have a similar method in your old lib from StringModifier.color(), copy that
    * TODO: use UINT?
    * TODO: this does not work!!! more research needed, works on some hex ints but not all
    */
    class func nsColor(hex:Int, _ alpha: Float = 1.0)->NSColor{
        let hexString = NSString(format: "%2X", hex)
        print("hexString:" + "\(hexString)")
        return ColorParser.nsColor(hexString as String , alpha)
    }
    /**
    * NOTE: works for now (with colors like: "FF00FF" use Colors.swift)
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
            //TODO: use ColorParser.nsCOlor(r,g,b,a) here
            return NSColor(red: CGFloat(redInt) / 255.0, green: CGFloat(greenInt) / 255.0, blue: CGFloat(blueInt) / 255.0, alpha: CGFloat(alpha))
        }else {
            print("clear color")
            return NSColor()
        }
    }
   
}

extension ColorParser{
    /**
     * r: 0.0 - 255.0
     */
    class func nsColor(r:Double,_ g:Double,_ b:Double,_ a:Double = 100)->NSColor{
        return ColorParser.nsColor(CGFloat(r) / 255.0, CGFloat(b) / 255.0, CGFloat(g) / 255.0, CGFloat(a) / 100.0)
    }
}