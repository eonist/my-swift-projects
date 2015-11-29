import Foundation

class CGFloatRangeParser {
    /**
     * Returns the minimum or smallest value in the range.
     */
    class func miny(range:(CGFloat,CGFloat))->CGFloat {
        return min(range[0], range[1]);
    }
    /**
     * Returns The maximum or largest value in the range.
     */
    class func max(range:Range<T>)->T {
        return max(range.start, range.end);
    }
}
