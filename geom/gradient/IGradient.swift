import Foundation

protocol IGradient {
    var colors:Array<CGColor>{get set}
    var locations:Array<CGFloat>{get set}
    var rotation:CGFloat{get set}
}
extension IGradient{
    func copy() -> IGradient {
        if(self is LinearGradient){return LinearGradient(colors,locations,rotation)}
        else{return RadialGradient(colors,locations,rotation,(self as! RadialGradient).startCenter,(self as! RadialGradient).endCenter,(self as! RadialGradient).startRadius,(self as! RadialGradient).endRadius)}
    }
}

extension IGradient:UnWrappable{
    static func unWrap<T>(xml:XML) -> T? {
        var colors:Array<CGColor> = unWrap(xml, "colors")!
        var locations:Array<CGFloat> = unWrap(xml, "locations")!
        var rotation:CGFloat = unWrap(xml, "rotation")!
        return Gradient(colors, locations,rotation) as? T
    }
}