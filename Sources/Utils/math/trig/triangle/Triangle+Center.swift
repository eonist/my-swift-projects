
/**
 * Center
 */
extension TriangleMath {
   /**
    * Returns the centroid point of a triangle
    * PARAM: a,b,c are the triangle corner points
    * NOTE: basicly its the average point of the mid-point of each line that makes out a triangle
    * NOTE: the mid point of each side to the opposite angle point will pass through the centroid
    * NOTE: Applies to any type of triangle
    * NOTE: other triangle centers include:orthocenter,incenter,circle center, circumcircle, circumcenter
    * NOTE: The euler line goes through: orthocenter, centroid and circumcenter
    * TODO: ⚠️️ make functions for the other triangle centers and the euler line
    */
   static func centeroid(a:CGPoint,b:CGPoint,c:CGPoint)->CGPoint {
      return CGPoint((a.x + b.x + c.x) / 3, (a.y + b.y + c.y) / 3)
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
 static func inCenter(a:CGFloat, b:CGFloat, c:CGFloat,p1:CGPoint,p2:CGPoint,p3:CGPoint) -> CGPoint {
     let x:CGFloat = ((a*p1.x)+(b*p2.x)+(c*p3.x))/(a+b+c)
     let y:CGFloat = ((a*p1.y)+(b*p2.y)+(c*p3.y))/(a+b+c)
     return CGPoint(x,y)
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
}
