import Foundation
/**
 * NOTE: Used to be named: PrimitiveLine
 * TODO: rename to CGLine (Occupying the name Line for something so simple isnt needed)
 */
class Line {
    var p1:CGPoint
    var p2:CGPoint
    init(_ p1:CGPoint,_ p2:CGPoint) {
        self.p1 = p1
        self.p2 = p2
    }
}
