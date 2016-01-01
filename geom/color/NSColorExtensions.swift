import Cocoa
/**
 * NOTE: it seems you cant override NSColor description{return ""} (research needed as you did this once with NSView and drawRect etc)
 */
extension NSColor{
    
    convenience init(_ color:UInt,_ alpha:CGFloat/*0.0 - 1.0*/){
        NSColorParser.nsColor(UInt(color), alphaValue)//fill
        let ciColor:CIColor = CIColor(color: color)!
        self.init(red: ciColor.red, green: ciColor.green, blue: ciColor.blue, alpha: alpha)
    }

    
    /**
     * EXAMPLE: :NSColor(NSColor.blackColor(),0.5)//outputs: a black color with 50% transparancy
     */
    convenience init(_ color:NSColor,_ alpha:CGFloat/*0.0 - 1.0*/){
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
    var rgba:(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat){return ColorParser.rgba(self)}
    /**
     * EXAMPLE: NSColor.redColor().hex//FF0000
     */
    var hex:String{return ColorParser.hexColor(self)}
    /**
     *
     */
    static var random:NSColor{return ColorUtils.randomColor()}
}
