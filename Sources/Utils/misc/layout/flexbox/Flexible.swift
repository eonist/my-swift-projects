import Foundation

typealias Flexible = IPositional & ISizeable

class FlexibleUtils{
    static func rect(_ flexible:Flexible)->CGRect {
        return CGRect(flexible.x,flexible.y,flexible.width,flexible.height)
    }
}
