//FANCY Gradients:
import Cocoa
class Gradients{
    static var redStart:UInt = 0xFF5E3A
    static var redEnd:UInt = 0xFF2A68
    static var greenStart:UInt = 0x87FC70
    static var greenEnd:UInt = 0x0BD318
    static var orangeStart:UInt = 0xFF9500
    static var orangeEnd:UInt = 0xFF5E3A
    static var yellowStart:UInt = 0xFFDB4C
    static var yellowEnd:UInt = 0xFFCD02
    static var tealStart:UInt = 0x52EDC7
    static var tealEnd:UInt = 0x5AC8FB
    static var blueStart:UInt = 0x1AD6FD
    static var blueEnd:UInt = 0x1D62F0
    static var violetStart:UInt = 0xC644FC
    static var violetEnd:UInt = 0x5856D6
    static var magentaStart:UInt = 0xEF4DB6
    static var magentaEnd:UInt = 0xC643FC
    static var blackStart:UInt = 0x4A4A4A
    static var blackEnd:UInt = 0x2B2B2B
    static var silverStart:UInt = 0xDBDDDE
    static var silverEnd:UInt = 0x898C90
}
extension Gradients{
    //static func red()->(start:NSColor,end:NSColor){return (NSColorParser.nsColor(redStart),NSColorParser.nsColor(redEnd))}
    
    static func red()->Array<CGColor>{return [CGColor.color(redStart),CGColor.color(redEnd)]}
    
}