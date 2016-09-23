import Cocoa

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