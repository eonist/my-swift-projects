/**
 * NOTE: Swift has some of these methods built in but its nice to have them in one place, and also so that you can create other methods with similar DNA
 * TODO: Look up Strideable when you need to impliment distatnceTo and advanceBy or even difference
 */
class RangeParser {
    /**
     * Returns the minimum or smallest value in the range.
     */
    class func min<T:Comparable>(range:Range<T>)->T {
        return Swift.min(range.start, range.end);
    }
    /**
     *
     */
    class func describe<T>(range:Range<T>) {
        Swift.print("range.start: " + "\(range.start)")
        Swift.print("range.end: " + "\(range.end)")
    }
    /**
     * Returns The maximum or largest value in the range.
     */
    class func max<T:Comparable>(range:Range<T>)->T {
        return Swift.max(range.start, range.end);
    }
    /**
     * Returns a clone of the @param range instance
     */
    class func clone<T>(range:Range<T>) -> Range<T> {
        return Range(range.start, range.end)
    }
    /**
     * NOTE: only works with Range<Int>
     */
    class func difference(range:Range<Int>) -> Int{
        return range.end - range.start
    }
    /**
     * EXAMPLE: Range<Int>(0,3).numOfIndecies()//4 -> because [0,1,2,3].count// 4
     * NOTE: only works with Range<Int> for now
     */
    class func numOfIndecies(range:Range<Int>) -> Int{
        return range.end - range.start + 1
    }
}