
/**
 * Law of sin
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
extension TriangleMath {
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
    * NOTE: this can be used to calculate the shortest side if you have the opposite (adjacent,opposite,hypotenouse)
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
}
