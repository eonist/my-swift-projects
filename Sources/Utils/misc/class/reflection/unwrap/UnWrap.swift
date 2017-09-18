import Cocoa
/**
 * Unwrap: XML -> class instance
 */
class UnWrap{
    /**
     * NOTE: Making an extension for "Any" obviously doesn't seem to work, so this is the solution:
     */
    static func any(_ xml:XML,_ key:String) -> Any{//<--if you make this optional, it will cause problems unwrapping the value later, could be because Any is optional by nature?!?
        guard let child:XML = xml.firstNode(key) else{fatalError("nothing in first node")}
        return any(child)
    }
    /**
     * Determines if the XML is simple or complex aka (Singular or Composit)
     * TODO: ⚠️️ Use _ where in the switch
     */
    private static func any(_ xml:XML) -> Any{
        guard let type:String = XMLParser.attribute(xml, "type") else {fatalError("has no attrib type")}
        switch true{
            case xml.hasSimpleContent:
                let strVal:String = xml.value
                return simpleAny(strVal,type)
            case xml.hasComplexContent:
                return complexAny(xml,type)
            default:
                fatalError("type not supported: " + "\(type)")
        }
    }
    /**
     * CGFloat,Double,NSColor,Bool,String
     * TODO: ⚠️️ Use _ where in the switch
     */
    private static func simpleAny(_ strVal:String,_ type:String)->Any{
        switch true{
            case type == "\(CGFloat.self)":
                return CGFloat.unWrap(strVal)!
            case type == "\(Double.self)":
                return Double.unWrap(strVal)!
            case type == "\(NSColor.self)":
                return NSColor.unWrap(strVal)!
            case type == "\(Bool.self)":
                return Bool.unWrap(strVal)!
            case type == "\(String.self)":
                return String.unWrap(strVal)!
            default:
                fatalError("type not supported yet: " + "\(type)")
        }
    }
    /**
     * Array,DropShadow,RadialGradient,RadialGradient,LinearGradient
     * TODO: ⚠️️ Use _ where in the switch
     */
    private static func complexAny(_ xml:XML,_ type:String)->Any{
        switch true{
            case type == "Array":
                let val:[Any] = anyArray(xml)
                return val
            case type == "\(DropShadow.self)":
                return DropShadow.unWrap(xml)!
            case type == "\(RadialGradient.self)":
                return RadialGradient.unWrap(xml)!
            case type == "\(Gradient.self)" || type == "\(LinearGradient.self)":
                return LinearGradient.unWrap(xml)!
            default:
                fatalError("type not supported yet: " + "\(type)")
        }
    }
    /**
     * Support for Array<Any?>
     */
    static func anyArray(_ xml:XML) -> [Any]{
        return xml.hasChildren ? XMLParser.children(xml).map{any($0)} : [Any]()
    }
}
