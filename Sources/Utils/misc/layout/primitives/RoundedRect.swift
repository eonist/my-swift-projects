import Foundation

struct RoundedRect{
    var rect:CGRect
    var fillet:Fillet
    init(_ rect:CGRect,_ fillet:Fillet) {
        self.rect = rect
        self.fillet = fillet
    }
}
