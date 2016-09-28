import Cocoa
/**
 * NOTE: for special types like CGAffineTransform etc, you should make an protocol named: Reflectable that you extend CGColor CGTransform etc. that package these types into an organized xml child
 */
protocol Reflectable {
    var reflection:(type:String,value:String) {get}
}
extension CGColorRef:Reflectable{
    var reflection:(type:String,value:String) {
        return (type:"CGColor",value:self.nsColor.hexString)
    }
}
extension NSColor:Reflectable{
    var reflection:(type:String,value:String) {
        return (type:"NSColor",value:self.hexString)
    }
}
extension CGTransform:Reflectable{
    var reflection:(type:String,value:String) {
        return (type:"CGTransform",value:self.identity)
    }
}
extension CGPoint:Reflectable{
    var reflection:(type:String,value:String) {
        return (type:"CGPoint",value:self.x.string + "," + self.y.string)
    }
}
extension CGSize:Reflectable{
    var reflection:(type:String,value:String) {
        return (type:"CGSize",value:self.width.string + "," + self.height.string)
    }
}