import Foundation
/**
 *
 */
public class RadialGraphicsGradient:GraphicsGradient{
    public var startCenter:CGPoint
    public var endCenter:CGPoint
    public var startRadius:CGSize
    public var endRadius:CGSize
    init(_ colors:Array<CGColor> = [], _ locations:Array<CGFloat> = [],_ transformation:CGAffineTransform? = nil,_ startCenter:CGPoint,_ endCenter:CGPoint,_ startRadius:CGSize,_ endRadius:CGSize){
        self.startCenter = startCenter
        self.endCenter = endCenter
        self.startRadius = startRadius
        self.endRadius = endRadius
        super.init(colors,locations,transformation)
    }
}
