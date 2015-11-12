import Foundation

class LayoutUtils {
    /**
     * Returns an instance from @param classType populated with values from @param array
     * @param value can be an array, if its a single value then its added to a new array
     * @param classType (Padding,Margin,Offset,OffsetType,Fillet)
     */
    class func instance(value:Any, _ layoutClassType:ILayout.Type) -> ILayout{
        let params:Array<Double> = value is Array<Double> ? value as! Array<Double> : [Double(String(value))!]
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
}
