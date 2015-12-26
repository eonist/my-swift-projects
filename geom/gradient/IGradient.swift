import Foundation
public protocol IGradient{
    var colors:Array<CGColor>{get set}
    var locations:Array<CGFloat>{get set}
    var gradientType:GradientType{get set}
    var rotation:CGFloat{get set}
    var relativeStartCenter:CGPoint?{get set}
    var relativeEndCenter:CGPoint?{get set}
    var relativeStartRadius:CGSize?{get set}//rename to startScale
    var relativeEndRadius:CGSize?{get set}//rename to endScale
}

extension IGradient{
    func copy() -> IGradient {
        return Gradient(colors,locations,gradientType,rotation,relativeStartCenter,relativeEndCenter,relativeStartRadius,relativeEndRadius)
    }
}