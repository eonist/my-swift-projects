import Cocoa

extension Double {
    var cgFloat:CGFloat {return CGFloat(self)}/*Convenince*/
    var uint:UInt {return UInt(self)}/*Convenince*/
    var color:NSColor {return self.uint.color}
}
