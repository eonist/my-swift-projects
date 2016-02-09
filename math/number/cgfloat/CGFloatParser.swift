import Foundation

public class CGFloatParser{
    /**
     * Returns an a array of interpoated numbers between min and max
     * EXAMPLE: CGFloatParser.interpolatedRange(0,  1,  3)//[0.0, 0.5, 1.0]
     */
    public class func interpolatedRange(min:CGFloat ,_ max:CGFloat,_ length:Int)->Array<CGFloat>{
        var interpolatedRange:Array<CGFloat> = []
        if(length == 0){return interpolatedRange}//only populate the array with values if the length is more than zero
        let increaseBy:CGFloat = max/CGFloat(length-1)
        //Swift.print(value)
        var curVal:CGFloat = 0
        interpolatedRange.append(min)
        for var i = 1; i < length-1; ++i{
            //Swift.print("i: " + "\(i)")
            curVal += increaseBy
            interpolatedRange.append(curVal)
            
        }
        interpolatedRange.append(max)
        return interpolatedRange
    }
    /**
     * Returns the number if its within min-max returns min if its lower and max if its higher
     * @example: MathUtil.minMax(100, 200, 400)//Output: 200
     * @example: MathUtil.minMax(500, 200, 400)//Output: 400
     * @example: MathUtil.minMax(300, 200, 400)//Output: 300
     * NOTE: a better name for this is clip(2,1,5)
     */
    public static function minMax(number:Number , min : Number , max : Number) : Number{
        return Math.max(min, Math.min(max, number));
    }
}