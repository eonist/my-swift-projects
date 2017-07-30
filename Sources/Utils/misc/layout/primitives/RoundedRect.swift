import Foundation

struct RoundedRect{
    //var rect:CGRect
    var x:CGFloat
    var y:CGFloat
    var w:CGFloat
    var h:CGFloat
    var fillet:CGFloat
    init(_ rect:CGRect = CGRect(),_ fillet:CGFloat = 0) {
        self.x = rect.x
        self.y = rect.y
        self.w = rect.w
        self.h = rect.h
        
        self.fillet = fillet
    }
}
extension RoundedRect{
    var origin: CGPoint {get{return CGPoint(self.x,self.y)} set{self.x = newValue.x;self.y = newValue.y}}
    var size: CGSize {get{return CGSize(w,h)} set{self.w = newValue.w;self.h = newValue.h}}
    var rect:CGRect {get{return CGRect(origin,size)} set{origin = newValue.origin;size = newValue.size}}
//    var x: CGFloat {get{return rect.x} set{rect.x = newValue}}
//    var y: CGFloat {get{return rect.y} set{rect.y = newValue}}
//    var w: CGFloat {get{return rect.w} set{rect.w = newValue}}
//    var h: CGFloat {get{return rect.h} set{rect.h = newValue}}
    init(_ origin:CGPoint = CGPoint(),_ size:CGSize = CGSize(),_ fillet:CGFloat = 0){
        self.init(CGRect(origin,size), fillet)
    }
    init(_ x:CGFloat = 0,_ y:CGFloat = 0,_ w:CGFloat = 0,_ h:CGFloat = 0,_ fillet:CGFloat = 0){
        self.init(CGRect(CGPoint(x,y),CGSize(w,h)), fillet)
    }
    enum DefaultEasing{
        static var easing:RoundedRect { return RoundedRect(0.2,0.2,0.2,0.2,0.2) }
    }
}
extension RoundedRect:Advancable5 {
    static var defaults:AnimState5<RoundedRect>  =  AnimState5<RoundedRect>(RoundedRect(), RoundedRect(), RoundedRect(), RoundedRect(), RoundedRect(10e-5,10e-5,10e-5,10e-5,10e-5))
    func isNear( value:  RoundedRect,  epsilon: RoundedRect) -> Bool {
        return self.size.isNear(value.size,epsilon.size.w) && self.origin.isNear(value.origin,epsilon.origin.x) && self.fillet.isNear(value.fillet,epsilon.fillet)
    }
}
func +(a: RoundedRect, b: RoundedRect) -> RoundedRect { return RoundedRect(a.origin + b.origin,a.size + b.size,a.fillet+b.fillet)}
func -(a: RoundedRect, b: RoundedRect) -> RoundedRect { return RoundedRect(a.origin - b.origin,a.size - b.size,a.fillet-b.fillet)}
func *(a: RoundedRect, b: RoundedRect) -> RoundedRect { return RoundedRect(a.origin * b.origin,a.size * b.size,a.fillet*b.fillet)}
