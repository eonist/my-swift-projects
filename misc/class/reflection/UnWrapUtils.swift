import Cocoa

//Continue here: all is working, now fix the bug in reflection where Array<Any> isn't parsed correctly.

class UnWrapUtils{
    /**
     * Making an extension for "Any" obviously doesn't seem to work, so this is the solution:
     */
    static func any(xml:XML,_ key:String/*,_ type:String*/)-> Any?{
        let child:XML = xml.firstNode(key)!
        return any(child)
    }
    /**
     *
     */
    private static func any(xml:XML)-> Any?{
        let type:String = XMLParser.attribute(xml, "type")!
        var value:Any? = nil
        if(xml.hasSimpleContent){
            let strVal:String = xml.value
            value = simpleAny(strVal,type)
        }else if(xml.hasComplexContent){
            value = complexAny(xml,type)
        }
        return value
    }
    /**
     * Support for Array<Any?>
     */
    static func anyArray(xml:XML/*,_ key:String*/) -> [Any?]{
        var array:[Any?] = [Any?]()
        //let child:XML = xml.firstNode(key)!//<--this should probably be asserted first, but should we return nil or empty array then?
        if(xml.childCount > 0){
            XMLParser.children(xml).forEach{
                //let type:String = XMLParser.attribute(xml.firstNode("value")!, "type")!
                array.append(any($0))//$0.hasComplexContent ? .. : nil
            }
        }
        return array
    }
    /**
     *
     */
    private static func simpleAny(strVal:String,_ type:String)->Any{
        if(type == String(CGFloat)){
            return  CGFloat.unWrap(strVal)!
        }else if(type == String(Double)){
            return Double.unWrap(strVal)!
        }else if(type == String(NSColor)){
            return NSColor.unWrap(strVal)!
        }else if(type == String(Bool)){
            return Bool.unWrap(strVal)!
        }else if(type == String(String)){
            return String.unWrap(strVal)!
        }else{
            fatalError("type not supported yet: " + "\(type)")
        }
    }
    /**
     *
     */
    private static func complexAny(xml:XML,_ type:String)->Any?{
        let value:Any?
        if(type == "Array"){
            let val:[Any?] = anyArray(xml)
            value = val
        }else if(type == String(DropShadow)){
            let val:DropShadow = DropShadow.unWrap(xml)!
            value = val
        }else if(type == String(RadialGradient)){
            let val:RadialGradient = RadialGradient.unWrap(xml)!
            value = val
        }else if(type == String(LinearGradient)){
            let val:LinearGradient = LinearGradient.unWrap(xml)!
            value = val
        }else{
            fatalError("type not supported yet: " + "\(type)")
        }
        return value
    }
}