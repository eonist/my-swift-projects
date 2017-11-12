import Foundation
/**
 * Decorator over CGRect
 */
struct RoundedRect{
    var rect:CGRect
    var fillet:CGFloat
    init(_ rect:CGRect = CGRect(),_ fillet:CGFloat = 0) {
        self.rect = rect
        self.fillet = fillet
    }
}
extension RoundedRect{
    var origin: CGPoint {get{return rect.origin} set{rect.origin = newValue}}
    var size: CGSize {get{return rect.size} set{rect.size = newValue}}
    var x: CGFloat {get{return rect.x} set{rect.x = newValue}}
    var y: CGFloat {get{return rect.y} set{rect.y = newValue}}
    var w: CGFloat {get{return rect.w} set{rect.w = newValue}}
    var h: CGFloat {get{return rect.h} set{rect.h = newValue}}
    init(_ origin:CGPoint = CGPoint(),_ size:CGSize = CGSize(),_ fillet:CGFloat = 0){
        self.init(CGRect(origin,size), fillet)
    }
    init(_ x:CGFloat = 0,_ y:CGFloat = 0,_ w:CGFloat = 0,_ h:CGFloat = 0,_ fillet:CGFloat = 0){
        self.init(CGRect(CGPoint(x,y),CGSize(w,h)), fillet)
    }
    enum DefaultEasing{//TODO: ⚠️️ move this into Anim classes
        static var easing:RoundedRect { return RoundedRect(0.2,0.2,0.2,0.2,0.2) }
    }
}
func +(a: RoundedRect, b: RoundedRect) -> RoundedRect { return RoundedRect(a.origin + b.origin,a.size + b.size,a.fillet+b.fillet)}
func -(a: RoundedRect, b: RoundedRect) -> RoundedRect { return RoundedRect(a.origin - b.origin,a.size - b.size,a.fillet-b.fillet)}
func *(a: RoundedRect, b: RoundedRect) -> RoundedRect { return RoundedRect(a.origin * b.origin,a.size * b.size,a.fillet*b.fillet)}
