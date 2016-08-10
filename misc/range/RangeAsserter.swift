/**
 * NOTE: Swift has some of these methods built in but its nice to have them in one place, and also so that you can create other methods with similar DNA
 */
class RangeAsserter{
    /**
     * Asserts if @param a equals @param b
     */
    class func equals<T:Comparable>(a:Range<T>,_ b:Range<T>)->Bool {
        return a.start == b.start && a.end == b.end
    }
    /**
     * Asserts if @param value is within the @param range
     * // :TODO: a potential bug is that <= max isnt correct, if it is max then its not within, if you think about how integers work, but this may also be correct since if a number range is asserted it may need to also include the max, for now use contained if you deal with integers
     */
    class func within<T:Comparable>(range:Range<T>,_ number:T)->Bool {
        return (number <= RangeParser.max(range) && number >= RangeParser.min(range))
    }
    /**
     * @Note this method is supplimentary to the within method, concerning the "max" problem
     * @Note another name for this could be absolutlyWithin
     */
    class func contained<T:Comparable>(range:Range<T>,_ number:T)->Bool {
        return (number < RangeParser.max(range) && number >= RangeParser.min(range))
    }
    /**
     * Asserts if @param a overlaps @param b
     */
    class func overlaps<T:Comparable>(a:Range<T>,_ b:Range<T>)->Bool {
        return (RangeAsserter.equals(a,b) || contains(a,b) || contains(b,a) || within(a,b.start) || within(a,b.end))
    }
    /**
     * Asserts if @param a contains @param a or @param b contains @param a
     */
    class func contains<T:Comparable>(a:Range<T>,_ b:Range<T>)->Bool {
        return a.start <= b.start && a.end >= b.end
    }
}