import Cocoa
class GradientUtils{
    /**
     * Returns a CGGradientRef instance for a Gradient instance
     * NOTE: we use an array of CGColor instances as aposed to NSColors, support for initiating an gradient with NSColors can be done in utility methods elswehere, this code needs to have as little convenince code as possible
     * NOTE: there exists also a method for component colors named: CGGradientCreateWithColorComponents, see Quartz books for this
     */
    static func cgGradient(_ gradient:IGraphicsGradient/*IGradient*/)->CGGradient{
        let myColorspace:CGColorSpace = CGColorSpaceCreateDeviceRGB()
        /*
        //In swift 3 we can cast cgColors to cfColors so the bellow code isn't needed
        let colors:[CFTypeRef] = gradient.colors
        let colorsPointer = UnsafeMutablePointer<UnsafeRawPointer?>(colors)
        let colorsCFArray = CFArrayCreate(nil, colorsPointer, colors.count, nil)
        */
        let locations:[CGFloat] = gradient.locations//should be a CGFloat between 0 and 1
        let locationsPointer = UnsafePointer<CGFloat>(locations)
        /*
        Swift.print(myColorspace)
        Swift.print(colorsCFArray)
        Swift.print(locationsPointer)
        Swift.print("---")
        */
        let myGradient:CGGradient = CGGradient(colorsSpace: myColorspace, colors: gradient.colors as CFArray, locations: locationsPointer)!
        return myGradient
    }
    /**
     * Returns IGraphicsGradient for IGradient
     */
    static func graphicsGradient(_ boundingBox:CGRect,_ gradient:IGradient)->IGraphicsGradient{
        if(gradient is LinearGradient){return linearGraphicsGradient(boundingBox,gradient)}
        else if(gradient is RadialGradient){ return radialGraphicsGradient(boundingBox,gradient)}
        else{fatalError("this type is not supported: " + "\(gradient)")}/*future support for Canonical gradient*/
    }
    /**
     * Linear
     */
    static func linearGraphicsGradient(_ boundingBox:CGRect,_ gradient:IGradient)->LinearGraphicsGradient{
        //TODO:// Extract the bellow lines to GradientUtils in IGradient
        let points:(start:CGPoint,end:CGPoint) = GradientBoxUtils.points(boundingBox, gradient.rotation)/*GradientBox*/
        return LinearGraphicsGradient(gradient.colors,gradient.locations,nil,points.start,points.end)
    }
    /**
     * Radial
     */
    static func radialGraphicsGradient(_ boundingBox:CGRect,_ gradient:IGradient)->RadialGraphicsGradient{
        //TODO:// Extract the bellow lines to GradientUtils in IGradient
        let rg = RadialGradientUtils.radialGradient(boundingBox,gradient as! RadialGradient)/*Creates and configs the radial gradient*/
        return RadialGraphicsGradient(gradient.colors,gradient.locations,rg.transform,rg.startCenter,rg.endCenter,rg.startRadius,rg.endRadius)
    }
}
/*
//its also possible to do this with component colors:
//var components: [CGFloat] = [ 1.0, 0, 0.4, 1.0,  /* Start color */0.8, 0.8, 0, 1.0 /*End color*/]
//var componentsPointer = UnsafePointer<CGFloat>(components)
//let myGradient:CGGradientRef = CGGradientCreateWithColorComponents(myColorspace, componentsPointer, locationsPointer, locations.count)!
*/
