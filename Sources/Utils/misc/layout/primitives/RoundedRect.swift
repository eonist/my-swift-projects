import Foundation

class RoundedRect:CGRect{
    var fillet:Fillet
    init(_ rect:CGRect,_ fillet:Fillet) {
        self.fillet = fillet
        super.init(rect.x,rect.y,rect.w,rect.h)
    }
}
