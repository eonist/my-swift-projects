import Cocoa

extension IStyleProperty{
    /**
     * Converts xml to a Selector
     */
    static func styleProperty(xml:XML)->IStyleProperty{
        //Swift.print("xml.string: " + "\(xml.string)")
        /* let name:String = xml.firstNode("name")!.value
        //Swift.print("element: " + "\(element)")
        let valueXML:XML = xml.firstNode("value")!
        Swift.print("valueXML.XMLString: " + "\(valueXML.XMLString)")
        
        
        
        let value:Any? = nil//ReflectionUtils.toType(valueXML)
        
        let depth:Int = xml.firstNode("depth")!.value.int
        */
        fatalError("this is out of order atm")
        
        //return StyleProperty(name,value,depth)
    }
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