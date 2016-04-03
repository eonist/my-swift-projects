import Foundation
class HSV {
	var h:UInt/*0-240*/
	var s:UInt/*0-240*/
	var v:UInt/*0-240*/
	init(_ h:UInt = 0, _ s:UInt = 0, _ v:UInt = 0) {
		self.h = h
		self.s = s
		self.v = v
	}
}