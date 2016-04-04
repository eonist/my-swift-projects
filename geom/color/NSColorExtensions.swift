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
     */
    func alpha(alpha:CGFloat)->NSColor{
        return NSColor(self,alpha)
    }
    static var random:NSColor{return NSColorParser.randomColor()}
    
    var rgb:RGB {return RGBParser.rgb(self)}
    var rgba:RGBA{return RGBAParser.rgba(self)}
    
    var hex:String{return HexParser.hexColor(self)}
    /**
     * EXAMPLE: NSColor.red.rgb//Output:255.0
     */
    var hexVal:Double?{return Double("0x" + HexParser.hexColor(self))}
    /**
     *
     */
    
    /**
     *
     */
    var hls:HLS{return self.rgb.hls}
    var hsv:HLS{return self.rgb.hls}
}
