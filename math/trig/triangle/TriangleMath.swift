import Foundation
/**
 * Triangle notes:
 * - The widest angle is always opposite the longest side
 * - To solve a triangle you must have 1 side and two other parts (sides or angles)  a triangle has 6 parts
 * - Oblique angle: An angle, such as an acute or obtuse angle, that is not a right angle or a multiple of a right angle.
 * - A triangle can only have 1 obtuse angle angle more than 90degrees
 * - AcuteTriangle = no angle is more than 90
 * // :TODO: possibly Create TanMath, SinMath, CosMath.as classes
 * // :TODO: gte rid of the AngleMath.to_radian stuff makes the calculations look harder. do the radian conversion when testing
 * // :TODO: add area of a triangle to this class
 * @Note You need 1 side and 2 other parts to define a Triangle
 * @Note The Centroid, Circumcenter, and Orthocenter Are Collinear, (meaning they will form a line)
 * @Note Angle "A" is the lower left corner, the opposit side is "a", Angle "B" is the top and opposite is side "b", Angle C is the lower right corner and oppistie is the side "c"
 * @Note AC is the same as Angle B, AB = C, BC = A
 * @Note there are more formulas here RightTriangleMath.as
 * @Note Median - A median in a triangle is the line segment drawn from a vertex to the midpoint of its opposite side. Every triangle has three medians. In Figure 5 , E is the midpoint
 * @Note Angle bisector - An angle bisector in a triangle is a segment drawn from a vertex that bisects (cuts in half) that vertex angle. Every triangle has three angle bisectors. In Figure 7 , is an angle bisector in Δ ABC.
 * @Note Isoceles triangle, two sides are equal, if you have the vertext angle you can find the two other angles by solving for x:  vertex-angle + 2x = 180
 * @Note cos(60deg) = 0.5
 * @Note cos(90deg) = 1
 * @Note If the three vertices of a triangle are collinear, then we have a degenerate triangle
 * @Note R: circumradius (radius of circle passing through all three vertices)
 * @Note r: inradius (radius of circle tangent to all three sides)
 * @Note Cg: center of gravity (intersection of the medians) V1 + V2 + V3 / 3
 * @Note Calt : intersection of the altitudes
 */
class TriangleMath {
    /**
     * The incenter  is the center of the incircle for a polygon or insphere for a polyhedron (when they exist). (The corresponding radius of the incircle or insphere is known as the inradius)
     * @Note The incenter can be constructed as the intersection of angle bisectors. It is also the interior point for which distances to the sides of the triangle are equal.
     * @Note It has trilinear coordinates 1:1:1, i.e., triangle center function
     * @Note a characteristic is that the normal from each line to the center of the circle is the same
     * @Note the circle will fit exactly inside the triangle
     * @Note each line from p1,p2,p3 will hit the center of the circle (these lines are called angle bisectors)
     * @Note Cr : incenter (center of circle tangent to all three sides)
     * For a triangle with Cartesian vertices , , , the Cartesian coordinates of the incenter are given by:
     * Equation:
     * x = ((a*x1)+(b*x2)+(c*x3))/(a+b+c)
     * y = ((a*y1)+(b*y2)+(c*y3))/(a+b+c)
     * @param a: side a in the triangle (Side can also be defined as AB, or the side opposite of angle BAC)
     * @param b: side b in the triangle (Side can also be defined as AC, or the side opposite of angle ABC)
     * @param c: side c in the triangle (Side can also be defined as BC, or the side opposite of angle ACB)
     * @param p1: the A point in the triangle (Angle can also be defined as BAC)
     * @param p2: The B point in the triangle (Angle can also be defined as ABC)
     * @param p3: The C point in the triangle (Angle can also be defined as ACB)
     */
    class func inCenter(a:CGFloat, _ b:CGFloat, _ c:CGFloat,_ p1:CGPoint,_ p2:CGPoint,_ p3:CGPoint) -> CGPoint {
        let x:CGFloat = ((a*p1.x)+(b*p2.x)+(c*p3.x))/(a+b+c)
        let y:CGFloat = ((a*p1.y)+(b*p2.y)+(c*p3.y))/(a+b+c)
        return CGPoint(x,y)
    }
    /**
     * Returns a point that 2 points and 2 directions converge at (think the third point in an triangle if you have 2 points and the angles)
     * @param p1 is the equvilant to point A
     * @param p2 is the equvilant to point B
     * @param angleA is the angle from p1 to p3 (p3 == point C) "the outAngle of a point on a line"
     * @param angleB is the angle from p2 to p3 "the outAngle of a point on a line"
     * @Note the distance from p1 to p2 is the side c in a the triangle
     * // :TODO: move to Trig.as or pointparser.as
     * // :TODO: could we use more Vector math like formulas here? by using slopes etc
     * // :TODO: what happens if the vectors ar parallel?, i guess you need to assert if they are not parallel first, but what about diverging?
     */
    class func convergingPoint(p1:CGPoint,_ p2:CGPoint,_ anglA:CGFloat,_ angleB:CGFloat) -> CGPoint {
        let A:CGFloat = Trig.angleSpan(Trig.angle(p1, p2), anglA)
        //Swift.print("A: " + A)
        let B:CGFloat = Trig.angleSpan(angleB,Trig.angle(p2, p1))
        //Swift.print("B: " + B)
        let C:CGFloat = π - B - A;/*Angle C*/
        let c:CGFloat = CGPoint.distance(p1, p2)/*The length of side c*/
        if(A < B) {
            return p1.add(CGPoint.polarPoint(cBCTob2(c, B, C), anglA))
        }/*p3*/
        else {
            return  p2.add(CGPoint.polarPoint(cACToa2(c, A, C), angleB))
        }/*p3, a is The length of side a*/
    }
    //----------------------------------
    //  Law of sin
    //----------------------------------
    /**
     * Law of sin:
     * Pre condition 1 side and 2 other parts and that 1 side is an angle side pair(angle is opposite of side I.E a and A)
     * a/SinA = b/SinB = c/SinC (use two pairs and solve for x)
     * SinA/a = SinB/b = SinC/c (use two pairs and solve for x)
     *
     * Retriving Side examples bellow: (Note:there are 3 other ways to solve with Sin bABTo, aBAtob, and bBCToc)
     *
     * 	Example of solving cosine algebra:
     *	(1) 0.7071067811865476 = Math.cos(x)
     *	(2) 0.7071067811865476/Math.cos = Math.cos(x)/Math.cos
     *	(3) Math.acos(0.7071067811865476) = x
     *	(4) 0.7853981633974483 = x
     *	(5) 0.7853981633974483 is the same as Math.PI/4
     */
    /**
     * Returns the Side a of an triangle
     * @Note Based on formula: b/SinB = c/SinC
     */
    class func bABToa(b:CGFloat,_ A:CGFloat,_ B:CGFloat) -> CGFloat {
        return sin(A*Trig.rad) * (b / sin(B*Trig.rad))
    }
    
    //Continue here: add the other methods aswell
    
    
    /**
     * Returns the Side a of an triangle
     * Based on formula: a/SinA = c/SinC
     * @Note uses radian instead of degree
     */
    class func cACToa2(c:CGFloat,_ A:CGFloat,_ C:CGFloat) -> CGFloat {// :TODO: move to trianglemath2
        return sin(A) * (c / sin(C))
    }
    /**
     * Returns the Side b of an triangle
     * Based on formula: b/SinB = a/SinA
     * @Note google right angle triangle to see where the sides and angles lay
     */
    class func aABTob(a:CGFloat,_ A:CGFloat,_ B:CGFloat) -> CGFloat {
        return sin(B*Trig.rad) * (a / sin(A*Trig.rad))
    }
    /**
     * Returns the Side c of an triangle
     * Based on formula: c/SinC = a/SinA
     * @Note google right angle triangle to see where the sides and angles lay
     */
    class func aACToc(a:CGFloat,_ A:CGFloat,_ C:CGFloat) -> CGFloat {
        return sin(C*Trig.rad) * (a / sin(A*Trig.rad))
    }
    /**
     * Returns the Side b of an triangle
     * @Note Based on formula: b/SinB = c/SinC
     */
    class func cBCTob2(c:CGFloat,_ B:CGFloat,_ C:CGFloat) -> CGFloat {// :TODO: move to trianglemath2
        return sin(B) * (c / sin(C))
    }
}
