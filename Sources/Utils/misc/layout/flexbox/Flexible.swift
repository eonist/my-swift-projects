import Foundation

typealias Flexible = IPositional & ISizeable

extension Flexible{
    var rect:CGRect {return CGRect(flexible.x,flexible.y,flexible.width,flexible.height)}
}
