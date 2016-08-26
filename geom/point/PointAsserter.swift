import Foundation

class PointAsserter {
    /**
     * Asserts if p1 is less than p2 (but eigther x OR y can be equal to the other x or y)
     * @Note: think @param p1 is eigther to the left of @param p2 or above @param p2
     * @Note: but both x and y cant be the same in both points
     */
    class func less(p1:CGPoint, p2:CGPoint) -> Bool {
        return (p1.x <= p2.x && p1.y < p2.y) || (p1.x < p2.x && p1.y <= p2.y)
    }
    /**
     * Asserts if p1 is more than p2  (but eigther x OR y can be equal to the other x or y)
     * @Note: think @param p1 is to the right of @param p2 or bellow @param p2
     * @Note: but both x and y cant be the same in both points
     */
    class func more(p1:CGPoint, p2:CGPoint) -> Bool {
        return (p1.x >= p2.x && p1.y > p2.y) || (p1.x > p2.x && p1.y >= p2.y);
    }
    /**
     * Asserts if p1 is less than p2
     * @Note: think @param p1 is eigther to the left of @param p2 AND above @param p2
     */
    class func absolutLess(p1:CGPoint, p2:CGPoint)->Bool {// :TODO: absolutleyLess
        return p1.x < p2.x && p1.y < p2.y;
    }
    /**
     * Asserts if p1 is more than p2
     * @Note: think @param p1 is to the right of @param p2 AND bellow @param p2
     */
    class func absolutMore(p1:CGPoint, p2:CGPoint)->Bool {// :TODO: rename to absolutleyMore
        return p1.x > p2.x && p1.y > p2.y;
    }
    /**
     * Asserts if p1 is less or equal to p2
     * @Note: think @param p1 is eaual or above @param p2
     * @Note: both x and y can be the same in both points
     */
    class func lessOrEqual(p1:CGPoint, p2:CGPoint)->Bool {
        return p1.x <= p2.x && p1.y <= p2.y;
    }
    /**
     * Asserts if p1 is more or equal to p2
     * @Note: think @param p1 is eaual or bellow @param p2
     * @Note: both x and y can be the same in both points
     */
    class func moreOrEqual(p1:CGPoint, p2:CGPoint)->Bool {
        return p1.x >= p2.x && p1.y >= p2.y;
    }
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
    * @Note: Converging is when a trajectory hits the the infinite head of the other point
    * @Note: converging is when the head of each trajectory converge
    * // :TODO: write the math formula for this method and explaine more verbosly
    */
    public static function converging(p1:Point,p2:Point,angle1:Number,angle2:Number):Boolean {
    var p1A:Point = Point.polar(100, angle1).add(p1);
    var p1B:Point = Point.polar(100, angle1-Math.PI).add(p1);
    var p2A:Point = Point.polar(100, angle2).add(p2);
    var p2B:Point = Point.polar(100, angle2-Math.PI).add(p2);
    var len:Number = Point.distance(p1A, p2A);
    return len < Point.distance(p1B, p2A) && len < Point.distance(p2A, p2B);
    }
    /**
    * @Note doing !convering is not the same as the bellow, because !convering could mean isParallel
    * // :TODO: diverging is when the tail of both trajectories converge, then shouldnt it be possible to test for the converging of said tails with the converging method
    * // :TODO: oppositeDirection is when a trajectory hits the infinite tail of the other point,hmm im not so sure
    * // :TODO: collinearNormal is when both trajectories point onto each other
    * // :TODO: you need a term when 2 vectors are collinear but point in opposite direction, contraDirectional is the Antonym of coDirectional which is when 2 lines are paralell and pointing in the same direction
    */
    public static function diverging(p1:Point,p2:Point,angle1:Number,angle2:Number):Boolean {
    var p1A:Point = Point.polar(100, angle1).add(p1);
    var p1B:Point = Point.polar(100, angle1-Math.PI).add(p1);
    var p2A:Point = Point.polar(100, angle2).add(p2);
    var p2B:Point = Point.polar(100, angle2-Math.PI).add(p2);
    var len:Number = Point.distance(p1A, p2A);
    return len > Point.distance(p1B, p2A) && len > Point.distance(p2A, p2B);
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
    /**
     * Asserts if p1, p2 and p3 are all colinear
     * @Note Three or more points are said to be collinear if they all lie on a line (co-linear or contra-linear)
     * @Note Another way to think of this is that despite there being more than two points, the affine space that they span is only one dimensional.
     * @Note Collinearity of 3 points could be asserter if the area of the triangle that make up the 3 points is 0
     * @Note if two of the points are equals, then this method may not work, better assert for equals before utilizing this method
     * // :TODO: if two points are equal then the three are colliinear actually
     */
    class func collinear(p1:CGPoint,_ p2:CGPoint,_ p3:CGPoint) -> Bool {// :TODO: rename to is..., depricate and link, or not?!?!
        //print("p1: " + p1)
        //print("p2: " + p2)
        //print("p3: " + p3)
        let a:CGFloat = PointParser.slope(p2, p3)
        //print("a: " + a)
        let b:CGFloat = PointParser.slope(p2, p1)
        //print("b: " + b)
        let c:CGFloat = PointParser.slope(p3, p1)
        //print("c: " + c)
        return (a == b && b == c) || (NumberAsserter.isInfinity(a) && NumberAsserter.isInfinity(b) && NumberAsserter.isInfinity(c))//why do we assert infinity again?
    }
}
