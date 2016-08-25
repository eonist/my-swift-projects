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
    /**
     * NOTE: This is an alternative: let duration = String(format: "%.01f", 3.32323242)
     * NOTE: a problem with CGFloat is that all CGFloat values have a trailing decimalpoint. (Even if you return 10, then end value will be 10.0) a way around this is to convert to a string, then your probably better of using the method mentioned above 
     */
    class func toFixed(value:CGFloat, _ places:Int) -> CGFloat {
        let divisor = pow(10, CGFloat(places))
        return round(value * divisor) / divisor
    }
    /**
    * Returns a number that is closest to the @param closest Number
    * @param number: can be both positive and negative
    * @param closest: must be a positive number
    * print(NumberModifier.roundTo(46, 45));//45
    * print(NumberModifier.roundTo(0, 1));//0
    * print(NumberModifier.roundTo(100, 180));//180
    * print(NumberModifier.roundTo(45, 90));//90
    * print(NumberModifier.roundTo(0, 45));//0
    */
    class func roundTo(number:CGFloat, closest:CGFloat) -> CGFloat {
        var remainder:CGFloat = number % closest
        if(remainder == 0) return number
        else if(Math.abs(remainder) < (closest/2)) return number - remainder
        else if (NumberAsserter.negative(number)) return number - (closest+remainder)
        else return number + (closest-remainder)
    }
}