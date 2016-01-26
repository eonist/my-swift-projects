class RangeParser {
    /**
     * Asserts if @param value is within the @param range
     * // :TODO: a potential bug is that <= max isnt correct, if it is max then its not within, if you think about how integers work, but this may also be correct since if a number range is asserted it may need to also include the max, for now use contained if you deal with integers
     */
    class func within<T:Comparable>(range:Range<T>,_ number:T)->Bool {
        return (number <= RangeParser.max(range) && number >= RangeParser.min(range));
    }
    /**
     * @Note this method is supplimentary to the within method, concerning the "max" problem
     * @Note another name for this could be absolutlyWithin
     */
    class func function contained(range:Range,number:Number):Boolean {
        return (number < RangeParser.max(range) && number >= RangeParser.min(range));
    }
    /**
     * Returns the minimum or smallest value in the range.
     */
    class func min<T:Comparable>(range:Range<T>)->T {
        return Swift.min(range.start, range.end);
    }
    /**
     * Returns The maximum or largest value in the range.
     */
    class func max<T:Comparable>(range:Range<T>)->T {
        return Swift.max(range.start, range.end);
    }
}