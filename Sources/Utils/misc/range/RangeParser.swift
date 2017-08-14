/**
 * NOTE: Swift has some of these methods built in but its nice to have them in one place, and also so that you can create other methods with similar DNA
 * TODO: Look up Strideable when you need to impliment distatnceTo and advanceBy or even difference
 */
class RangeParser {
    /**
     * Returns the minimum or smallest value in the range.
     */
    static func min<T>(_ range:Range<T>)->T {
        return Swift.min(range.start, range.end)
    }
    static func describe<T>(_ range:Range<T>) {
        Swift.print("range.start: " + "\(range.start)")
        Swift.print("range.end: " + "\(range.end)")
    }
    /**
     * Returns The maximum or largest value in the range.
     */
    static func max<T>(_ range:Range<T>)->T {
        return Swift.max(range.start, range.end)
    }
    /**
     * Returns a clone of the PARAM: range instance
     */
    static func clone<T>(_ range:Range<T>) -> Range<T> {
        return Range(range.start, range.end)
    }
    /**
     * NOTE: only works with Range<Int>
     */
    static func difference(_ range:Range<Int>) -> Int{
        return range.end - range.start
    }
    /**
     * EXAMPLE: Range<Int>(0,3).numOfIndecies()//4 -> because [0,1,2,3].count// 4
     * NOTE: only works with Range<Int> for now
     */
    static func numOfIndecies(_ range:Range<Int>) -> Int{
        return range.end - range.start + 1
    }
    /**
     * Returns the intersection between PARAM: a and PARAM: b
     * NOTE: edges are considered intersecting, use absolulteIntersection if you need non-edge cases
     * EXAMPLE: intersection(0..<4,2..<7)//Output: 2..<4
     */
    static func intersection<T>(_ a:Range<T>, _ b:Range<T>) -> Range<T>?{
        var start:T?
        if(RangeAsserter.within(a, b.start)){start = b.start}
        else if(RangeAsserter.within(b, a.start)){start = a.start}
        var end:T?
        if(RangeAsserter.within(a, b.end)){end = b.end}
        else if(RangeAsserter.within(b, a.end)){end = a.end}
        return start != nil && end != nil ? start!..<end! : nil
    }
    /**
     * Returns the left overs after an intersection
     * exclusion(0..<4, 2..<7)//0..<2, 4..<7
     */
    static func exclusion<T>(_ a:Range<T>, _ b:Range<T>) -> (Range<T>?,Range<T>?){
        let intersection = RangeParser.intersection(a,b)
        if(intersection != nil){
            let range1 = Swift.min(a.start,b.start)..<intersection!.start
            let range2 = intersection!.end..<Swift.max(a.end,b.end)
            return (range1,range2)
        }
        return (nil,nil)
    }
    /**
     * The items in PARAM: b that are not within PARAM: a
     * EXAMPLE: difference(0..<4, 2..<7)//nil,4..<7
     */
    static func difference<T>(_ a:Range<T>, _ b:Range<T>) -> (Range<T>?,Range<T>?){
        if(!RangeAsserter.overlaps(b, a)){//quick fix
            return (nil,b)//return early
        }
        let exclusion = RangeParser.exclusion(a, b)
        //Swift.print("exclusion: " + "\(exclusion)")
        var range1:Range<T>?
        if(exclusion.0 != nil && RangeAsserter.contains(b,exclusion.0!)){
            range1 = exclusion.0
        }
        var range2:Range<T>?
        if(exclusion.1 != nil && RangeAsserter.contains(b,exclusion.1!)){
            range2 = exclusion.1
        }
        return (range1,range2)
    }
}
