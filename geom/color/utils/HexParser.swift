import Cocoa

class HexParser {
    /**
     * EXAMPLE: hexNumber(FF0000)//Output:16711680
     */
    class func hexNumber(hex:String) -> UInt{
        return UInt(Float(hex)!)
    }
    /**
     * EXAMPLE: hexString(16711680)//Output: FF0000
     */
    class func hexString(hex:UInt) -> String{
        return NSString(format: "%2X", hex) as String
    }
    
    /**
     * Convenience method (since extensions can only return one type of each var)
     * EXAMPLE: rgb(NSColor.redColor())//16711680
     */
    class func rgb(color:NSColor) -> UInt{
        return UInt(CGFloat(color.rgb!))
    }
}
