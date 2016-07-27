import Foundation

class CGRectModifier {
    /**
     * @Note modifies the original Rectangle instance, but is returned for chaining purposes
     * @Note positions from the top left of the rectangle
     */
    class func position(rectangle:CGRect,_ position:CGPoint) -> CGRect {
        let difference:CGPoint = PointParser.difference(rectangle.topLeft,position)
        return rectangle.offset(difference)
    }
}
