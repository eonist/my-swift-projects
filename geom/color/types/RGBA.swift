import Foundation

class RGBA {
    var r:UInt/*0-255*/
    var g:UInt/*0-255*/
    var b:UInt/*0-255*/
    var a:UInt
    init(_ r:UInt = 0,_ g:UInt = 0,_ b:UInt = 0,_ a:UInt) {
        self.r = r
        self.g = g
        self.b = b
        self.a = a
    }
}
extension RGBA{
    convenience init(_ r:CGFloat = 0,_ g:CGFloat = 0,_ b:CGFloat = 0, _ a:CGFloat = 0){
        self.init(r.uint,g.uint,b.uint,a.uint)
    }
}
