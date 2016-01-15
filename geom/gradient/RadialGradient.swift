import Foundation
/**
 * @NOTE: Focal length: 
 */
public class RadialGradient:Gradient2 {
    public var startCenter:CGPoint?
    public var endCenter:CGPoint?
    public var startRadius:CGSize?
    public var endRadius:CGSize?
    init(_ colors:Array<CGColor> = [], _ locations:Array<CGFloat> = [],_ startCenter:CGPoint? = nil,_ endCenter:CGPoint? = nil,_ startRadius:CGSize? = nil,_ endRadius:CGSize? = nil){
        super.init(colors, locations)
        self.startCenter = startCenter
        self.endCenter = endCenter
        self.startRadius = startRadius
        self.endRadius = endRadius
    }
}