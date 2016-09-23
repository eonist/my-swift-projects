import Cocoa

protocol Reflectable {
    var reflection:(type:String,value:String) {get}
}
extension CGColor:Reflectable{
    var reflection:(type:String,value:String) {
        return (type:"CGColor",value:self.nsColor.hexString)
    }
}
extension NSColor:Reflectable{
    var reflection:(type:String,value:String) {
        return (type:"NSColor",value:self.hexString)
    }
}
extension CGAffineTransform{
    /*
    public var a: CGFloat
    public var b: CGFloat
    public var c: CGFloat
    public var d: CGFloat
    public var tx: CGFloat
    public var ty: CGFloat
    */
    var reflection:(type:String,value:String) {
        return (type:"CGTransform",value:self.hexString)
    }
}