import Foundation

struct RoundedRect{
    var rect:CGRect
    var fillet:Fillet
    init(_ rect:CGRect = CGRect(),_ fillet:Fillet = Fillet()) {
        self.rect = rect
        self.fillet = fillet
    }
    
}
extension RoundedRect{
    var origin: CGPoint {get{return rect.origin} set{rect.origin = newValue}}
    var size: CGSize {get{return rect.size} set{rect.size = newValue}}
    init(_ origin:CGPoint = CGPoint(),_ size:CGSize = CGSize(),_ fillet:Fillet = Fillet()){
        self.init(CGRect(origin,size), fillet)
    }
    init(_ x:CGFloat = 0,_ y:CGFloat = 0,_ w:CGFloat = 0,_ h:CGFloat = 0,_ fillet:Fillet = Fillet()){
        self.init(CGRect(CGPoint(x,y),CGSize()), fillet)
    }
}

extension RoundedRect:Advancable5 {
    static var defaults:AnimState5<RoundedRect>  =  AnimState5<RoundedRect>(RoundedRect(), RoundedRect(), RoundedRect(), RoundedRect(), RoundedRect(10e-5,10e-5,10e-5,10e-5,Fillet()))
    func isNear( value:  RoundedRect,  epsilon: RoundedRect) -> Bool {
        return self.size.isNear(value.size,epsilon.size.w) && self.origin.isNear(value.origin,epsilon.origin.x)
    }
}
