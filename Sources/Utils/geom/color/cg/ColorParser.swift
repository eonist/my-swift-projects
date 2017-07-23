import Cocoa

class ColorParser {
    /**
     *
     */
    static func randomColor()-> NSColor{
        let r:CGFloat  = CGFloat(arc4random() % 255) / 255.0//Swift 3 upgrade, -> was rand()
        let g:CGFloat  = CGFloat(arc4random() % 255) / 255.0
        let b:CGFloat  = CGFloat(arc4random() % 255) / 255.0
        let nsColor:NSColor = NSColor(calibratedRed: r, green: g, blue: b, alpha: 1)
        return nsColor
    }
    /**
     * Returns a random CGColor
     */
    static func random()->CGColor{
        let r:CGFloat  = CGFloat(arc4random() % 255) / 255.0
        let g:CGFloat  = CGFloat(arc4random() % 255) / 255.0
        let b:CGFloat  = CGFloat(arc4random() % 255) / 255.0
        let color:CGColor  = CGColor(red: r, green: g, blue: b, alpha: 1.0)
        return color
    }
   
    /**
     * Interpolates between two NSColors
     */
    static func interpolate(_ from:NSColor,_ to:NSColor,_ scalar:CGFloat) ->NSColor{
        func interpolate(_ start:CGFloat,_ end:CGFloat,_ scalar:CGFloat)->CGFloat{
            return start + (end - start) * scalar;
        }
        let fromRGBColor:NSColor = from.usingColorSpace(.genericRGB)!
        let toRGBColor:NSColor = to.usingColorSpace(.genericRGB)!
        let red:CGFloat = interpolate(scalar, fromRGBColor.redComponent, toRGBColor.redComponent)
        let green:CGFloat = interpolate(scalar, fromRGBColor.greenComponent, toRGBColor.greenComponent)
        let blue:CGFloat = interpolate(scalar, fromRGBColor.blueComponent, toRGBColor.blueComponent)
        let alpha:CGFloat = interpolate(scalar, fromRGBColor.alphaComponent, toRGBColor.alphaComponent)
        return NSColor.init(calibratedRed: red, green: green, blue: blue, alpha: alpha)
    }
}
