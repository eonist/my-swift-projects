import Foundation
/**
 * TODO: When needed add these:
 * oppositeDirectional
 * isContraDirectional
 * isNearContraDir
 * parallel
 * coDirectional
 * isCoDirectional
 * isNearCoDir
 * perpendicular
 * intersects
 * within
 * absoluteWithin
 * absolutleyWithin
 * nearAbsolutleyWithin
 * collinear
 * nearEquals
 */
class CGPointAsserter {
    /**
     * Asserts if p1 is less than p2 (but eigther x OR y can be equal to the other x or y)
     * NOTE: think PARAM: p1 is eigther to the left of PARAM: p2 or above PARAM: p2
     * NOTE: but both x and y cant be the same in both points
     */
    static func less(_ p1:CGPoint, _ p2:CGPoint) -> Bool {
        return (p1.x <= p2.x && p1.y < p2.y) || (p1.x < p2.x && p1.y <= p2.y)
    }
    /**
     * Asserts if p1 is more than p2  (but eigther x OR y can be equal to the other x or y)
     * NOTE: think PARAM: p1 is to the right of PARAM: p2 or bellow PARAM: p2
     * NOTE: but both x and y cant be the same in both points
     */
    static func more(_ p1:CGPoint, _ p2:CGPoint) -> Bool {
        return (p1.x >= p2.x && p1.y > p2.y) || (p1.x > p2.x && p1.y >= p2.y)
    }
    /**
     * Asserts if p1 is less than p2
     * NOTE: think PARAM: p1 is eigther to the left of PARAM: p2 AND above PARAM: p2
     */
    static func absolutLess(_ p1:CGPoint, _ p2:CGPoint)->Bool {//TODO: absolutleyLess?!?
        return p1.x < p2.x && p1.y < p2.y
    }
    /**
     * Asserts if p1 is more than p2
     * NOTE: think PARAM: p1 is to the right of PARAM: p2 AND bellow PARAM: p2
     */
    static func absolutMore(_ p1:CGPoint, _ p2:CGPoint)->Bool {//TODO: rename to absolutleyMore?!?
        return p1.x > p2.x && p1.y > p2.y
    }
    /**
     * Asserts if p1 is less or equal to p2
     * NOTE: think PARAM: p1 is eaual or above PARAM: p2
     * NOTE: both x and y can be the same in both points
     */
    static func lessOrEqual(_ p1:CGPoint, _ p2:CGPoint)->Bool {
        return p1.x <= p2.x && p1.y <= p2.y
    }
    /**
     * Asserts if p1 is more or equal to p2
     * NOTE: think PARAM: p1 is eaual or bellow PARAM: p2
     * NOTE: both x and y can be the same in both points
     */
    static func moreOrEqual(_ p1:CGPoint, _ p2:CGPoint)->Bool {
        return p1.x >= p2.x && p1.y >= p2.y
    }
    /**
     * Asserts if p1 is in the same position as p2
     * NOTE: You can also use the native function point1.equales(point2)
     * NOTE: unlike the native point.equals method this method supports NaN values
     * TODO: does NaN equal NaN and what is its native behaviour
     */
    static func equals(_ p1:CGPoint, _ p2:CGPoint) -> Bool {
        return CGFloatAsserter.equals(p1.x, p2.x) && CGFloatAsserter.equals(p1.y, p2.y)
    }
    /**
     * NOTE: Converging is when a trajectory hits the the infinite head of the other point
     * NOTE: converging is when the head of each trajectory converge
     * TODO: write the math formula for this method and explaine more verbosly
     */
    static func converging(_ p1:CGPoint,_ p2:CGPoint,_ angle1:CGFloat,_ angle2:CGFloat) -> Bool {
        let p1A:CGPoint = CGPoint.polarPoint(100, angle1).add(p1)
        let p1B:CGPoint = CGPoint.polarPoint(100, angle1-π).add(p1)
        let p2A:CGPoint = CGPoint.polarPoint(100, angle2).add(p2)
        let p2B:CGPoint = CGPoint.polarPoint(100, angle2-π).add(p2)
        let len:CGFloat = CGPoint.distance(p1A, p2A)
        return len < CGPoint.distance(p1B, p2A) && len < CGPoint.distance(p2A, p2B)
    }
    /**
     * NOTE: doing !convering is not the same as the bellow, because !convering could mean isParallel
     * TODO: diverging is when the tail of both trajectories converge, then shouldnt it be possible to test for the converging of said tails with the converging method, it should
     * TODO: oppositeDirection is when a trajectory hits the infinite tail of the other point,hmm im not so sure
     * TODO: collinearNormal is when both trajectories point onto each other
     * TODO: you need a term when 2 vectors are collinear but point in opposite direction, contraDirectional is the Antonym of coDirectional which is when 2 lines are paralell and pointing in the same direction
     */
    static func diverging(_ p1:CGPoint,_ p2:CGPoint,_ angle1:CGFloat,_ angle2:CGFloat) -> Bool {
        let p1A:CGPoint = CGPoint.polarPoint(100, angle1).add(p1)
        let p1B:CGPoint = CGPoint.polarPoint(100, angle1-π).add(p1)
        let p2A:CGPoint = CGPoint.polarPoint(100, angle2).add(p2)
        let p2B:CGPoint = CGPoint.polarPoint(100, angle2-π).add(p2)
        let len:CGFloat = CGPoint.distance(p1A, p2A)
        return len > CGPoint.distance(p1B, p2A) && len > CGPoint.distance(p2A, p2B)
    }
    /**
     * rayPoint:Point,pivot:Point,p1:Point,p2:Point
     * TODO: we could use slope() here too?, just consider infinity and -infinity and NaN as results of slope
     * IMPORTANT: carefull when you add points, as you need to think from bisector points and outward. (outgoing angles)
     */
    static func oppositeDirectional(_ bisectorP1:CGPoint,_ bisectorP2:CGPoint,_ aP1:CGPoint,_ aP2:CGPoint,_ bP1:CGPoint,_ bP2:CGPoint) -> Bool {
        let bisectorAngle:CGFloat = Trig.angle(bisectorP1, bisectorP2)
        let angleA:CGFloat = Trig.angle(aP1,aP2)
        let angleB:CGFloat = Trig.angle(bP1,bP2)
        return Trig.isOppositeDirectional(bisectorAngle, angleA, angleB)//TODO: we could do the asserting with slope instead of trig, just consider infinity and -infinity and NaN as results of slope
    }
    /**
     * Asserts if two lines intersects (p1 and p2 is line1, p3 and p4 is line2)
     * NOTE: if eigther a1 or a2 is "CoLinear" and within with b1 and b2 then it intersects, does it, yes?
     * NOTE: if line a touches the start or end of line b then it intersects
     * NOTE: if the end of line a is equal to the end of line b then it returns false, this can in some cases be undesirable TODO: you could add a point check to mitigate this problem
     */
    static func intersects(_ a1:CGPoint ,  _ a2:CGPoint,  _ b1:CGPoint,  _ b2:CGPoint) -> Bool {
        var q:CGFloat = (a1.y - b1.y) * (b2.x - b1.x) - (a1.x - b1.x) * (b2.y - b1.y)
        let d:CGFloat = (a2.x - a1.x) * (b2.y - b1.y) - (a2.y - a1.y) * (b2.x - b1.x)
        if( d == 0 )  {return false}
        let r:CGFloat = q / d
        q = (a1.y - b1.y) * (a2.x - a1.x) - (a1.x - b1.x) * (a2.y - a1.y)
        let s:CGFloat = q / d
        if( r < 0 || r > 1 || s < 0 || s > 1 ) {return false}
        return true
    }
    /**
     * Asserts if p1, p2 and p3 are all colinear
     * NOTE: Three or more points are said to be collinear if they all lay on a line (co-linear or contra-linear)
     * NOTE: Another way to think of this is that despite there being more than two points, the affine space that they span is only one dimensional.
     * NOTE: Collinearity of 3 points could be asserter if the area of the triangle that make up the 3 points is 0
     * NOTE: if two of the points are equals, then this method may not work, better assert for equals before utilizing this method
     * TODO: if two points are equal then the three are colliinear actually
     */
    static func collinear(_ p1:CGPoint,_ p2:CGPoint,_ p3:CGPoint) -> Bool {//TODO: rename to is..., depricate and link, or not?!?!                        
        let a:CGFloat = CGPointParser.slope(p2, p3)        
        let b:CGFloat = CGPointParser.slope(p2, p1)        
        let c:CGFloat = CGPointParser.slope(p3, p1)        
        return (a == b && b == c) || (CGFloatAsserter.isInfinity(a) && CGFloatAsserter.isInfinity(b) && CGFloatAsserter.isInfinity(c))//why do we assert infinity again?
    }
    /**
     * TODO: rename to isNearlyEqual, or isNearEqual
     */
    static func nearEquals(_ a:CGPoint, _ b:CGPoint, _ epsilon:CGFloat) -> Bool{
        return CGFloatAsserter.isNear(a.x, b.x, epsilon) && CGFloatAsserter.isNear(a.y, b.y, epsilon)
    }
    /**
     * TODO: what is the difference between contraDirectional and oppositeDirectional
     * NOTE: isContraDirectional is like parallel but vectors must go in opposite directions
     */
    static func isContraDirectional(_ aP1:CGPoint,_ aP2:CGPoint,_ bP1:CGPoint,_ bP2:CGPoint) -> Bool {
        let a:CGFloat = Trig.angle(aP1,aP2)
        let b:CGFloat = Trig.angle(bP1,bP2)
        return Trig.isContraDirectional(a, b)
    }
    /**
     * new
     * TODO: describe whats different
     * TODO: rename to isCoDir
     */
    static func isCoDirectional(_ a1:CGPoint,_ a2:CGPoint,_ b1:CGPoint,_ b2:CGPoint) -> Bool {
        let a:CGFloat = Trig.angle(a1, a2)
        let b:CGFloat = Trig.angle(b1, b2)
        return Trig.isCoDir(a, b)
    }
}
