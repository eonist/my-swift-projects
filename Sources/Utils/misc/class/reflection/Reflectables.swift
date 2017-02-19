import Cocoa
/**
 * Standard types
 */
extension CGColor:Reflectable{
    var reflection:(type:String,value:String) {
        return (type:"CGColor",value:RGBAParser.hex(self.nsColor))/*we store 0xFF0000FF values, which includes rgb and alpha*/
    }
}
extension NSColor:Reflectable{
    var reflection:(type:String,value:String) {
        return (type:"NSColor",value:RGBAParser.hex(self))/*we store 0xFF0000FF values, which includes rgb and alpha*/
    }
}
extension CGTransform:Reflectable{
    var reflection:(type:String,value:String) {
        return (type:"CGTransform",value:self.id)
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
