import Foundation

struct RoundedRect{
    var rect:CGRect
    var fillet:Fillet
    var origin: CGPoint {get{return rect.origin} set{rect.origin = newValue}}
    var size: CGSize {get{return rect.size} set{rect.size = newValue}}
    init(_ rect:CGRect,_ fillet:Fillet) {
        self.rect = rect
        self.fillet = fillet
    }
}
