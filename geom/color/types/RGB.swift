import Foundation

class RGB {
	var r:UInt/*0-255*/
	var g:UInt/*0-255*/
	var b:UInt/*0-255*/
	init(r:UInt = 0,_ g:UInt = 0,_ b:UInt = 0) {
		self.r = r
		self.g = g
		self.b = b
	}
}