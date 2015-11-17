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
     * Returns the number if its within min-max returns min if its lower and max if its higher
     */
    class func clip<T: Comparable>(value: T, min minValue: T, max maxValue: T) -> T {
        return max(min(value, maxValue), minValue)
    }
}
