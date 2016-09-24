import Foundation

class ReflectionUtils {
    /**
     *
     */
    class func toType(value:String, _ type:String){
        switch(true) {
            case type == "CGFloat":{return value.cgFloat}
            
            default : fatalError("CSSPropertyParser.property() THE: " + string + " PROPERTY IS NOT SUPPORTED")
        }
        
    }
}
