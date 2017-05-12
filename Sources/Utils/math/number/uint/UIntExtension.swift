import Cocoa

extension UInt {
    var cgFloat:CGFloat {return CGFloat(self)}/*Convenince*/
    var int:Int{return Int(self)}/*Convenince*/
    var double:Double{return Double(self)}/*Convenince*/
    var color:NSColor {return NSColorParser.nsColor(self)}
}
