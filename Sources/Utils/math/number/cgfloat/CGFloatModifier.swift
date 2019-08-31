import Foundation

class CGFloatModifier {
    /**
     * Returns a number that is incremented by PARAM: incrementation
     * NOTE: The multiplication and division is a floating bug fix, optimized by looking at how many decimal points the PARAM: number has
     */
    static func increment(_ number:CGFloat,_ incrementation:CGFloat) -> CGFloat {
        let decimalCount:Int = NumberParser.decimals(number)
        let modifier:CGFloat =  pow(10, CGFloat(decimalCount))
        return ((number * modifier) + (incrementation * modifier)) / modifier
    }
    /**
     * Returns a number that is decremented by PARAM: decrementation
     * - Note: The multiplication and division is a floating bug fix, optimized by looking at how many decimal points the PARAM: number has
     */
    static func decrement(_ number:CGFloat,_ decrementation:CGFloat)->CGFloat {
        let numOfDecimals:Int = NumberParser.decimals(number)
        let modifier:CGFloat =  pow(10, CGFloat(numOfDecimals))
        return ((number * modifier) - (decrementation * modifier)) / modifier
    }
    /**
    * - Note: ⚠️️ This is an alternative: let duration = String(format: "%.01f", 3.32323242)//3.3
    * - Note: a problem with CGFloat is that all CGFloat values have a trailing decimalpoint. (Even if you return 10, then end value will be 10.0) a way around this is to convert to a string, then your probably better of using the method mentioned above
    * - Parameter places: decimalPlaces
    * ## Examples:
    * CGFloat(4.1234).toFixed(3) // 4.124
    * CGFloat(-4.0).toFixed(3) // -4
    */
   static func toFixed(_ value: CGFloat, _ places: Int) -> CGFloat {
      let divisor = pow(10, CGFloat(places))
      return (value * divisor).rounded(.up) / divisor
   }
    /**
     * Returns a number that is closest to the PARAM: closest Number
     * - Parameter: number: can be both positive and negative
     * - Parameter: closest: must be a positive number
     * ## Examples:
     * print(NumberModifier.roundTo(46, 45));//45
     * print(NumberModifier.roundTo(0, 1));//0
     * print(NumberModifier.roundTo(100, 180));//180
     * print(NumberModifier.roundTo(45, 90));//90
     * print(NumberModifier.roundTo(0, 45));//0
     */
    static func roundTo(_ number:CGFloat, _ closest:CGFloat) -> CGFloat {
        let remainder:CGFloat = number %% closest
        if remainder == 0 {return number}
        else if abs(remainder) < (closest/2) { return number - remainder}
        else if NumberAsserter.negative(number,0) { return number - (closest+remainder)}
        else {return number + (closest-remainder)}
    }
}
