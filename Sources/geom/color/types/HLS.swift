import Cocoa

class HLS {
    var h:CGFloat/*0-240*/
    var l:CGFloat/*0-240*/
    var s:CGFloat/*0-240*/
    init(_ h:CGFloat = 0,_ l:CGFloat = 0,_ s:CGFloat = 0) {
        self.h = h
        self.l = l
        self.s = s
    }
}
extension HLS{
    var rgb:RGB{return RGBParser.rgb(self)}
    var nsColor:NSColor {return NSColorParser.nsColor(self)}
}