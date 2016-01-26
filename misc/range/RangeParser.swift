class RangeParser {
    /**
     * Returns the minimum or smallest value in the range.
     */
    class func min<T:Comparable>(range:Range<T>)->T {
        return min(range.start, range.end);
    }
    /**
     * Returns The maximum or largest value in the range.
     */
    class func max<T:Comparable>(range:Range<T>)->T {
        return max(range.start, range.end);
    }
}