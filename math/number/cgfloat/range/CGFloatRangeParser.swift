import Foundation

class CGFloatRangeParser {
    /**
     * Returns the minimum or smallest value in the range.
     */
    static func min(range:(start:CGFloat,end:CGFloat))->CGFloat {
        return Swift.min(range.start, range.end);
    }
    /**
     * Returns The maximum or largest value in the range.
     */
    static func max(range:(start:CGFloat,end:CGFloat))->CGFloat {
        return Swift.max(range.start, range.end);
    }
}