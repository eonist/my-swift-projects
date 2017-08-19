import Cocoa
class GradientUtils{
    /**
     * Returns a CGGradientRef instance for a Gradient instance
     * NOTE: we use an array of CGColor instances as aposed to NSColors, support for initiating an gradient with NSColors can be done in utility methods elswehere, this code needs to have as little convenince code as possible
     * NOTE: there exists also a method for component colors named: CGGradientCreateWithColorComponents, see Quartz books for this
     */
    static func cgGradient(_ colors:[CGColor],_ locations:[CGFloat])->CGGradient?{
        let myColorspace:CGColorSpace = CGColorSpaceCreateDeviceRGB()
        let locations:[CGFloat] = locations/*should be a CGFloat between 0 and 1*/
        let locationsPointer = UnsafePointer<CGFloat>(locations)
        return CGGradient(colorsSpace: myColorspace, colors: colors as CFArray, locations: locationsPointer)
    }
    /**
     * Returns IGraphicsGradient for IGradient
     */
    static func graphicsGradient(_ boundingBox:CGRect,_ gradient:GradientKind)->GraphicsGradientKind{
        if let radialGradient = gradient as? RadialGradient {
            return Utils.radialGraphicsGradient(boundingBox,radialGradient)
        }else if let linearGradient = gradient as? LinearGradient {
            return Utils.linearGraphicsGradient(boundingBox,linearGradient)
        }else{fatalError("this type is not supported: " + "\(gradient)")}/*Future support for Canonical gradient*/
    }
    
}
private class Utils{
    /**
     * Linear Gradient
     * TODO: ⚠️️ Extract the bellow lines to GradientUtils in IGradient
     */
    static func linearGraphicsGradient(_ boundingBox:CGRect,_ gradient:LinearGradient)->LinearGraphicsGradient{
        let points:GradientBoxUtils.Line = GradientBoxUtils.points(boundingBox, gradient.rotation)/*GradientBox*/
        return LinearGraphicsGradient(gradient.colors,gradient.locations,nil,points.start,points.end)
    }
    /**
     * Radial Gradient
     * TODO: ⚠️️ Extract the bellow lines to GradientUtils in IGradient
     */
    static func radialGraphicsGradient(_ boundingBox:CGRect,_ gradient:RadialGradient)->RadialGraphicsGradient{
        let rg:RadialGradientUtils.RadialGrad = RadialGradientUtils.radialGradient(boundingBox,gradient)/*Creates and configs the radial gradient*/
        return RadialGraphicsGradient(gradient.colors,gradient.locations,rg.transform,rg.startCenter,rg.endCenter,rg.startRadius,rg.endRadius)
    }
}
