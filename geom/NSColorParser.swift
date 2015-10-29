import Foundation
import Cocoa

class NSColorParser {
    /**
    * NOTE: I think you can also just do: NSColor.redColor().CGColor, which renders this method obsolete
    */
    class func cgColor(nsColor:NSColor)->CGColor{
        let ciColor:CIColor = CIColor(color: nsColor)!
        let cgColor = CIColorParser.cgColor(ciColor)
        return cgColor
    }
    
}

