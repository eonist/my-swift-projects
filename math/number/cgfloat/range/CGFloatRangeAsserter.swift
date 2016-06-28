import Foundation

class CGFloatRangeAsserter {
    /**
     * Asserts if @param value is within the @param range
     * // :TODO: a potential bug is that <= max isnt correct, if it is max then its not within, if you think about how integers work, but this may also be correct since if a number range is asserted it may need to also include the max, for now use contained if you deal with integers
     */
    class func within(range:(start:CGFloat,end:CGFloat), _ number:CGFloat)->Bool {
        return (number <= CGFloatRangeParser.max(range) && number >= CGFloatRangeParser.min(range));
    }
    /**
     * @Note this method is supplimentary to the within method, concerning the "max" problem
     * @Note another name for this could be absolutlyWithin
     */
    class func contained(range:(start:CGFloat,end:CGFloat), _ number:CGFloat)->Bool {
        return (number < CGFloatRangeParser.max(range) && number >= CGFloatRangeParser.min(range));
    }
}