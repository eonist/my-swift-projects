import Foundation

class ReflectionUtils {
    /**
     *
     */
    class func toType(value:String, _ type:String) -> Any{
        switch(true) {
            case type == "String":return value
            case type == "CGFloat":return value.cgFloat
            case type == "Double":return value.double
            case type == "Int":return value.int
            case type == "UInt":return value.uint
            case type == "Bool":return value.bool
            case type == "DropShaodw":return value
            default : fatalError("TYPE NOT SUPPORTED: " + "\(type)" + " value: " + "\(value)")
        }
        
    }
}
