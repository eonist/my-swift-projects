import Foundation
/**
* Law of cosine:
* Pre condition 1 side and 2 other parts (no need for side angle pair)
* Formula 1: a^2 = b^2+c^2-2bc*cos*A
* Formula 2: b^2 = a^2+c^2-2ac*cos*B
* Formula 3: cos*a = (b^2+c^2-a^2)/2bc
*/
extension TriangleMath {
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
    * // :TODO: ⚠️️ this is possible, its basically bcAToa, but you switch out the c in the equation, you have done this on paper before so it will work once you code it.
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
}
