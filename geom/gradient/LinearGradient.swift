import Foundation

public class LinearGradient:Gradient2 {
    public var p1:CGPoint?
    public var p2:CGPoint?
    init(_ colors:Array<CGColor> = [], _ locations:Array<CGFloat> = [],_ p1:CGPoint? = nil, _ p2:CGPoint? = nil){
        super.init(colors, locations)
        self.p1 = p1
        self.p2 = p2
    }
}
