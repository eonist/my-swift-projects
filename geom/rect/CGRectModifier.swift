import Cocoa

class CGRectModifier {
    /**
     * @Note modifies the original Rectangle instance, but is returned for chaining purposes
     * @Note positions from the top left of the rectangle
     */
    class func position(inout rectangle:CGRect,_ position:CGPoint) -> CGRect {
        let difference:CGPoint = PointParser.difference(rectangle.topLeft,position)
        rectangle.offsetInPlace(difference)
        return rectangle
    }
    /**
     * @param position this value is the new center-position
     * // :TODO: the difference could be calculated before-hand
     * NOTE: the rectangle is returned because it may be convenient when you chain methods together
     */
    class func centerPosition(inout rectangle:CGRect,_ position:CGPoint) -> CGRect {
        let difference:CGPoint = PointParser.difference(rectangle.center, position)
        rectangle.offsetInPlace(difference)
        return rectangle
    }
    /**
     * Modifies the original @param globalRectangle
     * @Note remember to use the clone() method on the globalRectangle or it will be modified
     * // :TODO: create a similar method for localToGlobal
     * @example var localRectangle:Rectangle = RectangleModifier.globalToLocal(rectangle1.clone(), sprite);
     */
    class func globalToLocal(inout globalRectangle:CGRect,_ localView:NSView) -> CGRect {
        var localRectangle:CGRect = CGRect(0,0,globalRectangle.width,globalRectangle.height);
        var globalToLocalPoint:CGPoint = localDisplayObject.globalToLocal(globalRectangle.topLeft);
        localRectangle.offsetPoint(globalToLocalPoint);
        globalRectangle.x = localRectangle.x;
        globalRectangle.y = localRectangle.y;
        return globalRectangle;
    }
}
