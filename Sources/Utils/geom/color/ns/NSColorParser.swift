import Cocoa
class NSColorParser {
    /**
     * Note: NSColorParser.nsColor(255, 0.0,  0.0) is the same thing as: NSColor.redColor()
     * EXAMPLE: nsColor(250.0, 0, 255)//output: red NSColor
     */
    static func nsColor(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat = 255) -> NSColor{//alpha was 0-100 but is now 0-255 this works better with hex values
        return NSColor.init(calibratedRed: r/255, green: g/255, blue: b/255, alpha: a/255)
    }
    /**
     * NOTE: Supports 5 hex color formats: #FF0000,0xFF0000, FF0000, F00,red
     * NOTE: hex to cg color: https://github.com/pketh/NSColor-fromHex-Swift/blob/master/NSColor%2BfromHex.swift
     */
    static func nsColor(_ hexColor:String, _ alpha: CGFloat = 1.0) -> NSColor{
        let uintColor:UInt = StringParser.color(hexColor)
        return nsColor(uintColor,alpha)
    }
    /**
     * EXAMPLE: color("FF0000FF")//outputs blue with 100% opacity
     */
    static func color(_ hexColor:String)->NSColor{
        let rgba:RGBA = RGBAParser.rgba32(hexColor)
        return rgba.nsColor
    }
    /**
     * Returns NSColor for hex int
     * NOTE: Convenience method
     * EXAMPLE: nsColor(UInt(0x39D149))
     */
    static func nsColor(_ hexColor:UInt, _ alpha:CGFloat = 1.0)->NSColor{
        let rgb:UInt = hexColor
        let r:UInt = rgb >> 16
        let g:UInt = (rgb ^ (r << 16)) >> 8
        let b:UInt = (rgb ^ (r << 16)) ^ (g << 8)
        return NSColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(alpha))
    }
    /**
     * EXAMPLE: :NSColorParser.nsColor(NSColor.blackColor(),0.5)//outputs a black color with 50% transperancy
     */
    static func nsColor(_ color:NSColor,_ alpha:CGFloat/*from 0 to 1*/)->NSColor{
        return color.withAlphaComponent(alpha)
    }
    /**
     * Returns an nsColor for PARAM: cgColor
     */
    static func nsColor(_ cgColor:CGColor)->NSColor{
        let ciColor = CIColor(cgColor:cgColor)//convert the cg to ci
        let nsColor = NSColor(ciColor:ciColor)//convert the ci to ns
        return nsColor
    }
}
extension NSColorParser{
    /**
     * Convenince implementation of nsColor with Int values
     * NOTE: there is no need to make a convenince method for Double values, since Double values does well with thte CGFLoat implementation of the same method
     * r: 0 - 255
     */
    static func nsColor(_ r:Int,_ g:Int,_ b:Int,_ a:Int = 100) -> NSColor{
        return NSColorParser.nsColor(CGFloat(r) /*/ 255.0*/, CGFloat(b) /*/ 255.0*/, CGFloat(g)/* / 255.0*/, CGFloat(a)/100 /*/ 100.0*/)
    }
    /**
     * Convenince
     */
    static func nsColor(_ r:UInt,_ g:UInt,_ b:UInt) -> NSColor {
        return NSColorParser.nsColor(r.cgFloat, g.cgFloat, b.cgFloat)
    }
    /**
     * Convenince
     */
    static func nsColor(_ hls:HLS)->NSColor {
        //let rgb:RGB = RGBParser.rgb();
        return hls.rgb.nsColor
    }
    /**
     * Convenince
     * PARAM: h 0 - 240
     * PARAM: s 0 - 1
     * PARAM: v 0 - 1
     */
    static func nsColor(_ hsv:HSV)->NSColor {
        //let rgb:RGB = RGBParser.rgbByHsv(color.h,color.s,color.v)
        //return NSColorParser.nsColor(rgb.r.cgFloat, rgb.g.cgFloat, rgb.b.cgFloat)
        return hsv.rgb.nsColor
    }
    /**
     *
     */
    static func nsColor(_ rgb:RGB) -> NSColor{
        return NSColorParser.nsColor(rgb.r,rgb.g,rgb.b)
    }
    static func nsColor(_ hsb:HSB) -> NSColor{
        return hsb.rgb.nsColor
    }
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
     * TODO: ⚠️️ interpolating between gray and black at scalar 0 yields a darker tone than gray. Try fixing this by looking at the components, or maybe even using the CIColor trick
     * NOTE: there is also Native: NSColor.green.blended(withFraction: 0.5, of: .blue)
     */
    static func interpolate(_ from:NSColor,_ to:NSColor,_ scalar:CGFloat) ->NSColor{
        func interpolate(_ start:CGFloat,_ end:CGFloat,_ scalar:CGFloat)->CGFloat{
            return start + (end - start) * scalar
        }
        let fromRGBColor:NSColor = from.usingColorSpace(.genericRGB)!
        let toRGBColor:NSColor = to.usingColorSpace(.genericRGB)!
        let red:CGFloat = interpolate(fromRGBColor.redComponent, toRGBColor.redComponent,scalar)
        let green:CGFloat = interpolate(fromRGBColor.greenComponent, toRGBColor.greenComponent,scalar)
        let blue:CGFloat = interpolate(fromRGBColor.blueComponent, toRGBColor.blueComponent,scalar)
        let alpha:CGFloat = interpolate(fromRGBColor.alphaComponent, toRGBColor.alphaComponent,scalar)
        return NSColor.init(red: red, green: green, blue: blue, alpha: alpha)
    }

}
