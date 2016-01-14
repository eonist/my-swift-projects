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
    //
    static var purpleStart:UInt = 0xC86EDF
    static var purpleEnd:UInt = 0xE4B7F0
 
    static var beigeStart:UInt = 0xD6CEC3
    static var beigeEnd:UInt = 0xE4DDCA
    
    static var lightBlueStart:UInt = 0x55EFCB
    static var lightBlueEnd:UInt = 0x5BCAFF
    
    static var lightGrayStart:UInt = 0xF7F7F7
    static var lightGrayEnd:UInt = 0xD7D7D7
    
    
    static var redOrangeStart:UInt = 0xFB2B69
    static var redOrangeEnd:UInt = 0xFF5B37
    
    static var lightGreenStart:UInt = 0x5AD427
    static var lightGreenEnd:UInt = 0xA4E786
    
    static var deepPurpleStart:UInt = 0xC644FC
    static var deepPurpleEnd:UInt = 0x5856D6
    
    static var purplePinkStart:UInt = 0xEF4DB6
    static var purplePinkEnd:UInt = 0xC643FC

}
extension Gradients{
    //static func red()->(start:NSColor,end:NSColor){return (NSColorParser.nsColor(redStart),NSColorParser.nsColor(redEnd))}
    
    static func red(alpha:CGFloat = 1.0)->Array<CGColor>{return [CGColor.color(redStart).alpha(alpha),CGColor.color(redEnd).alpha(alpha)]}
    static func green(alpha:CGFloat = 1.0)->Array<CGColor>{return [CGColor.color(greenStart).alpha(alpha),CGColor.color(greenEnd).alpha(alpha)]}
    static func orange(alpha:CGFloat = 1.0)->Array<CGColor>{return [CGColor.color(orangeStart).alpha(alpha),CGColor.color(orangeEnd).alpha(alpha)]}
    static func yellow(alpha:CGFloat = 1.0)->Array<CGColor>{return [CGColor.color(yellowStart).alpha(alpha),CGColor.color(yellowEnd).alpha(alpha)]}
    static func teal(alpha:CGFloat = 1.0)->Array<CGColor>{return [CGColor.color(tealStart).alpha(alpha).alpha(alpha),CGColor.color(tealEnd).alpha(alpha).alpha(alpha)]}
    static func blue(alpha:CGFloat = 1.0)->Array<CGColor>{return [CGColor.color(blueStart).alpha(alpha),CGColor.color(blueEnd).alpha(alpha)]}
    static func violet(alpha:CGFloat = 1.0)->Array<CGColor>{return [CGColor.color(violetStart).alpha(alpha),CGColor.color(violetEnd).alpha(alpha)]}
    static func magenta(alpha:CGFloat = 1.0)->Array<CGColor>{return [CGColor.color(magentaStart).alpha(alpha),CGColor.color(magentaEnd).alpha(alpha)]}
    static func black(alpha:CGFloat = 1.0)->Array<CGColor>{return [CGColor.color(blackStart).alpha(alpha),CGColor.color(blackEnd).alpha(alpha)]}
    static func silver(alpha:CGFloat = 1.0)->Array<CGColor>{return [CGColor.color(silverStart).alpha(alpha),CGColor.color(silverEnd).alpha(alpha)]}
    /*new*/
    static func beige(alpha:CGFloat = 1.0)->Array<CGColor>{return [CGColor.color(beigeStart).alpha(alpha),CGColor.color(beigeEnd).alpha(alpha)]}
    static func lightBlue(alpha:CGFloat = 1.0)->Array<CGColor>{return [CGColor.color(lightBlueStart).alpha(alpha),CGColor.color(lightBlueEnd).alpha(alpha)]}
    static func lightGray(alpha:CGFloat = 1.0)->Array<CGColor>{return [CGColor.color(lightGrayStart).alpha(alpha),CGColor.color(lightGrayEnd).alpha(alpha)]}
    static func redOrange(alpha:CGFloat = 1.0)->Array<CGColor>{return [CGColor.color(redOrangeStart).alpha(alpha),CGColor.color(redOrangeEnd).alpha(alpha)]}
    static func lightGreen(alpha:CGFloat = 1.0)->Array<CGColor>{return [CGColor.color(lightGreenStart).alpha(alpha),CGColor.color(lightGreenEnd).alpha(alpha)]}
    static func deepPurple(alpha:CGFloat = 1.0)->Array<CGColor>{return [CGColor.color(deepPurpleStart).alpha(alpha),CGColor.color(deepPurpleEnd).alpha(alpha)]}
    static func purplePink(alpha:CGFloat = 1.0)->Array<CGColor>{return [CGColor.color(purplePinkStart).alpha(alpha),CGColor.color(purplePinkEnd).alpha(alpha)]}
    static func bw(alpha:CGFloat = 1.0)->Array<CGColor>{return [CGColor.color(lightGrayStart).alpha(alpha),CGColor.color(blackEnd).alpha(alpha)]}
}