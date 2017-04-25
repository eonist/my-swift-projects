import Foundation
class CGRectAsserter {
    static func containsOrIntersectsLine(_ rectangle:CGRect,_ line:Line) -> Bool {
        return containsLine(rectangle, line) || intersectsLine(rectangle, line)
    }
    /**
     * Asserts if PARAM: rectangle contains the line PARAM: p1 to PARAM: p2
     */
    static func containsLine(_ rectangle:CGRect,_ line:Line) -> Bool {
        return rectangle.contains(line.p1) && rectangle.contains(line.p2)
    }
    /**
     * Asserts if PARAM: rectangle intersects the line PARAM: p1 to PARAM: p2
     * NOTE: to assert if a line intersects or is contained within a rectangle use both of the methods in this class named intersectsLine and containsLine
     * NOTE: the for loop does not call RectangleParser.sides more than once
     * EXAMPLE: RectangleAsserter.intersectsLine(CGRect(200,200,500,500),PrimitiveLine(CGPoint(0,0), CGPoint(60,60)));//false
     */
    static func intersectsLine(_ rectangle:CGRect,_ line:Line) -> Bool {
        return CGRectParser.sides(rectangle).index(where:{LineAsserter.intersects($0, line)}) != nil
    }
}
