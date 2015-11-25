import Foundation
public protocol IGradient{
    var colors:Array<CGColor>{get set}
    var locations:Array<CGFloat>{get set}
    var gradientType:GradientType{get set}
    var rotation:Double{get set}
}