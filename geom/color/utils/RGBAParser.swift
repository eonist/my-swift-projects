import Cocoa

class RGBAParser {
    /**
     * EXAMPLE: rgba(NSColor.redColor()).r//Outputs //1.0
     */
    class func color(nsColor:NSColor)->RGBA{//<--was: (r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat)
        let ciColor:CIColor = CIColor(color: nsColor)!
        return RGBA(ciColor.red,ciColor.green,ciColor.blue,ciColor.alpha)
    }
}
