import Cocoa
class NSColorParser {
    /**
     * Note: NSColorParser.nsColor(255, 0.0,  0.0) is the same thing as: NSColor.redColor()
     * EXAMPLE: nsColor(250.0, 0, 0,100)//output: red NSColor
     */
    class func nsColor(r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat = 100) -> NSColor{
        return NSColor.init(calibratedRed: r/255, green: g/255, blue: b/255, alpha: a)
    }
    /**
     * NOTE: Supports 5 hex color formats: #FF0000,0xFF0000, FF0000, F00,red
     * NOTE: hex to cg color: https://github.com/pketh/NSColor-fromHex-Swift/blob/master/NSColor%2BfromHex.swift
     */
    class func nsColor(hexColor:String, _ alpha: CGFloat = 1.0) -> NSColor{
        let uintColor:UInt = StringParser.color(hexColor)
        return nsColor(uintColor,alpha);
    }
    /**
     * EXAMPLE: :NSColorParser.nsColor(NSColor.blackColor(),0.5)//outputs a black color with 50% transperancy
     */
    class func nsColor(color:NSColor,_ alpha:CGFloat/*from 0 to 1*/)->NSColor{
        return color.colorWithAlphaComponent(alpha)
    }
    /**
     *
     */
    class func randomColor()->CGColor{
        let r:CGFloat  = CGFloat(rand() % 255) / 255.0;
        let g:CGFloat  = CGFloat(rand() % 255) / 255.0;
        let b:CGFloat  = CGFloat(rand() % 255) / 255.0;
        
        let color:CGColorRef  = CGColorCreateGenericRGB(r, g, b, 1.0);
        return color
    }
    
}

extension NSColorParser{
    /**
     * Convenince implementation of nsColor with Int values
     * NOTE: there is no need to make a convenince method for Double values, since Double values does well with thte CGFLoat implementation of the same method
     * r: 0 - 255
     */
    class func nsColor(r:Int,_ g:Int,_ b:Int,_ a:Int = 100) -> NSColor{
        return NSColorParser.nsColor(CGFloat(r) / 255.0, CGFloat(b) / 255.0, CGFloat(g) / 255.0, CGFloat(a) / 100.0)
    }
    /**
     * Convenince
     */
    class func nsColor(r:UInt,_ g:UInt,_ b:UInt) -> NSColor {
        return NSColorParser.nsColor(r.int, g.int, b.int)
    }
    /**
     * Returns NSColor for hex int
     * NOTE: Convenience method
     */
    class func nsColor(hexColor:UInt, _ alpha:CGFloat = 1.0)->NSColor{
        //Swift.print("hexColor: " + "\(hexColor)")
        let rgb:UInt = hexColor
        let r:UInt = rgb >> 16
        //Swift.print("r: " + "\(r)")
        let g:UInt = (rgb ^ (r << 16)) >> 8
        //Swift.print("g: " + "\(g)")
        let b:UInt = (rgb ^ (r << 16)) ^ (g << 8)
        //Swift.print("b: " + "\(b)")
        return NSColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(alpha))
    }
    /*
     * hexColor -> cgColor
     */
    class func cgColor(hexColor:UInt, _ alpha: CGFloat = 1.0)->CGColor{
        return nsColor(hexColor,alpha).CGColor
    }
    /**
     * Convenince
     */
    class func color(color:HLS)->NSColor {//rename to nsColorByHls ?
        let rgb:RGB = RGBParser.rgbByHls(color.h,color.l,color.s);
        return NSColorParser.nsColor(rgb.r.cgFloat, rgb.g.cgFloat, rgb.b.cgFloat)
    }
    /**
     * Convenince
     * @param h 0 - 240
     * @param s 0 - 1
     * @param v 0 - 1
     */
    class func color(color:HSV)->NSColor {
        let rgb:RGB = RGBParser.rgbByHsv(color.h,color.s,color.v)
        return NSColorParser.nsColor(rgb.r.cgFloat, rgb.g.cgFloat, rgb.b.cgFloat)
    }
}