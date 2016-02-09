import Foundation
class NumberModifier{
    /*
     * Directly replaces a with b, and b with a
     * NOTE: Modifies the original a and b Doubles
     */
    class func swap(inout a:Double, inout _ b:Double) {
        ObjectModifier.swapObjects(&a, &b)
    }
    /**
     * Returns a number that is incremented by @param incrementation
     * @Note: The multiplication and division is a floating bug fix, optimized by looking at how many decimal points the @param number has
     */
    class func increment(number:CGFloat,_ incrementation:CGFloat) -> CGFloat {
        let decimalCount:Int = NumberParser.decimals(number)
        let modifier:CGFloat =  pow(10, CGFloat(decimalCount));
        return ((number * modifier) + (incrementation * modifier)) / modifier;
    }
    /**
     * Returns a number that is decremented by @param incrementation
     * @Note: The multiplication and division is a floating bug fix, optimized by looking at how many decimal points the @param number has
     */
    class func decrement(number:CGFloat,_ decrementation:CGFloat)->CGFloat {
        let numOfDecimals:Int = NumberParser.decimals(number);
        let modifier:CGFloat =  pow(10, CGFloat(numOfDecimals));
        return ((number * modifier) - (decrementation * modifier)) / modifier;
    }
}