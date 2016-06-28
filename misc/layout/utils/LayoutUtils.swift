import Foundation

class LayoutUtils {
    /**
     * Returns an instance from @param classType populated with values from @param array
     * @param value can be an array, if its a single value then its added to a new array
     * @param classType (Padding,Margin,Offset,OffsetType,Fillet)
     * NOTE: remember to pass in the layoutClasstype as this: Fillet.self
     * EXAMPLE: let margin:Margin = instance(4,Margin.self) as! Margin
     */
    class func instance(value:Any, _ layoutClassType:ILayout.Type) -> ILayout{
        let params:Array<Any> = value is Array<Any> ? value as! Array<Any> : [value]
        //Swift.print(params[0])
        let classType:ILayout.Type = layoutClassType
        var instance:ILayout
        switch(params.count){
            case 1: instance = classType.init(params[0])
            case 2: instance = classType.init(params[0],params[1])
            case 3: instance = classType.init(params[0],params[1],params[2])
            case 4: instance = classType.init(params[0],params[1],params[2], params[3])
            default:fatalError("ARGUMENT COUNT MISMATCH");
        }
        return instance;
    }
    /**
     * This should be done through generics etc
     */
    class func describe(offsetType:OffsetType){
        Swift.print("LayoutUtils.describe()")
        Swift.print("offsetType.top: " + "\(offsetType.top)")
        Swift.print("offsetType.bottom: " + "\(offsetType.bottom)")
        Swift.print("offsetType.left: " + "\(offsetType.left)")
        Swift.print("offsetType.right: " + "\(offsetType.right)")
    }
}