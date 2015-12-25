import Foundation

extension CGColor {
    static func color(hexColor:UInt, _ alpha: CGFloat = 1.0)->CGColor{
        return NSColorParser.cgColor(hexColor,alpha)
    }
    /**
     * EXAMPLE: NSColor.redColor().cgColor.alpha(0.5)//Output: a black color with 50% transparancy
     */
    func alpha(alpha:CGFloat)->CGColor{
        return CGColorCreateCopyWithAlpha(self,alpha)!
    }
}
