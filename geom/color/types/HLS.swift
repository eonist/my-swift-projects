import Foundation

class HLS {
    var h:UInt/*0-240*/
    var l:UInt/*0-240*/
    var s:UInt/*0-240*/
    init(h:uint = 0,_ l:uint = 0,_ s:uint = 0) {
        self.h = h
        self.l = l
        self.s = s
    }
}