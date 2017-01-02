/**
 * NOTE: Swift has some of these methods built in but its nice to have them in one place, and also so that you can create other methods with similar DNA
 */
class RangeAsserter{
    /**
     * Asserts if PARAM: a equals PARAM: b
     * NOTE: you can also use the native: a == b (I think)
     */
    static func equals<T:Comparable>(a:Range<T>,_ b:Range<T>)->Bool {
        return a.start == b.start && a.end == b.end
    }
    /**
     * Asserts if PARAM: value is within the @param range
     * TODO: Add some examples
     * TODO: a potential bug is that <= max isn't correct, if it is max then its not within, if you think about how integers work, but this may also be correct since if a number range is asserted it may need to also include the max, for now use contained if you deal with integers
     */
    static func within<T:Comparable>(range:Range<T>,_ number:T)->Bool {
        return (number <= RangeParser.max(range) && number >= RangeParser.min(range))
    }
    /**
     * NOTE: this method is supplimentary to the within method, concerning the "max" problem
     * NOTE: another name for this could be absolutlyWithin
     */
    static func contained<T:Comparable>(range:Range<T>,_ number:T)->Bool {
        return (number < RangeParser.max(range) && number >= RangeParser.min(range))
    }
    /**
     * Asserts if @param a overlaps @param b
     */
    static func overlaps<T:Comparable>(a:Range<T>,_ b:Range<T>)->Bool {
        return (RangeAsserter.equals(a,b) || contains(a,b) || contains(b,a) || within(a,b.start) || within(a,b.end))
    }
    /**
     * Asserts if PARAM: a contains PARAM: a or PARAM: b contains PARAM: a
     */
    static func contains<T:Comparable>(a:Range<T>,_ b:Range<T>)->Bool {
        return a.start <= b.start && a.end >= b.end
    }
    /**
     * Asserts if PARAM: index is on either edge of PARAM: range
     */
    static func edge<T:Comparable>(index:T, _ range:Range<T>)->Bool {
        return index == range.start || index == range.end
    }
}