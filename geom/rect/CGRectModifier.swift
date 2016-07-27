import Foundation

class CGRectModifier {
    /**
     * @Note modifies the original Rectangle instance, but is returned for chaining purposes
     * @Note positions from the top left of the rectangle
     */
    class func position(inout rectangle:CGRect,_ position:CGPoint) -> CGRect {
        let difference:CGPoint = PointParser.difference(rectangle.topLeft,position)
        return rectangle.offsetInPlace(difference)
    }
    /**
    * @param position this value is the new center-position
    * // :TODO: the difference could be calculated before-hand
    */
    public static function centerPosition(rectangle:Rectangle,position:Point):Rectangle {
    var difference:Point = PointParser.difference(RectangleParser.center(rectangle),position);
    rectangle.offsetPoint(difference);
    return rectangle;
    }
}
