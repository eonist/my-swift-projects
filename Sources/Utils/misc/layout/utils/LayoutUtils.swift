import Foundation

class LayoutUtils {
    /**
     * Returns an instance from PARAM: classType populated with values from PARAM: array
     * PARAM: value can be an array, if its a single value then its added to a new array
     * PARAM: classType (Padding,Margin,Offset,OffsetType,Fillet)
     * NOTE: remember to pass in the layoutClasstype as this: Fillet.self
     * EXAMPLE: let margin:Margin = instance(4,Margin.self) as! Margin
     */
    static func instance(_ value:Any, _ layoutClassType:LayoutKind.Type) -> LayoutKind{
        let params:[Any] = value is [Any] ? value as! [Any] : [value]
        let classType:LayoutKind.Type = layoutClassType
        return {
            switch(params.count){
                case 1: return classType.init(params[0])
                case 2: return classType.init(params[0],params[1])
                case 3: return classType.init(params[0],params[1],params[2])
                case 4: return classType.init(params[0],params[1],params[2], params[3])
                default:fatalError("ARGUMENT COUNT MISMATCH")
            }
        }()
    }
    /**
     * This should be done through generics etc
     */
    static func describe(_ offsetType:OffsetType){
        Swift.print("LayoutUtils.describe()")
        Swift.print("offsetType.top: " + "\(offsetType.top)")
        Swift.print("offsetType.bottom: " + "\(offsetType.bottom)")
        Swift.print("offsetType.left: " + "\(offsetType.left)")
        Swift.print("offsetType.right: " + "\(offsetType.right)")
    }
}
