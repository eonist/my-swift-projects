import Foundation
import Cocoa

class CGColorParser {
    /**
     * Returns a random CGColor
     */
    class func random()->CGColor{
        let r:CGFloat  = CGFloat(rand() % 255) / 255.0;
        let g:CGFloat  = CGFloat(rand() % 255) / 255.0;
        let b:CGFloat  = CGFloat(rand() % 255) / 255.0;
        let color:CGColorRef  = CGColorCreateGenericRGB(r, g, b, 1.0);
        return color
    }
    /**
     *
     */
    class func randomColor()->CGColor{
        let r:CGFloat  = CGFloat(rand() % 255) / 255.0;
        let g:CGFloat  = CGFloat(rand() % 255) / 255.0;
        let b:CGFloat  = CGFloat(rand() % 255) / 255.0;
        
        let color:CGColorRef  = CGColorCreateGenericRGB(r, g, b, 1.0);
        return color
    }
    /**
    * Returns an nsColor for @param cgColor
    */
    class func nsColor(cgColor:CGColorRef)->NSColor{
        let ciColor = CIColor(CGColor: cgColor)//convert the cg to ci
        let nsColor = NSColor(CIColor: ciColor)//convert the ci to ns
        return nsColor
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
    class func randomColor()-> NSColor{
        let r:CGFloat  = CGFloat(rand() % 255) / 255.0;
        let g:CGFloat  = CGFloat(rand() % 255) / 255.0;
        let b:CGFloat  = CGFloat(rand() % 255) / 255.0;
        let nsColor:NSColor = NSColor(calibratedRed: r, green: g, blue: b, alpha: 1)
        return nsColor
    }
    /*
    * hexColor -> cgColor
    */
    class func cgColor(hexColor:UInt, _ alpha: CGFloat = 1.0)->CGColor{
        return NSColorParser.nsColor(hexColor,alpha).CGColor
    }
}