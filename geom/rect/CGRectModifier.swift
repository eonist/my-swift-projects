import Cocoa

class CGRectModifier {
    /**
     * NOTE: modifies the original Rectangle instance, but is returned for chaining purposes
     * NOTE: positions from the top left of the rectangle
     */
    static func position(inout rectangle:CGRect,_ position:CGPoint) -> CGRect {
        let difference:CGPoint = PointParser.difference(rectangle.topLeft,position)
        rectangle.offsetInPlace(difference)
        return rectangle
    }
    /**
     * PARAM: position this value is the new center-position
     * TODO: the difference could be calculated before-hand
     * NOTE: the rectangle is returned because it may be convenient when you chain methods together
     */
    static func centerPosition(inout rectangle:CGRect,_ position:CGPoint) -> CGRect {
        let difference:CGPoint = PointParser.difference(rectangle.center, position)
        rectangle.offsetInPlace(difference)
        return rectangle
    }
}
