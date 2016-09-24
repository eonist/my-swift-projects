import Foundation

class ReflectionUtils {
    
    
    
    /**
     * NOTE: looks at the type and converts that the value into a type
     */
    static func toType(xml:XML) -> Any?{
        if(xml.childCount == 0 || xml.value.count == 0){//return nil if the node has no value and no subNodes
            return nil
        }
        let type:String = xml["type"]!
        let value:String = xml.value
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
    /**
     *
     */
    static func populateType(){
        //DropShadow
        
        //
    }
}
