import Cocoa
/**
 * NOTE: it seems you cant override NSColor description{return ""} (research needed as you did this once with NSView and drawRect etc)
 */
extension NSColor{
    /**
     * EXAMPLE: :NSColor(NSColor.blackColor(),0.5)//outputs: a black color with 50% transparancy
     */
    convenience init(_ color:NSColor,_ alpha:CGFloat){/*0.0 - 1.0*/
        let ciColor:CIColor = CIColor(color: color)!
        self.init(red: ciColor.red, green: ciColor.green, blue: ciColor.blue, alpha: alpha)
    }
    /**
     * EXAMPLE: NSColor.redColor().alpha(0.5)//Output: a black color with 50% transparancy
     * NOTE: seems you cant Mutate self so dont bother trying to make a setAlpha method
     */
    func alpha(_ alpha:CGFloat)->NSColor{
        return NSColor(self,alpha)
    }
    static var random:NSColor{return ColorParser.randomColor()}
    //var cgColor:CGColor {return CGColorParser.cgColor(self)}//swift 3 update. this is now native
    var rgb:RGB {return RGBParser.rgb(self)}
    var rgba:RGBA{return RGBAParser.rgba(self)}
    var hexString:String{return HexParser.hexString(self)}/*EXAMPLE: NSColor.redColor().hexString//FF0000*/
    /**
     * EXAMPLE: NSColor.red.hexVal//Output:255.0
     */
    var hexVal:Double?{return HexParser.hexValue(self)}
    var hls:HLS{return self.rgb.hls}
    var hsv:HSV{return self.rgb.hsv}
    var hsb:HSB{return self.rgb.hsb}
}
