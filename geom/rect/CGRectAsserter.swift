import Foundation
class CGRectAsserter {
    /**
     *
     */
    class func containsOrIntersectsLine(rectangle:CGRect,_ line:Line) -> Bool {
        return containsLine(rectangle, line) || intersectsLine(rectangle, line);
    }
    /**
     * Asserts if @param rectangle contains the line @param p1 to @param p2
     */
    class func containsLine(rectangle:CGRect,_ line:Line) -> Bool {
        return rectangle.contains(line.p1) && rectangle.contains(line.p2);
    }
    /**
     * Asserts if @param rectangle intersects the line @param p1 to @param p2
     * @Note to assert if a line intersects or is contained within a rectangle use both of the methods in this class named intersectsLine and containsLine
     * @Note the for loop does not call RectangleParser.sides more than once
     * @example RectangleAsserter.intersectsLine(new Rectangle(200,200,500,500),new PrimitiveLine(new Point(0,0), new Point(60,60)));//false
     */
    class func intersectsLine(rectangle:CGRect,_ line:Line) -> Bool {
        for side : Line in CGRectParser.sides(rectangle) {if(LineAsserter.intersects(side, line)) {return true}}
        return false;
    }
}
