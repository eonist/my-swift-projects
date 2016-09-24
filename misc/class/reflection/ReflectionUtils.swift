import Foundation

class ReflectionUtils {
    /**
     * NOTE: looks at the type and converts that the value into a type
     */
    class func toType(xml:XML) -> Any?{
        let type:String = xml["type"]!
        
        if(xml.childCount > 0){xml.children}
        
        let value:String = xml.value
        strVal.count != 0 ?
        switch(true) {
            case type == "String":return value
            case type == "CGFloat":return value.cgFloat
            case type == "Double":return value.double
            case type == "Int":return value.int
            case type == "UInt":return value.uint
            case type == "Bool":return value.bool
            case type == "DropShadow":return value
            default : fatalError("TYPE NOT SUPPORTED: " + "\(type)" + " value: " + "\(value)")
        }
        
    }
}
