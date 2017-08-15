/**
 * NOTE: Swift has some of these methods built in but its nice to have them in one place, and also so that you can create other methods with similar DNA
 */
class RangeAsserter{
    /**
     * Asserts if PARAM: a equals PARAM: b
     * NOTE: you can also use the native: a == b (I think)
     */
    static func equals<T>(_ a: Range<T>, _ b:Range<T>) -> Bool  {//where T: Comparable
        return a == b
    }
    /**
     * Asserts if PARAM: number is within the PARAM: range
     * NOTE: if the number is on the edge it is considered within. Use absolutelyWithin if you need to not include edge
     * TODO: Add some examples
     * TODO: a potential bug is that <= max isn't correct, if it is max then its not within, if you think about how integers work, but this may also be correct since if a number range is asserted it may need to also include the max, for now use contained if you deal with integers
     */
    static func within<T>(_ range:Range<T>,_ number:T)->Bool {
        return number <= RangeParser.max(range) && number >= RangeParser.min(range)
    }
    /**
     * NOTE: this method is supplimentary to the within method, concerning the "max" problem
     * NOTE: another name for this could be absolutlyWithin
     */
    static func contained<T>(_ range:Range<T>,_ number:T)->Bool {
        return number >= RangeParser.min(range) && number < RangeParser.max(range)
    }
    /**
     * Asserts if PARAM: a overlaps PARAM: b
     * NOTE: touching edges are considered to overlap, use absolutlyOverlaps if you need to exclude edge cases
     */
    static func overlaps<T>(_ a:Range<T>,_ b:Range<T>)->Bool {
        return RangeAsserter.equals(a,b) || contains(a,b) || contains(b,a) || within(a,b.start) || within(a,b.end)
    }
    /**
     * Asserts if PARAM: a contains PARAM: a or PARAM: b contains PARAM: a
     * NOTE: use absolutlyContains if you want to avoid edge
     */
    static func contains<T>(_ a:Range<T>,_ b:Range<T>)->Bool {
        return a.start <= b.start && a.end >= b.end
    }
    /**
     * Asserts if PARAM: index is on either edge of PARAM: range
     */
    static func edge<T>(_ index:T, _ range:Range<T>)->Bool {
        return index == range.start || index == range.end
    }
}
