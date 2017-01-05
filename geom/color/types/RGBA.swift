import Cocoa
/**
 * IMPORTANT: you can't use values like 0.5 etc
 */
class RGBA {//<--TODO: could be a struct
    var r:UInt/*0-255*/
    var g:UInt/*0-255*/
    var b:UInt/*0-255*/
    var a:UInt/*0-255 (this could be 0-100 but when you convert this from a hex it automatically works with the range 0-255)*/
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
    var nsColor:NSColor{return NSColorParser.nsColor(r.cgFloat,g.cgFloat,b.cgFloat,a.cgFloat)}
}