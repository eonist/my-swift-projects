import Foundation
/**
 *
 */
public protocol IGraphicsGradient {
    var colors:Array<CGColor>{get set}
    var locations:Array<CGFloat>{get set}/*same as color stops*/
    var transformation:CGAffineTransform?{get set}
}
