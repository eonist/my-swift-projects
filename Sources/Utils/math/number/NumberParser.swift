import Foundation
class NumberParser{
    /**
     * Clips a value between min and max
     * NOTE: the Comparable part is suport for more than or less than operators "<" and ">" Equatable would be "=="
     * EXAMPLE:: minMax(100, 200, 400)//Output: 200
     * EXAMPLE:: minMax(500, 200, 400)//Output: 400
     * EXAMPLE:: minMax(300, 200, 400)//Output: 300
     */
    static func minMax<T:Comparable>(_ num:T, _ min:T, _ max:T) -> T{
        return Swift.max(min, Swift.min(max, num))
    }
    /**
     * Returns the number of decimals in a number
     * EXAMPLE: NumberParser.decimals(4.433)//Output: 3
     */
    static func decimals<T:Comparable>(_ number:T)->Int {//could also be named decimalPLaces
        var matches:[String] = String(describing:number).split(".")
        if(matches.count > 1) {return matches[1].count}
        else {return 0}
    }
    /**
     * Retuns the highest number in a list of numbers
     * Note: Swift.max can be used, but this function supports arrays Math.max doesnt, however you can use as many arguments you want with the Swift.max function
     */
    static func max<T:Comparable>(_ numbers:[T])->T {
        //var max = numbers.count > 0 ? numbers[0] : 0 as! T
        //for number in numbers {if(number > max) {max = number}}
        return numbers.max() ?? 0 as! T
    }
    /**
     * Retuns the lowest number in a list of numbers
     * Note: Swift.min can be used, but this function supports arrays Swift.Min doesn't
     */
    static func min<T:Comparable>(_ numbers:[T])->T {
        //var min = numbers.count > 0 ? numbers[0] : 0 as! T
        //for number in numbers{ if(number < min) {min = number}}
        return numbers.min() ?? 0 as! T
    }
    /**
     * Returns the floor and ceil of many numbers
     */
    static func findRangeFromNumbers<T:Comparable>(_ numbers: T...) -> (min: T, max: T)? {
        if numbers.count > 0 {
            var min = numbers[0]
            var max = numbers[0]
            numbers.forEach { number in
                if number > max {max = number}
                if number < min {min = number }
            }
            return (min, max)
        } else {
            return nil
        }
    }
    /**
     * Clips a value between min and max (optional name: clamp)
     */
    static func clip<T:Comparable>(_ val: T, _ min: T, _ max: T) -> T {return minMax(val,min,max)}
}
