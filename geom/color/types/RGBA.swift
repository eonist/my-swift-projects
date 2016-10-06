import Cocoa

class RGBA {//<--TODO: could be a struct
    var r:CGFloat/*0-255*/
    var g:CGFloat/*0-255*/
    var b:CGFloat/*0-255*/
    var a:CGFloat/*0-100*/
    init(_ r:CGFloat = 0,_ g:CGFloat = 0,_ b:CGFloat = 0,_ a:CGFloat) {
        self.r = r
        self.g = g
        self.b = b
        self.a = a
    }
}
extension RGBA{
    var nsColor:NSColor{return NSColorParser.nsColor(r,g,b,a)}
}