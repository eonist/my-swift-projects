import Cocoa

class ColorParser {/*Covers returning hex colors etc*/
    /**
     *
     */
    class func hexColor(nsColor:NSColor)->String{
        
        return ColorUtils.hexString(<#T##hex: UInt##UInt#>)
    }
    /**
     * EXAMPLE: rgba(NSColor.redColor()).r//Outputs //1.0
     */
    class func rgba(nsColor:NSColor)->(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat){
        let ciColor:CIColor = CIColor(color: nsColor)!
        return (ciColor.red,ciColor.green,ciColor.blue,ciColor.alpha)
    }
}
