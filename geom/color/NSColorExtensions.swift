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
    /**
     * EXAMPLE: NSColor.redColor().rgba.r//Outputs 1.0
     */
    var rgba:(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat){return RGBParser.rgba(self)}
    /**
     * EXAMPLE: NSColor.redColor().hex//FF0000
     * EXAMPLE: Double("0x" + NSColor.red.hex)//255.0  this is great if you need the hex as a Double.
     */
    var hex:String{return ColorParser.hexColor(self)}
    /**
     * EXAMPLE: NSColor.red.rgb//Output:255.0
     */
    var rgb:Double?{return Double("0x" + ColorParser.hexColor(self))}
    /**
     *
     */
    static var random:NSColor{return ColorUtils.randomColor()}
}
