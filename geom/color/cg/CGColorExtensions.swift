import Cocoa

extension CGColor {
    var nsColor:NSColor {return NSColorParser.nsColor(self)}
    static func cgColor(_ hexColor:UInt, _ alpha: CGFloat = 1.0)->CGColor{
        return CGColorParser.cgColor(hexColor,alpha)
    }
    /**
     * EXAMPLE: NSColor.redColor().cgColor.alpha(0.5)//Output: a black color with 50% transparancy
     */
    func alpha(_ alpha:CGFloat)->CGColor{
        return self.copy(alpha: alpha)!
    }
}
