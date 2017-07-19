import Foundation
/**
 * Triangle notes:
 * IMPORTANT: ⚠️️ C is always the right angle, B is always clockwise next to C and A is the one that is left (<--this is true)
 * - The widest angle is always opposite the longest side
 * - To solve a triangle you must have 1 side and two other parts (sides or angles)  a triangle has 6 parts
 * - Oblique angle: An angle, such as an acute or obtuse angle, that is not a right angle or a multiple of a right angle.
 * - A triangle can only have 1 obtuse angle angle more than 90degrees
 * - AcuteTriangle = no angle is more than 90
 * TODO: possibly Create TanMath, SinMath, CosMath.as classes
 * TODO: gte rid of the AngleMath.to_radian stuff makes the calculations look harder. do the radian conversion when testing
 * TODO: add area of a triangle to this class
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
     * Returns the point that can be used to bisect an angle in an triangle
     * TODO: i think this bisects an opposite line not the angle, indeed it does, but if the triangle has equal legs its also the bisector angle point
     */
    static func bisectorPoint(_ anchor:CGPoint, _ p1:CGPoint, _ p2:CGPoint) -> CGPoint {
        let x:CGPoint = anchor.add(CGPoint.polarPoint(CGPoint.distance(p1, anchor), Trig.angle(anchor, p2)))
        return CGPoint.interpolate(p1, x, 0.5)
    }
    /**
     * PARAM: radius is the length of the extending vector (so to speak)
     */
    static func bisectorPT(_ anchor:CGPoint, _ p1:CGPoint, _ p2:CGPoint, _ radius:CGFloat = 100) -> CGPoint{
        let bisectorAngle = TriangleMath.bisectorAngle(anchor,p1,p2)
        let bisectorPT:CGPoint = anchor + CGPoint.polarPoint(radius,bisectorAngle)
        return bisectorPT
    }
    /**
     * Returns the angle bisector from a triangle construction
     * NOTE: another way to find the bisector is: Trig.angle(pivot, p1) + (Trig.difference(pivot, p1, p2))/2
     */
    static func bisectorAngle(_ anchor:CGPoint,_ pt1:CGPoint,_ pt2:CGPoint) -> CGFloat {
        let angle1:CGFloat = Trig.angle(anchor, pt1)
        let angle2:CGFloat = Trig.angle(anchor, pt2)
        return Trig.angleBisector(angle1, angle2)
    }
    /**
     * The 'in-center' is the center of the incircle for a polygon or insphere for a polyhedron (when they exist). (The corresponding radius of the incircle or insphere is known as the inradius)
     * NOTE: The incenter can be constructed as the intersection of angle bisectors. It is also the interior point for which distances to the sides of the triangle are equal.
     * NOTE: It has trilinear coordinates 1:1:1, i.e., triangle center function
     * NOTE: a characteristic is that the normal from each line to the center of the circle is the same
     * NOTE: the circle will fit exactly inside the triangle
     * NOTE: each line from p1,p2,p3 will hit the center of the circle (these lines are called angle bisectors)
     * NOTE: Cr : incenter (center of circle tangent to all three sides)
     * For a triangle with Cartesian vertices , , , the Cartesian coordinates of the incenter are given by:
     * Equation:
     * x = ((a*x1)+(b*x2)+(c*x3))/(a+b+c)
     * y = ((a*y1)+(b*y2)+(c*y3))/(a+b+c)
     * PARAM: a: side a in the triangle (Side can also be defined as AB, or the side opposite of angle BAC)
     * PARAM: b: side b in the triangle (Side can also be defined as AC, or the side opposite of angle ABC)
     * PARAM: c: side c in the triangle (Side can also be defined as BC, or the side opposite of angle ACB)
     * PARAM: p1: the A point in the triangle (Angle can also be defined as BAC)
     * PARAM: p2: The B point in the triangle (Angle can also be defined as ABC)
     * PARAM: p3: The C point in the triangle (Angle can also be defined as ACB)
     */
    static func inCenter(_ a:CGFloat, _ b:CGFloat, _ c:CGFloat,_ p1:CGPoint,_ p2:CGPoint,_ p3:CGPoint) -> CGPoint {
        let x:CGFloat = ((a*p1.x)+(b*p2.x)+(c*p3.x))/(a+b+c)
        let y:CGFloat = ((a*p1.y)+(b*p2.y)+(c*p3.y))/(a+b+c)
        return CGPoint(x,y)
    }
    /**
     * Returns a point that 2 points and 2 directions converge at (think the third point in an triangle if you have 2 points and the angles)
     * PARAM: p1 is the equvilant to point A
     * PARAM: p2 is the equvilant to point B
     * PARAM: angleA is the angle from p1 to p3 (p3 == point C) "the outAngle of a point on a line"
     * PARAM: angleB is the angle from p2 to p3 "the outAngle of a point on a line"
     * NOTE: the distance from p1 to p2 is the side c in a the triangle
     * TODO: move to Trig.as or pointparser.as
     * TODO: could we use more Vector math like formulas here? by using slopes etc
     * TODO: what happens if the vectors ar parallel?, i guess you need to assert if they are not parallel first, but what about diverging?
     */
    static func convergingPoint(_ p1:CGPoint,_ p2:CGPoint,_ anglA:CGFloat,_ angleB:CGFloat) -> CGPoint {
        let A:CGFloat = Trig.angleSpan(Trig.angle(p1, p2), anglA)
        //Swift.print("A: " + A)
        let B:CGFloat = Trig.angleSpan(angleB,Trig.angle(p2, p1))
        //Swift.print("B: " + B)
        let C:CGFloat = π - B - A/*Angle C*/
        let c:CGFloat = CGPoint.distance(p1, p2)/*The length of side c*/
        if(A < B) {
            return p1.add(CGPoint.polarPoint(cBCTob2(c, B, C), anglA))
        }/*p3*/
        else {
            return p2.add(CGPoint.polarPoint(cACToa2(c, A, C), angleB))
        }/*p3, a is The length of side a*/
    }
    /**
     * NOTE: rotates the "out-angles" to be "in-angles"
     */
    static func divergingPoint(_ p1:CGPoint,_ p2:CGPoint,_ anglA:CGFloat,_ angleB:CGFloat) -> CGPoint {
        return convergingPoint(p1, p2, anglA + π, angleB + π)
    }
    /**
     * NOTE: Distance from a point to a line
     * NOTE: also called "perpendicular distance"
     */
    static func orthogonalDist(_ p:CGPoint, _ p1:CGPoint,_ p2:CGPoint)->CGFloat{
        let angle1 = Trig.angle(p2, p)
        let angle2 = Trig.angle(p2, p1)
        let c = p2.distance(p)
        let A = abs(Trig.difference(angle1, angle2))
        let a:CGFloat = TriangleMath.cACToa2(c, A, π/2)
        return a
    }
    /**
     * Returns the centroid point of a triangle
     * PARAM: a,b,c are the triangle corner points
     * NOTE: basicly its the average point of the mid-point of each line that makes out a triangle
     * NOTE: the mid point of each side to the opposite angle point will pass through the centroid
     * NOTE: Applies to any type of triangle
     * NOTE: other triangle centers include:orthocenter,incenter,circle center, circumcircle, circumcenter
     * NOTE: The euler line goes through: orthocenter, centroid and circumcenter
     * // :TODO: make functions for the other triangle centers and the euler line
     */
    static func centeroid(_ a:CGPoint,_ b:CGPoint,_ c:CGPoint)->CGPoint {
        return CGPoint((a.x + b.x + c.x) / 3, (a.y + b.y + c.y) / 3)
    }
    /**
     * Finds the length of BC, BD or CD relating to the Angle bisector (a perpendicular line from angle A, perpendicular in that it diveds the angle A in two)
     * NOTE: Another Triangle Angle Bisector Theorem: CA/CD = BA/DB
     * NOTE: Original Triangle Angle Bisector Theorem: BD/DC = AB/AC
     */
    static func angleBisectorAngle() {
        let AB:CGFloat = 8
        let AC:CGFloat = 4
        let BC:CGFloat = 9
        
        /*Based on Triangle Angle Bisector Theorem: BD/BC-BD = AB/AC*/
        let BD:CGFloat = (AB*BC)/(AC+AB)
        print("BD: " + "\(BD)")
        
        let CD:CGFloat = (AC*BD)/AB
        print("CD: " + "\(CD)")
    }
    static func inRadius() {
        //see legacy code / stackoverflow
    }
    /**
     * The point where the three perpendicular bisectors of a triangle meet. One of a triangle's points of concurrency.
     * NOTE: The circumcenter is the center of the circumcircle.
     * NOTE: The circumcenter is also the center of the triangle's circumcircle - the 
     * NOTE: Inside all acute triangles, Outside all obtuse triangles, On all right triangles (at the midpoint of the hypotenuse)
     * NOTE: CR: circumcenter (center of circle passing through all three vertices)
     * NOTE: Intersection of Perpendicular Bisectors:
     */
    static func circumCenter() {
        //see legacy code / stackoverflow
    }
    static func circumRadius() {
        //see legacy code / stackoverflow
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
     * NOTE: Based on formula: b/SinB = c/SinC
     */
    static func bABToa(_ b:CGFloat,_ A:CGFloat,_ B:CGFloat) -> CGFloat {
        return sin(A*Trig.rad) * (b / sin(B*Trig.rad))
    }
    /**
     * Returns the Side a of an triangle
     * Based on formula: a/SinA = c/SinC
     */
    static func cACToa(_ c:CGFloat,_ A:CGFloat,_ C:CGFloat) -> CGFloat {
        return sin(A*Trig.rad) * (c / sin(C*Trig.rad))
    }
    /**
     * Returns the Side a of an triangle
     * Based on formula: a/SinA = c/SinC
     * NOTE: uses radian instead of degree
     * NOTE i think this also works on non-right-angle-triangles
     */
    static func cACToa2(_ c:CGFloat,_ A:CGFloat,_ C:CGFloat) -> CGFloat { // TODO: move to trianglemath2
        return sin(A) * (c / sin(C))
    }
    /**
     * Returns the Side b of an triangle
     * Based on formula: b/SinB = a/SinA
     * NOTE: google right angle triangle to see where the sides and angles lay
     */
    static func aABTob(_ a:CGFloat,_ A:CGFloat,_ B:CGFloat) -> CGFloat {
        return sin(B*Trig.rad) * (a / sin(A*Trig.rad))
    }
    /**
     * Returns the Side c of an triangle
     * Based on formula: c/SinC = a/SinA
     * NOTE: google right angle triangle to see where the sides and angles lay
     */
    static func aACToc(_ a:CGFloat,_ A:CGFloat,_ C:CGFloat) -> CGFloat {
        return sin(C*Trig.rad) * (a / sin(A*Trig.rad))
    }
    /**
     * Returns the Side b of an triangle
     * NOTE: Based on formula: b/SinB = c/SinC
     */
    static func cBCTob(_ c:CGFloat,_ B:CGFloat,_ C:CGFloat) ->CGFloat {
        return sin(B*Trig.rad) * (c / sin(C*Trig.rad))
    }
    /**
     * Returns the Side b of an triangle
     * NOTE: Based on formula: b/SinB = c/SinC
     */
    static func cBCTob2(_ c:CGFloat,_ B:CGFloat,_ C:CGFloat) -> CGFloat {//TODO: move to trianglemath2
        return sin(B) * (c / sin(C))
    }
    /**
     * Returns the Side c of an triangle
     * Based on formula: c/SinC = b/SinB
     */
    static func bBCToc(_ b:CGFloat,_ B:CGFloat,_ C:CGFloat)->CGFloat {
        return sin(C*Trig.rad) * (b / sin(B*Trig.rad))
    }
    /**
     * Returns side c from PARAM: b, PARAM: A and PARAM: C
     */
    static func bACToc(_ b:CGFloat,_ A:CGFloat,_ C:CGFloat) -> CGFloat {
        let B:CGFloat = 180 - A - C// :TODO: could be :  360 - A - C;?!?
        return bBCToc(b, B, C)
    }
    //----------------------------------
    //  Law of cosine:
    //----------------------------------
    /**
     * Law of cosine:
     * Pre condition 1 side and 2 other parts (no need for side angle pair)
     * Formula 1: a^2 = b^2+c^2-2bc*cos*A
     * Formula 2: b^2 = a^2+c^2-2ac*cos*B
     * Formula 3: cos*a = (b^2+c^2-a^2)/2bc
     */
     /**
      * Returns angle A 
      * Note: Law of cosine
      * Formula: a^2 = b^2 + c^2 - 2bc*Cos(A)
      * which can be written: Cos A = (b^2+c^2-a^2)/(2bc)
      * which can be written A = acos((b^2+c^2-a^2)/(2bc))
      */
     static func abcToA(_ a:CGFloat, _ b:CGFloat, _ c:CGFloat) -> CGFloat {
         return acos((pow(b, 2)+pow(c, 2)-pow(a, 2))/(2*b*c))
     }
     /**
      * Returns angle B
      * Note: Law of cosine
      * Formula: Cos B = (a^2+c^2-b^2)/(2ac)
      */
     static func abcToB(_ a:CGFloat, _ b:CGFloat, _ c:CGFloat) -> CGFloat {
         return acos((pow(a, 2)+pow(c, 2)-pow(b, 2))/(2*a*c))
     }
     /**
      * Returns angle C
      * Note: Law of cosine
      * Formula: Cos C = (a^2+b^2-c^2)/(2ab)
      */
     static func abcToC(_ a:CGFloat, _ b:CGFloat, _ c:CGFloat) -> CGFloat {
         return acos((pow(a, 2)+pow(b, 2)-pow(c, 2))/(2*a*b))
     }
     /** 
      * Returns the side a for any type of triangle
      * Note: Law of cosine
      * Base Formula: a^2 = b^2+c^2 - 2bc * Cos(A)
      * // :TODO: you could add an if clause if A is 90 deg, then the cosine is 0 but its not 0 in computer math, so its more correct to use 0
      */
     static func bcAToa(_ b:CGFloat, _ c:CGFloat, _ A:CGFloat) -> CGFloat {
         let cosineOfAngle:CGFloat = cos(A*Trig.rad)
         let aSquared:CGFloat = pow(b, 2)+pow(c, 2)-(2*b*c)*cosineOfAngle
         return sqrt(aSquared)
     }
     /**
      * // :TODO: this is possible, its basically bcAToa, but you switch out the c in the equation, you have done this on paper before so it will work once you code it.
      */
     static func abAToc() {
         
     }
     /**
      * Returns the angle B for any triangle
      * Base Formula: sin(A)/a = sin(A)/b
      */
     static func abAToB(_ a:CGFloat, _ b:CGFloat, _ A:CGFloat) -> CGFloat {
         let sinB:CGFloat = (b*sin(A*Trig.rad))/a
         return asin(sinB)*Trig.deg
     }
     /**
      * Returns the side c
      * NOTE: formula: c^2 = a^2 + b^2 - 2(a*b)(cos(angle)) (Law of sin)
      * PARAM: C must be in radians not degrees
      */
     static func abCToc(_ a:CGFloat,_ b:CGFloat,_ C:CGFloat) -> CGFloat {
         return sqrt(pow(a,2) + pow(b,2) - (2*(a*b)*cos(C)))
     }
     //----------------------------------
     //  Law of tan (Base Formula TanΘ = y/x)
     //----------------------------------
     /**
      * Returns the length from position (0,0 in a polar system)
      * NOTE: This function is reverse of Point.polar(len, angle):Point
      * NOTE: this finds the radius of a circle (magnitude)
      * Base Formula c2 = a^2 + b^2
      */
     static func polarToLength(_ x:CGFloat, _ y:CGFloat) -> CGFloat {
         return sqrt(pow(x, 2) + pow(y, 2))
     }
     /**
      * Returns the angle (in radians) of a polar position (from 0,0 in a polar system)
      * Base Formula TanΘ = y/x
      * PARAM: x: polarPosition in x axis
      * PARAM: y: polarPosition in y axis
      * RETURN: a value in radians
      * this formula can also be used: Math.atan2(x, y)
      * Note: AngleMath.pointsToAngle(p1,p2) does the same thing
      */
     static func polarToAngle(_ x:CGFloat, _ y:CGFloat) -> CGFloat {
         return atan(y/x)
     }
     /**
      * 
      */
     public static func withinTriangle(_ x:CGFloat, _ y:CGFloat, _ x1:CGFloat, _ y1:CGFloat, _ x2:CGFloat, _ y2:CGFloat, _ x3:CGFloat, _ y3:CGFloat) -> Bool {
        let fab:CGFloat = ((y - y1) * (x2 - x1)) - ((x - x1) * (y2 - y1))
        let fbc:CGFloat = ((y - y2) * (x3 - x2)) - ((x - x2) * (y3 - y2))
        let fca:CGFloat = ((y - y3) * (x1 - x3)) - ((x - x3) * (y1 - y3))
        return ( fab * fbc > 0 ) && ( fbc * fca > 0 )
     }
}
//is_equilateral,Are all the sides the same length?
//is_isosceles, Are two or more of the sides the same length?
//is_scalene(self):"""Are all the sides of the triangle of different lengths?
//is_right(self): """Is the triangle right-angled.
//altitudes(self):"""The altitudes of the triangle. An altitude of a triangle is a segment through a vertex,perpendicular to the opposite side, with length being the, height of the vertex measured from the line containing the side.
//medial(self):"""The medial triangle of the triangle., The triangle which is formed from the midpoints of the three sides.
