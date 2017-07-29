import Foundation

struct RoundedRect{
    var rect:CGRect
    var fillet:Fillet
    init(_ rect:CGRect,_ fillet:Fillet) {
        self.rect = rect
        self.fillet = fillet
    }
    
}
extension RoundedRect{
    var origin: CGPoint {get{return rect.origin} set{rect.origin = newValue}}
    var size: CGSize {get{return rect.size} set{rect.size = newValue}}
    init(_ origin:CGPoint,_ size:CGSize,_ fillet:Fillet){
        self.init(CGRect(origin,size), fillet)
    }
    init(_ x:CGFloat,_ y:CGFloat,_ w:CGFloat,_ h:CGFloat,_ fillet:Fillet){
        self.init(CGRect(CGPoint(x,y),CGSize()), fillet)
    }
}
