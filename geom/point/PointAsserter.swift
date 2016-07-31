import Foundation

class PointAsserter {
    /**
     * Asserts if p1 is in the same position as p2
     * @Note: You can also use the native function point1.equales(point2)
     * @Note: unlike the native point.equals method this method supports NaN values
     * // :TODO: does NaN equal NaN and what is its native behaviour
     */
    class func equals(p1:CGPoint, _ p2:CGPoint) -> Bool {
        return NumberAsserter.equals(p1.x, p2.x) && NumberAsserter.equals(p1.y, p2.y)
    }
    /**
     * Asserts if two lines intersects (p1 and p2 is line1, p3 and p4 is line2)
     * @Note if eigther a1 or a2 is "CoLinear" and within with b1 and b2 then it intersects, does it, yes?
     * @Note if line a touches the start or end of line b then it intersects
     * @Note if the end of line a is equal to the end of line b then it returns false, this can in some cases be undesirable // :TODO: you could add a point check to mitigate this problem
     */
    class func intersects(a1:CGPoint ,  _ a2:CGPoint,  _ b1:CGPoint,  _ b2:CGPoint) -> Bool {
        var q:CGFloat = (a1.y - b1.y) * (b2.x - b1.x) - (a1.x - b1.x) * (b2.y - b1.y)
        let d:CGFloat = (a2.x - a1.x) * (b2.y - b1.y) - (a2.y - a1.y) * (b2.x - b1.x)
        if( d == 0 )  {return false}
        let r:CGFloat = q / d
        q = (a1.y - b1.y) * (a2.x - a1.x) - (a1.x - b1.x) * (a2.y - a1.y)
        let s:CGFloat = q / d
        if( r < 0 || r > 1 || s < 0 || s > 1 ) {return false}
        return true
    }
}
