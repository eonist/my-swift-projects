class NumbeParser{
   /*
    * Returns the floor and ceil of many numbers
    */
   class func findRangeFromNumbers(numbers: Number...) -> (min: Int, max: Int)? {
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
   /*
    * Return odd numbers
    */
    func odds(numbers:Array<Numbers>)->Array<Numbers>{
       return let odds = numbers.filter{$0 % 2 == 1}//great example of the filter method
    }
}
