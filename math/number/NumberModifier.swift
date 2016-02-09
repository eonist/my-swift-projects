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
        let decimalCount:CGFloat = CGFloat(NumberParser.decimals(number))
        let modifier:CGFloat =  pow(10, decimalCount);
        return ((number * modifier) + (incrementation * modifier)) / modifier;
    }
}