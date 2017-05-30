import Foundation
/**
 * As long as you implement poth IPositional and ISizeable you are Flexible
 */
typealias Flexible = IPositional & ISizeable

class FlexibleUtils{
    static func rect(_ flexible:Flexible)->CGRect {
        return CGRect(flexible.x,flexible.y,flexible.width,flexible.height)
    }
}
