import Foundation

protocol IGradient2 {
    var colors:Array<CGColor>{get set}
    var locations:Array<CGFloat>{get set}
    var transformation:CGAffineTransform?{get set}
}
