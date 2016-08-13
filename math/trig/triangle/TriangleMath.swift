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
}
