import Foundation

public struct RadialGraphicsGradient:GraphicsGradientDecoratable{
    public var gradient:GraphicsGradient
    public var startCenter:CGPoint
    public var endCenter:CGPoint
    public var startRadius:CGFloat
    public var endRadius:CGFloat
    init(_ colors:[CGColor] = [], _ locations:[CGFloat] = [],_ transformation:CGAffineTransform? = nil,_ startCenter:CGPoint,_ endCenter:CGPoint,_ startRadius:CGFloat,_ endRadius:CGFloat){
        self.startCenter = startCenter
        self.endCenter = endCenter
        self.startRadius = startRadius
        self.endRadius = endRadius
        gradient = .init(colors,locations,transformation)
    }
}

extension RadialGraphicsGradient{
    /**
     * Convert
     */
    func radialGradient()->RadialGradient{
        return RadialGradient(self.colors,self.locations,1.5707963267949,self.startCenter,self.endCenter,CGSize(self.startRadius,self.startRadius),CGSize(self.endRadius,self.endRadius),self.transformation)
    }
}
