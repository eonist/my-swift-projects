import Foundation

class ReflectionUtils {
    /**
     *
     */
    class func toType(value:String, _ type:String) -> Any{
        switch(true) {
            case type == "CGFloat":return value.cgFloat
            case type == "String":return value
            case type == "Bool":return value
            default : fatalError("TYPE NOT SUPPORTED: " + "\(type)" + " value: " + "\(value)")
        }
        
    }
}
