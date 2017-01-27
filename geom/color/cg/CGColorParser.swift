import Cocoa

class CGColorParser {
    /**
     * Converts CIColor to CGColor
     */
    static func cgColor(_ ciColor:CIColor)->CGColor{
        let colorSpace:CGColorSpace = ciColor.colorSpace
        let components/*:CGFloat*/ = ciColor.components
        let cgColor:CGColor  = CGColor(colorSpace: colorSpace, components: components)!
        return cgColor
    }
    /**
     * NOTE: I think you can also just do: NSColor.redColor().CGColor, which renders this method obsolete
     * NOTE: This method is nice to have around for reference
     */
    static func cgColor(_ nsColor:NSColor)->CGColor{
        let ciColor:CIColor = CIColor(color: nsColor)!
        let cgColor = CGColorParser.cgColor(ciColor)
        return cgColor
    }
    /**
     * r: from 0.0 to 1.0
     * EXAMPLE: cgColor(1, 0, 0, 1)//Output: red CGColor
     * Note: research: CGColorCreateGenericGray(gray: CGFloat, _ alpha: CGFloat) -> CGColor
     * Note: research: CGColorCreateGenericCMYK(cyan: CGFloat, _ magenta: CGFloat, _ yellow: CGFloat, _ black: CGFloat, _ alpha: CGFloat) -> CGCol
     */
    static func cgColor(_ r:CGFloat = 0.0, _ g:CGFloat = 0.0, _ b:CGFloat = 0.0, _ a:CGFloat = 1.0)->CGColor{
        return CGColor(red: r,green: g,blue: b,alpha: a)
    }
    /**
     * hexColor -> cgColor
     */
    static func cgColor(_ hexColor:UInt, _ alpha: CGFloat = 1.0)->CGColor{
        return NSColorParser.nsColor(hexColor,alpha).cgColor
    }
}