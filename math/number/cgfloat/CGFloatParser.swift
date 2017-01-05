import Foundation

public class CGFloatParser{
    /**
     * Returns an a array of interpoated numbers between min and max
     * EXAMPLE: CGFloatParser.interpolatedRange(0,  1,  3)//[0.0, 0.5, 1.0]
     */
     static func interpolatedRange(min:CGFloat ,_ max:CGFloat,_ length:Int)->Array<CGFloat>{
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
}