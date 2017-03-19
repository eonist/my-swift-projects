import Foundation

class CGFloatRangeParser {
    /**
     * Returns the minimum or smallest value in the range
     * TODO: replace this class/function with a generic solution
     */
    static func min(_ range:(start:CGFloat,end:CGFloat))->CGFloat {
        return Swift.min(range.start, range.end)
    }
    /**
     * Returns The maximum or largest value in the range
     * TODO: replace this class/function with a generic solution
     */
    static func max(_ range:(start:CGFloat,end:CGFloat))->CGFloat {
        return Swift.max(range.start, range.end)
    }
}