import Foundation

class CGFloatRangeParser {
    /**
     * Returns the minimum or smallest value in the range.
     */
    class func miny(range:(start:CGFloat,end:CGFloat))->CGFloat {
        return min(range.start, range.end);
    }
    /**
     * Returns The maximum or largest value in the range.
     */
    class func max(range:Range<T>)->T {
        return max(range.start, range.end);
    }
}
