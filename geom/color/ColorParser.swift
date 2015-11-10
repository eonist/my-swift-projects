import Cocoa
class ColorParser {
    private class func index(){
        cgColor(1, 0, 0, 1)//Output: red CGColor
        nsColor(250.0, 0, 0,100)//output: red NSColor
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
    /**
     * NOTE: Supports 4 hex color formats: #FF0000,0xFF0000, FF0000, F00
     * NOTE: hex to cg color: https://github.com/pketh/NSColor-fromHex-Swift/blob/master/NSColor%2BfromHex.swift
     */
    class func nsColor(hexColor:String, _ alpha: Float = 1.0) -> NSColor{
        let colorHexPattern:String = "(?<=^#)(?:[a-fA-F0-9]{3}){1,2}|(?<!^#)(?:[a-fA-F0-9]{3}){1,2}$";
        if(RegExp.test(hexColor,colorHexPattern)){//asserts if the color is in the correct hex format
            var hex:String = RegExp.match(hexColor, colorHexPattern)[0]
            if hex.characters.count == 3 { hex = String([hex.characters.first!,hex.characters.first!,hex.characters[hex.startIndex.advancedBy(1)],hex.characters[hex.startIndex.advancedBy(1)],hex.characters.last!,hex.characters.last!]) } //convert shorthand hex to hex
            return nsColor(UInt(Float(hex)!),alpha)
        }else{
            return nsColor(ColorTypes.color(hexColor),alpha);//green, blue, orange etc// :TODO: support for all of w3c color types// :TODO: move this to a method named webColor?
        }
    }
}

extension ColorParser{
    /**
     * Convenince implementation of nsColor with Int values
     * NOTE: there is no need to make a convenince method for Double values, since Double values foes well with thte CGFLoat implementation of the same method
     * r: 0 - 255
     */
    class func nsColor(r:Int,_ g:Int,_ b:Int,_ a:Int = 100) -> NSColor{
        return ColorParser.nsColor(CGFloat(r) / 255.0, CGFloat(b) / 255.0, CGFloat(g) / 255.0, CGFloat(a) / 100.0)
    }
    /*
     * Returns NSColor for hex int
     * NOTE: Convenience method
     */
    class func nsColor(hexColor:UInt, _ alpha: Float = 1.0)->NSColor{
        let rgb:UInt = hexColor
        let r:UInt = rgb >> 16;
        let g:UInt = (rgb ^ (r << 16)) >> 8;
        let b:UInt = (rgb ^ (r << 16)) ^ (g << 8);
        return NSColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(alpha))
    }
}