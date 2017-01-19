import Cocoa
class HSV {
	var h:CGFloat/*0-240*/
	var s:CGFloat/*0-240*/
	var v:CGFloat/*0-240*/
	init(_ h:CGFloat = 0, _ s:CGFloat = 0, _ v:CGFloat = 0) {
		self.h = h
		self.s = s
		self.v = v
	}
}
extension HSV{
    var rgb:RGB {return RGBParser.rgb(self)}
    var nsColor:NSColor{return NSColorParser.nsColor(self)}
}