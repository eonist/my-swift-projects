class RangeParser {
    /**
     * Returns the minimum or smallest value in the range.
     */
    class func min(range:Range)->CGFloat {
        return Math.min(range.start, range.end);
    }
    /**
     * Returns The maximum or largest value in the range.
     */
    class func max(range:Range)->CGFloat {
        return Math.max(range.start, range.end);
    }
}