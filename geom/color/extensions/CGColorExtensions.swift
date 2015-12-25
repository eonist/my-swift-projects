import Foundation

extension CGColor {
    static func color(hexColor:UInt, _ alpha: CGFloat = 1.0)->CGColor{
        return NSColorParser.cgColor(hexColor,alpha)
    }
}
