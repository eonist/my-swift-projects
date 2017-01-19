import Cocoa

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
/*
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
        fatalError("this is out of order atm, and its not needed as this class is handled automatically")
        
        //return StyleProperty(name,value,depth)
    }
}
*/
