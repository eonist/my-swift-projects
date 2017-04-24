import Foundation

class CGFloatRangeAsserter {
    /**
     * Asserts if PARAM: value is within the PARAM: range
     * TODO: a potential bug is that <= max isnt correct, if it is max then its not within, if you think about how integers work, but this may also be correct since if a number range is asserted it may need to also include the max, for now use contained if you deal with integers
     * TODO: replace this class/function with a generic solution
     */
    static func within(_ range:(start:CGFloat,end:CGFloat), _ number:CGFloat)->Bool {
        return number <= CGFloatRangeParser.max(range) && number >= CGFloatRangeParser.min(range)
    }
    /**
     * NOTE: this method is supplimentary to the within method, concerning the "max" problem
     * NOTE: another name for this could be absolutlyWithin
     * TODO: replace this class/function with a generic solution
     */
    static func contained(_ range:(start:CGFloat,end:CGFloat), _ number:CGFloat)->Bool {
        return number < CGFloatRangeParser.max(range) && number >= CGFloatRangeParser.min(range)
    }
}
