import Cocoa

class UnWrapUtils{
    /**
     * Making an extension for "Any" obviously doesn't seem to work, so this is the solution:
     */
    static func any(_ xml:XML,_ key:String) -> Any{//<--if you make this optional, it will cause problems unwrapping the value later, could be because Any is optional by nature?!?
        guard let child:XML = xml.firstNode(key) else{fatalError("nothing in first node")}
        return any(child)
    }
    /**
     * Determines if the XML is simple or complex aka (Singular or Composit)
     */
    private static func any(_ xml:XML) -> Any{
        guard let type:String = XMLParser.attribute(xml, "type") else {fatalError("has no attrib type")}
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
     * CGFloat,Double,NSColor,Bool,String
     */
    private static func simpleAny(_ strVal:String,_ type:String)->Any{
        switch true{
            case type == "\(CGFloat.self)"):
                return CGFloat.unWrap(strVal)!
            case type == "\(Double.self)":
                return Double.unWrap(strVal)!
            case type == "\(NSColor.self)":
                return NSColor.unWrap(strVal)!
            case type == "\(Bool.self)"):
                return Bool.unWrap(strVal)!
            case type == "\(String.self)"):
                return String.unWrap(strVal)!
            default:
                fatalError("type not supported yet: " + "\(type)")
        }
        /*if(type == "\(CGFloat.self)"){
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
         }*/
    }
    /**
     *
     */
    private static func complexAny(_ xml:XML,_ type:String)->Any{
        if(type == "Array"){
            let val:[Any] = anyArray(xml)
            return val
        }else if(type == "\(DropShadow.self)"){
            return DropShadow.unWrap(xml)!
        }else if(type == "\(RadialGradient.self)"){
            return RadialGradient.unWrap(xml)!
        }else if(type == "\(Gradient.self)" || type == "LinearGradient"){ /*<-- LinearGradient is a temp fix, remove later*/
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
