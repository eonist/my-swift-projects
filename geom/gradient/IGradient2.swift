import Foundation

protocol IGradient2 {
    var colors:Array<CGColor>{get set}
    var locations:Array<CGFloat>{get set}
    var transformation:CGAffineTransform?{get set}
}
extension IGradient2{
    func copy() -> IGradient2 {
        if(self is LinearGradient){return LinearGradient(colors,locations,transformation,(self as! LinearGradient).p1,(self as! LinearGradient).p2)}
        else{return RadialGradient(colors,locations,transformation,(self as! RadialGradient).startCenter,(self as! RadialGradient).endCenter,(self as! RadialGradient).startRadius,(self as! RadialGradient).endRadius)}
    }
}