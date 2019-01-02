import Foundation
/**
 * Triangle notes:
 * IMPORTANT: ⚠️️ C is always the right angle, B is always clockwise next to C and A is the one that is left (<--this is true)
 * - The widest angle is always opposite the longest side
 * - To solve a triangle you must have 1 side and two other parts (sides or angles)  a triangle has 6 parts
 * - Oblique angle: An angle, such as an acute or obtuse angle, that is not a right angle or a multiple of a right angle.
 * - A triangle can only have 1 obtuse angle angle more than 90degrees
 * - AcuteTriangle = no angle is more than 90
 * TODO: ⚠️️ possibly Create TanMath, SinMath, CosMath.as classes
 * TODO: ⚠️️ gte rid of the AngleMath.to_radian stuff makes the calculations look harder. do the radian conversion when testing
 * TODO: ⚠️️ add area of a triangle to this class
 * NOTE: You need 1 side and 2 other parts to define a Triangle
 * NOTE: The Centroid, Circumcenter, and Orthocenter Are Collinear, (meaning they will form a line)
 * NOTE: Angle "A" is the lower left corner, the opposit side is "a" ("hypothenus"), Angle "B" is the top and opposite is side "b" (second longest length), Angle C is the lower right corner and oppistie is the side "c" (shortest length)
 * NOTE: AC is the same as Angle B, AB = C, BC = A
 * NOTE: there are more formulas here RightTriangleMath.as
 * NOTE: Median - A median in a triangle is the line segment drawn from a vertex to the midpoint of its opposite side. Every triangle has three medians. In Figure 5 , E is the midpoint
 * NOTE: Angle bisector - An angle bisector in a triangle is a segment drawn from a vertex that bisects (cuts in half) that vertex angle. Every triangle has three angle bisectors. In Figure 7 , is an angle bisector in Δ ABC.
 * NOTE: Isoceles triangle, two sides are equal, if you have the vertext angle you can find the two other angles by solving for x:  vertex-angle + 2x = 180
 * NOTE: cos(60deg) = 0.5
 * NOTE: cos(90deg) = 1
 * NOTE: If the three vertices of a triangle are collinear, then we have a degenerate triangle
 * NOTE: R: circumradius (radius of circle passing through all three vertices)
 * NOTE: r: inradius (radius of circle tangent to all three sides)
 * NOTE: Cg: center of gravity (intersection of the medians) V1 + V2 + V3 / 3
 * NOTE: Calt: intersection of the altitudes
 */
class TriangleMath {
    /**
     * NOTE: Distance from a point to a line
     * NOTE: also called "perpendicular distance"
     */
    static func orthogonalDist(p:CGPoint, p1:CGPoint,p2:CGPoint)->CGFloat{
        let angle1 = Trig.angle(p2, p)
        let angle2 = Trig.angle(p2, p1)
        let c = p2.distance(p)
        let A = abs(Trig.difference(angle1, angle2))
        let a:CGFloat = TriangleMath.cACToa2(c, A, π/2)
        return a
    }
}

//altitudes(self):"""The altitudes of the triangle. An altitude of a triangle is a segment through a vertex,perpendicular to the opposite side, with length being the, height of the vertex measured from the line containing the side.
//medial(self):"""The medial triangle of the triangle., The triangle which is formed from the midpoints of the three sides.
