import Foundation

/**
 * Bisection
 */
extension  TriangleMath {
   /**
    * Returns the point that can be used to bisect an angle in an triangle
    * TODO: ⚠️️ I think this bisects an opposite line not the angle, indeed it does, but if the triangle has equal legs its also the bisector angle point
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
    * Returns a point that 2 points and 2 directions converge at (think the third point in an triangle if you have 2 points and the angles)
    * PARAM: p1 is the equvilant to point A
    * PARAM: p2 is the equvilant to point B
    * PARAM: angleA is the angle from p1 to p3 (p3 == point C) "the outAngle of a point on a line"
    * PARAM: angleB is the angle from p2 to p3 "the outAngle of a point on a line"
    * NOTE: the distance from p1 to p2 is the side c in a the triangle
    * TODO: ⚠️️ move to Trig.as or pointparser.as
    * TODO: ⚠️️ could we use more Vector math like formulas here? by using slopes etc
    * TODO: ⚠️️ what happens if the vectors ar parallel?, i guess you need to assert if they are not parallel first, but what about diverging?
    */
   static func convergingPoint(_ p1:CGPoint,_ p2:CGPoint,_ anglA:CGFloat,_ angleB:CGFloat) -> CGPoint {
       let A:CGFloat = Trig.angleSpan(Trig.angle(p1, p2), anglA)
       //Swift.print("A: " + A)
       let B:CGFloat = Trig.angleSpan(angleB,Trig.angle(p2, p1))
       //Swift.print("B: " + B)
       let C:CGFloat = π - B - A/*Angle C*/
       let c:CGFloat = CGPoint.distance(p1, p2)/*The length of side c*/
       if A < B {
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
}
