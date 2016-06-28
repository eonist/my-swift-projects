import Cocoa
class GradientUtils{
    /**
     * Returns a CGGradientRef instance for a Gradient instance
     * Note: we use an array of CGColor instances as aposed to NSColors, support for initiating an gradient with NSColors can be done in utility methods elswehere, this code needs to have as little convenince code as possible
     * Note: there exists also a method for component colors named: CGGradientCreateWithColorComponents, see Quartz books for this
     */
    class func cgGradient(gradient:IGraphicsGradient/*IGradient*/)->CGGradientRef{
        let myColorspace:CGColorSpaceRef = CGColorSpaceCreateDeviceRGB()!
        let colors:[CFTypeRef] = gradient.colors
        let colorsPointer = UnsafeMutablePointer<UnsafePointer<Void>>(colors)
        let colorsCFArray = CFArrayCreate(nil, colorsPointer, colors.count, nil)
        let locations:[CGFloat] = gradient.locations//should be a CGFloat between 0 and 1
        let locationsPointer = UnsafePointer<CGFloat>(locations)
        /*
        Swift.print(myColorspace)
        Swift.print(colorsCFArray)
        Swift.print(locationsPointer)
        Swift.print("---")
        */
        let myGradient:CGGradientRef = CGGradientCreateWithColors(myColorspace, colorsCFArray, locationsPointer)!
        return myGradient
    }
}
/*
//its also possible to do this with component colors:
//var components: [CGFloat] = [ 1.0, 0, 0.4, 1.0,  /* Start color */0.8, 0.8, 0, 1.0 /*End color*/]
//var componentsPointer = UnsafePointer<CGFloat>(components)
//let myGradient:CGGradientRef = CGGradientCreateWithColorComponents(myColorspace, componentsPointer, locationsPointer, locations.count)!
*/