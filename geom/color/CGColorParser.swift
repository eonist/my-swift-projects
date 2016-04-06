import Foundation
import Cocoa

class CGColorParser {
    /**
     *
     */
    class func cgColor(ciColor:CIColor)->CGColor{
        let colorSpace:CGColorSpaceRef = ciColor.colorSpace
        let components/*:CGFloat*/ = ciColor.components;
        let cgColor:CGColorRef  = CGColorCreate(colorSpace, components)!;
        return cgColor
    }
    
    /**
     * NOTE: I think you can also just do: NSColor.redColor().CGColor, which renders this method obsolete
     * NOTE: This method is nice to have around for reference
     */
    class func cgColor(nsColor:NSColor)->CGColor{
        let ciColor:CIColor = CIColor(color: nsColor)!
        let cgColor = CIColorParser.cgColor(ciColor)
        return cgColor
    }
    /**
     * r: from 0.0 to 1.0
     * EXAMPLE: cgColor(1, 0, 0, 1)//Output: red CGColor
     * Note: research: CGColorCreateGenericGray(gray: CGFloat, _ alpha: CGFloat) -> CGColor
     * Note: research: CGColorCreateGenericCMYK(cyan: CGFloat, _ magenta: CGFloat, _ yellow: CGFloat, _ black: CGFloat, _ alpha: CGFloat) -> CGCol
     */
    class func cgColor(r:CGFloat = 0.0, _ g:CGFloat = 0.0, _ b:CGFloat = 0.0, _ a:CGFloat = 1.0)->CGColor{
        return CGColorCreateGenericRGB(r,g,b,a)
    }
    /*
    * hexColor -> cgColor
    */
    class func cgColor(hexColor:UInt, _ alpha: CGFloat = 1.0)->CGColor{
        return NSColorParser.nsColor(hexColor,alpha).CGColor
    }
}