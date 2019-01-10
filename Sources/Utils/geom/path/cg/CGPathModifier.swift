import Foundation

class CGPathModifier {
   /**
    * Translates a path
    * - Note: the path is returned for the sake of convenience
    * - Note: there is also: CGPathCreateCopyByTransformingPath
    * ## Examples:
    * CGPathModifier.translate(&path,20,20)
    * - Caution: ⚠️️ When using this method remeber to use the CGPathCreateMutableCopy(somePath) if you dont want to edit the original path (THe return statment is jsut for convenince)
    * - parameter path: the path to be translated
    * - parameter p: the point the path should be transled to
    */
   @discardableResult
   static func translate( path:inout CGMutablePath, p:CGPoint) -> CGMutablePath{
      var transformation:CGAffineTransform = CGAffineTransform(translationX: p.x, y: p.y)//swift 3 was -> CGAffineTransformMakeTranslation(x,
      path = path.mutableCopy(using: &transformation)!//swift 3 , was-> CGPathCreateMutableCopyByTransformingPath
      return path
   }
   /**
     * Rotates a path
     * ## Examples:
     * CGPathModifier.rotate(path:path,angle:CGFloat.pi/4.0)//45deg
     * - Caution: ⚠️️ When using this method remeber to use the CGPathCreateMutableCopy(somePath) if you dont want to edit the original path (THe return statment is jsut for convenince)
     * - parameter path: the path to be rotated
     * - parameter angle: the angle the path should be rotated by
     */
    @discardableResult
    static func rotate(path:inout CGMutablePath, angle:CGFloat) -> CGPath{
       var transformation:CGAffineTransform  = CGAffineTransform(rotationAngle: angle)//swift 3-> was: CGAffineTransformMakeRotation
       path = path.mutableCopy(using: &transformation)!
       return path
    }
  /**
   * Rotates a path around it's center axis
   * EXAMPLE: -CGFloat.pi/2.0
   */
  @discardableResult
  static func centerRotate(path:inout CGMutablePath, angle:CGFloat) -> CGPath{
     let rect = path.boundingBox
     let offset:CGPoint = .init(x:-rect.width/2,y:-(rect.height)/2)
     CGPathModifier.translate(path: &path, p: offset)
     CGPathModifier.rotate(path:&path,angle:angle)//45deg
     let reOffset:CGPoint = .init(x:rect.width/2,y:(rect.height)/2)
     CGPathModifier.translate(path: &path, p: reOffset)
     return path
  }
    /**
     * Scales PARAM: path
     * EXAMPLE: scale(path,2,2)//doubles the size of the path
     * CAUTION: When using this method remeber to use the CGPathCreateMutableCopy(somePath) if you dont want to edit the original path (THe return statment is jsut for convenince)
     */
    static func scale(_ path:inout CGPath, _ x:CGFloat = 1,_ y:CGFloat = 1) -> CGPath{
        var transformation:CGAffineTransform  = CGAffineTransform(scaleX: x,y: y)//swift 3 upgrade
        path = path.mutableCopy(using: &transformation)!//swift 3 upgrade
        return path
    }
    /**
     * Skews PARAM: path
     * skew(path,M_PI/8,M_PI/12)//alpha is 22.5 degrees and beta is 15 degrees.
     * CAUTION: When using this method remeber to use the CGPathCreateMutableCopy(somePath) if you dont want to edit the original path (THe return statment is jsut for convenince)
     */
    static func skew(_ path:inout CGPath,_ alpha:Double,_ beta:Double)-> CGPath{
        var transformation = CGAffineTransform.identity
        /*Create an affine transform that skews the coordinate system, by skewing the x axis by alpha radians and the y axis by beta radians.*/
        let alp:CGFloat = CGFloat(tan(alpha))
        let bet:CGFloat = CGFloat(tan(beta))
        transformation = CGAffineTransform(1, alp, bet, 1, 0, 0);
        path = path.mutableCopy(using: &transformation)!/*Apply that transform to the path*/
        return path
    }
    static func transform(_ path:CGMutablePath,_ transformation:CGAffineTransform)->CGMutablePath{
        var transformation:CGAffineTransform = transformation.copy()
        return path.mutableCopy(using: &transformation)!//Swift 3 upgrade
    }

}
