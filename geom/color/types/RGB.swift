import Cocoa

class RGB {
	var r:UInt/*0-255*/
	var g:UInt/*0-255*/
	var b:UInt/*0-255*/
	init(_ r:UInt = 0,_ g:UInt = 0,_ b:UInt = 0) {
		self.r = r
		self.g = g
		self.b = b
	}
}
extension RGB{
    /**
     * Convenience initializer
     */
    convenience init(_ r:CGFloat = 0,_ g:CGFloat = 0,_ b:CGFloat = 0){
        self.init(r.uint,g.uint,b.uint)
    }
    var nsColor:NSColor {return NSColorParser.nsColor(self)}
    var hls:HLS {return HLSParser.hls(self)}
    var hsv:HSV {return HSVParser.hsv(self)}
    var hsb:HSB {return HSBParser.hsb(self)}
    var cmyk:CMYK {return CMYKParser.cmyk(self)}
}