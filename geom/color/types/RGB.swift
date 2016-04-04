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
     * convenience initiater
     */
    convenience init(_ r:CGFloat = 0,_ g:CGFloat = 0,_ b:CGFloat = 0){
        self.init(r.uint,g.uint,b.uint)
    }
    var nsColor:NSColor {return NSColorParser.nsColor(self.r, self.g, self.b)}
    var hls:HLS {return HLSParser.hls(self)}
}