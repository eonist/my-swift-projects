class NumbeParser{
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
     * Linearly interpolation (lerp)
     * @param a: start number
     * @param b: end number
     * @param fraction: interpolation value (between 0 - 1)
     * EXAMPLE: interpolate(5, 15, 0.5) //10
     */
    class func interpolate( a: Double, _ b: Double, _ fraction: Double) -> Double {
        return fraction * (b - a) + a
    }
    /**
    * Returns the numeric distance between two values (always positive)
    * @example
    * @Note doing Math.abs(b-a) instead of this method may be faster
    * // :TODO: do a bulk test to see which is faster, then maybe deprecate this method
    * trace(distance(-5,-2));//3
    * trace(distance(-5,2));//7
    * trace(distance(5,2));//3
    * trace(distance(5,-2));//7
    */
    class func distance(a:Number,b:Number):Number {
        if(NumberAsserter.negative(a) && NumberAsserter.negative(b)) return Math.abs(Math.min(a,b)) - Math.abs(Math.max(a,b));
        else if(NumberAsserter.positive(a) && NumberAsserter.positive(b)) return Math.max(a, b) - Math.min(a,b);
        else return Math.abs(a) + Math.abs(b);/*if a is positive then b is negative and opposite*/
    }
    
    /**
     * Returns the number if its within min-max returns min if its lower and max if its higher
     * TODO: write examples for this
     */
    class func clip<T: Comparable>(value: T, min minValue: T, max maxValue: T) -> T {
        return max(min(value, maxValue), minValue)
    }
}
