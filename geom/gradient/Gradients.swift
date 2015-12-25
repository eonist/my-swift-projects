//FANCY Gradients:
import Cocoa
class Gradients{
    static var redGradientStartColor:UInt = 0xFF5E3A
    static var redGradientEndColor:UInt = 0xFF2A68
    static var greenGradientStartColor:UInt = 0x87FC70
    static var greenGradientEndColor:UInt = 0x0BD318
    static var orangeGradientStartColor:UInt = 0xFF9500
    static var orangeGradientEndColor:UInt = 0xFF5E3A
    static var yellowGradientStartColor:UInt = 0xFFDB4C
    static var yellowGradientEndColor:UInt = 0xFFCD02
    static var tealGradientStartColor:UInt = 0x52EDC7
    static var tealGradientEndColor:UInt = 0x5AC8FB
    static var blueGradientStartColor:UInt = 0x1AD6FD
    static var blueGradientEndColor:UInt = 0x1D62F0
    static var violetGradientStartColor:UInt = 0xC644FC
    static var violetGradientEndColor:UInt = 0x5856D6
    static var magentaGradientStartColor:UInt = 0xEF4DB6
    static var magentaGradientEndColor:UInt = 0xC643FC
    static var blackGradientStartColor:UInt = 0x4A4A4A
    static var blackGradientEndColor:UInt = 0x2B2B2B
    static var silverGradientStartColor:UInt = 0xDBDDDE
    static var silverGradientEndColor:UInt = 0x898C90
}
extension Gradients{
    static func red()->String{return ""}
        
    
    static func red()->Int{return 2}
        
    
    
    static var red:(start:NSColor,end:NSColor) = (NSColorParser.nsColor(redGradientStartColor),NSColorParser.nsColor(redGradientEndColor))
}