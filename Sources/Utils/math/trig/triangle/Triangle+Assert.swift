
/**
 * Asserter
 */
extension TriangleMath{
   /**
    * assert within triangle
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
