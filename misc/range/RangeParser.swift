class RangeParser {
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
    /**
     *
     */
    class func difference<T:Comparable>(range:Range<T>)->T {
        return range.start.distanceTo(range.end)
        //return range.end - range.start
    }
}