import Foundation
class NumberParser{
    /**
     * Return a  Random number within a min max value
     */
    static func random(min:Int, max:Int)->Int{//returns an integer between 0 - x
        let randomNr:Int = Int(arc4random_uniform(UInt32(max)) + UInt32(min))
        return randomNr
    }
    /**
     * Returns the number with a set number of @param decimalCount
     * @Note unlike the tofixed method that returns this: Number(6.0001).toFixed(2)// 6.01, the aprox method returns a more clinical number
     * @Note the approx method does not Round up or down by taking into account the decimal after the @param decimalCount, this could be usefull in the future
     * @Note the approx method works exactly as the aproximatly equal sign in real math except the part about rounding up and down, and by the way toFixed method does not handle the rounding correctly eigther as it rounds from futher then next to @param decimalCount
     * @example NumberParser.approx(Math.cos(Trig.RAD*90), 22)//6.12323e-17
     * @example NumberParser.approx(Math.cos(Trig.RAD*90), 3)//0
     * EXAMPLE: approx(40.126,2)//40.13
     * EXAMPLE: approx(40.124,2)//40.12
     * CAUTION: the old approx method was a little different. try stackoverflow if this design doesn't work in every case
     */
    class func approx(number:CGFloat,_ decimalCount:Int) -> CGFloat{
        let format = NSString(format: "%%.%if", decimalCount)
        let string = NSString(format: format, number)
        return CGFloat(atof(string.UTF8String))
    }
   /**
    * Returns the floor and ceil of many numbers
    */
   class func findRangeFromNumbers(numbers: Double...) -> (min: Double, max: Double)? {
       if numbers.count > 0 {
           var min = numbers[0]
           var max = numbers[0]
           for number in numbers {
               if number > max {max = number}
               if number < min { min = number }
           }
           return (min, max)
       } else {
           return nil
       }
   }
   /**
    * Return odd numbers
    */
    class func odds(numbers:Array<Double>)->Array<Double>{
        let odds = numbers.filter{$0 % 2 == 1}//great example of the filter method
        return odds
    }
    /**
     * sums numbers with addition
     * // :TODO: add an option for multiplication minus and dividens
     */
    class func sum(numbers:Array<Double>)->Double {
        var sum:Double = 0;
        for number in numbers {
            sum += number
        }
        return sum;
    }
    /**
     * Returns the number you can add to start that becomes end (start + x = end)
     * @Note unlike the distance method this can return negative and positive values
     * @Note suppliments the distance function in that it returns the directional correct distance
     * // :TODO: couldnt you just do b - a ? there is no difference, this method is a waste of cpu
     * print(difference(3,7))//4
     * print(difference(3,-2))//-5
     * print(difference(-3,-7))//-4
     * print(difference(-3,7))//10
     */
    class func difference(a:CGFloat, _ b:CGFloat)->CGFloat{
        let distance:CGFloat = NumberParser.distance(a, b)
        if(a > b) {return -distance}
        else if(a < b) {return distance}
        else {return 0}
    }
    /** 
     * Linearly interpolation (lerp)
     * @param a: start number
     * @param b: end number
     * @param fraction: interpolation value (between 0 - 1) could also be named scalar
     * EXAMPLE: interpolate(5, 15, 0.5) //10
     */
    class func interpolate( a: CGFloat, _ b: CGFloat, _ fraction: CGFloat) -> CGFloat {//<--was Double, cgfloat makes more sense
        return fraction * (b - a) + a
    }
    /**
     * Returns the scalar value from the real progress between two polar numbers
     * @param start: start number
     * @param end: end number
     * @param progress progress between a and b
     * @return interpolation value between if transition value is within range it will be between 0 and 1 (scalar amount)
     * @Note to find a scalar value i.e 50/100 = 0.5
     * @example scalar(0,8,4) //Output: 0.5
     * print("q: " + NumberParser.scalar(0, -100, -25));//0.25
     * print("q: " + NumberParser.scalar(-200, -100, -150));//0.5
     * print("q: " + NumberParser.scalar(5, 10, 7.5));//0.5
     */
    class func scalar(start:CGFloat,_ end:CGFloat, _ progress:CGFloat) -> CGFloat {
        var a:CGFloat
        var b:CGFloat
        if(NumberAsserter.negative(start) || NumberAsserter.negative(end) && end < start){
            a = Swift.min(start, end)
            b = Swift.max(start, end)
        }else{
            a = Swift.max(start, end)
            b = Swift.min(start, end)
        }
        var scalar:CGFloat = (progress-b)/(a-b)
        if(scalar.isNaN) {scalar = 0}
        return scalar
    }
    /**
     * Returns the numeric distance between two values (always positive)
     * @example
     * @Note doing Math.abs(b-a) instead of this method may be faster
     * // :TODO: do a bulk test to see which is faster, then maybe deprecate this method
     * print(distance(-5,-2));//3
     * print(distance(-5,2));//7
     * print(distance(5,2));//3
     * print(distance(5,-2));//7
     */
    class func distance(a:CGFloat,_ b:CGFloat)->CGFloat {
        if(NumberAsserter.negative(a) && NumberAsserter.negative(b)) {return abs(Swift.min(a,b)) - abs(Swift.max(a,b))}
        else if(NumberAsserter.positive(a) && NumberAsserter.positive(b)) {return Swift.max(a, b) - Swift.min(a,b)}
        else {return abs(a) + abs(b)}/*if a is positive then b is negative and opposite*/
    }
    /**
     * Returns the difference between a and b (the returning number can be negative or posetive or zero)
     */
    class func relativeDifference(a:CGFloat,_ b:CGFloat)->CGFloat{
        return b-a
    }
    /**
     * Returns the number if its within min-max returns min if its lower and max if its higher
     * TODO: write examples for this
     */
    class func clip<T: Comparable>(value: T, min minValue: T, max maxValue: T) -> T {/*I belive the Comparable part is suport for more than or less than operators "<" and ">" Equatable would be "=="*/
        return Swift.max(Swift.min(value, maxValue), minValue)
    }
    /**
     * Returns the number if its within min-max returns min if its lower and max if its higher
     * @example: minMax(100, 200, 400)//Output: 200
     * @example: minMax(500, 200, 400)//Output: 400
     * @example: minMax(300, 200, 400)//Output: 300
     * NOTE: a better name for this is clip(2,1,5)
     */
    class func minMax<T: Comparable>(num:T , _ min : T , _ max : T) -> T{
        return Swift.max(min, Swift.min(max, num));
    }
    /**
     * Returns the number of decimals in a number
     * @example: NumberParser.decimals(4.433)//Output: 3
     */
    class func decimals(number:CGFloat)->Int {//could also be named decimalPLaces
        var matches:Array<String> = String(number).split(".");
        if(matches.count > 1) {return matches[1].count}
        else {return 0}
    }
    /**
     * Retuns the highest number in a list of numbers
     * Note: Swift.max can be used, but this function supports arrays Math.max doesnt, however you can use as many arguments you want with the Swift.max function
     */
    class func max(numbers:Array<CGFloat>)->CGFloat {
        var max:CGFloat = numbers.count > 0 ? numbers[0] : 0
        for  number : CGFloat in numbers {if(number > max) {max = number}}
        return max
    }
    /**
     * Retuns the lowest number in a list of numbers
     * Note: Swift.min can be used, but this function supports arrays Swift.Min doesnt
     */
    class func min(numbers:Array<CGFloat>)->CGFloat {
        var min:CGFloat = numbers.count > 0 ? numbers[0] : 0
        for number : CGFloat in numbers{ if(number < min) {min = number}}
        return min;
    }
}