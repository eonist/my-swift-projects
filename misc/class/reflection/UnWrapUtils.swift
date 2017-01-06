import Cocoa

class UnWrapUtils{
    /**
     * Making an extension for "Any" obviously doesn't seem to work, so this is the solution:
     */
    static func any(xml:XML,_ key:String/*,_ type:String*/) -> Any{//<--if you make this optional, it will cause problems unwrapping the value later, could be because Any is optional by nature?!?
        let child:XML = xml.firstNode(key)!
        return any(child)
    }
    /**
     *
     */
    private static func any(xml:XML) -> Any{
        let type:String = XMLParser.attribute(xml, "type")!
        if(xml.hasSimpleContent){
            let strVal:String = xml.value
            return simpleAny(strVal,type)
        }else if(xml.hasComplexContent){
            return complexAny(xml,type)
        }else{
            fatalError("type not supported: " + "\(type)")
        }
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
    private static func complexAny(xml:XML,_ type:String)->Any{
        if(type == "Array"){
            let val:[Any] = anyArray(xml)
            return val
        }else if(type == String(DropShadow)){
            return DropShadow.unWrap(xml)!
        }else if(type == String(RadialGradient)){
            return RadialGradient.unWrap(xml)!
        }else if(type == String(LinearGradient)){
            return LinearGradient.unWrap(xml)!
        }else{
            fatalError("type not supported yet: " + "\(type)")
        }
    }
    /**
     * Support for Array<Any?>
     */
    static func anyArray(xml:XML/*,_ key:String*/) -> [Any]{
        var array:[Any] = [Any]()
        //let child:XML = xml.firstNode(key)!//<--this should probably be asserted first, but should we return nil or empty array then?
        if(xml.childCount > 0){
            XMLParser.children(xml).forEach{
                //let type:String = XMLParser.attribute(xml.firstNode("value")!, "type")!
                array.append(any($0))//$0.hasComplexContent ? .. : nil
            }
        }
        return array
    }
}