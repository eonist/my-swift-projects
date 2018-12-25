import Foundation
/**
 * Law of tan (Base Formula TanΘ = y/x)
 */
extension TriangleMath {
   /**
   * Returns the length from position (0,0 in a polar system)
   * NOTE: This function is reverse of Point.polar(len, angle):Point
   * NOTE: this finds the radius of a circle (magnitude)
   * Base Formula c2 = a^2 + b^2
   * NOTE: This can be used to find hypotenuse and diagonal of a Square
   * NOTE: the sides in a right-angled triangle is called: Hypotenuse, opposite, and adjacent (were adjacent is the shortest, and opposite is the last side)
   * EXAMPLE: let diagonalLength:CGFloat = TriangleMath.polarToLength(x:100,y:100)
   * EXAMPLE: Swift.print("diagonalLength:  \(diagonalLength)")//141.4213562373095
   */
 static func polarToLength(x:CGFloat,y:CGFloat) -> CGFloat {
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
}
