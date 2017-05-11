import Cocoa

class UnWrapUtils{
    /**
     * Making an extension for "Any" obviously doesn't seem to work, so this is the solution:
     */
    static func any(_ xml:XML,_ key:String/*,_ type:String*/) -> Any{//<--if you make this optional, it will cause problems unwrapping the value later, could be because Any is optional by nature?!?
        let child:XML = xml.firstNode(key)!
        return any(child)
    }
    private static func any(_ xml:XML) -> Any{
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
    private static func simpleAny(_ strVal:String,_ type:String)->Any{
        if(type == String(describing:CGFloat.self)){
            return CGFloat.unWrap(strVal)!
        }else if(type == "\(Double.self)"){
            return Double.unWrap(strVal)!
        }else if(type == "\(NSColor.self)"){
            return NSColor.unWrap(strVal)!
        }else if(type == "\(Bool.self)"){
            return Bool.unWrap(strVal)!
        }else if(type == "\(String.self)"){
            return String.unWrap(strVal)!
        }else{
            fatalError("type not supported yet: " + "\(type)")
        }
    }
    private static func complexAny(_ xml:XML,_ type:String)->Any{
        if(type == "Array"){
            let val:[Any] = anyArray(xml)
            return val
        }else if(type == "\(DropShadow.self)"){
            return DropShadow.unWrap(xml)!
        }else if(type == "\(RadialGradient.self)"){
            return RadialGradient.unWrap(xml)!
        }else if(type == "\(Gradient.self)"){
            return LinearGradient.unWrap(xml)!
        }else{
            fatalError("type not supported yet: " + "\(type)")
        }
    }
    /**
     * Support for Array<Any?>
     */
    static func anyArray(_ xml:XML/*,_ key:String*/) -> [Any]{
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
