import Foundation

protocol IGradient2 {
    var colors:Array<CGColor>{get set}
    var locations:Array<CGFloat>{get set}
    var transformation:CGAffineTransform?{get set}
}
extension IGradient2{
    func copy() -> IGradient2 {
        //if type is linear then return linear
        //else return radial
        return Gradient2(colors,locations,transformation)
    }
}