import Foundation
class HSV {
	var h:UInt/*0-240*/
	var s:UInt/*0-240*/
	var v:UInt/*0-240*/
	public function HSV(h:uint = 0, _ s:uint = 0, _ v:uint = 0) {
		self.h = h
		self.s = s
		self.v = v
	}
}