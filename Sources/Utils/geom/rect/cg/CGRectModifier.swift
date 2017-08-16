import Cocoa

class CGRectModifier {
    /**
     * NOTE: modifies the original Rectangle instance, but is returned for chaining purposes
     * NOTE: positions from the top left of the rectangle
     */
    static func position(_ rectangle:inout CGRect,_ position:CGPoint) -> CGRect {
        let difference:CGPoint = CGPointParser.difference(rectangle.topLeft,position)
        _ = rectangle.offsetInPlace(difference)
        return rectangle
    }
    /**
     * PARAM: position this value is the new center-position
     * TODO: the difference could be calculated before-hand
     * NOTE: the rectangle is returned because it may be convenient when you chain methods together
     */
    static func centerPosition(_ rectangle:inout CGRect,_ position:CGPoint) -> CGRect {
        let difference:CGPoint = CGPointParser.difference(rectangle.center, position)
        _ = rectangle.offsetInPlace(difference)
        return rectangle
    }
}
