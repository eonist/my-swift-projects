import Foundation

struct RadialGradient:GradientKind {
    var gradient:Gradient
    var startCenter:CGPoint?/*should be 0.5,0.5 to mimic the focal ratio radial system*/
    var endCenter:CGPoint?/*y = focalRatio (-1 to +1) */
    var startRadius:CGSize?
    var endRadius:CGSize?/*should be 0,0 to mimic the focal ratio radial gradient system*/
    init(_ colors:[CGColor] = [], _ locations:[CGFloat] = [],_ rotation:CGFloat = 1.5707963267949, _ startCenter:CGPoint? = nil,_ endCenter:CGPoint? = nil,_ startRadius:CGSize? = nil,_ endRadius:CGSize? = nil,_ transformation:CGAffineTransform? = nil){
        gradient = Gradient.init(colors, locations, rotation, transformation)
        self.startCenter = startCenter
        self.endCenter = endCenter
        self.startRadius = startRadius
        self.endRadius = endRadius
    }
}
extension RadialGradient{
    var colors:[CGColor] {get {return gradient.colors}set{gradient.colors = newValue}}
    var locations:[CGFloat] {get {return gradient.locations}set{gradient.locations = newValue}}
    var rotation:CGFloat {get {return gradient.rotation}set{gradient.rotation = newValue}}
}
extension RadialGradient{
    init(_ gradient:GradientKind){
        self.init(gradient.colors,gradient.locations,gradient.rotation)
    }
}

extension RadialGradient:UnWrappable{
    static func unWrap<T>(_ xml:XML) -> T? {
        let linearGradient:LinearGradient? = LinearGradient.unWrap(xml)
        let startCenter:CGPoint? = unWrap(xml, "startCenter")
        let endCenter:CGPoint? = unWrap(xml, "endCenter")
        let startRadius:CGSize? = unWrap(xml, "startRadius")
        let endRadius:CGSize? = unWrap(xml, "endRadius")/*Should be 0,0 to mimic the focal ratio radial gradient system*/
        return RadialGradient(linearGradient!.colors, linearGradient!.locations, linearGradient!.rotation,startCenter,endCenter,startRadius,endRadius, linearGradient!.transformation) as? T
    }
}
