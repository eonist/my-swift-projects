import Foundation

class CGPathModifier {
    /**
     * Translates PARAM: path
     * NOTE: the path is returned for the sake of convenience
     * NOTE: there is also: CGPathCreateCopyByTransformingPath
     * EXAMPLE: CGPathModifier.translate(&path,20,20)
     * CAUTION: When using this method remeber to use the CGPathCreateMutableCopy(somePath) if you dont want to edit the original path (THe return statment is jsut for convenince)
     */
    static func translate(_ path:inout CGMutablePath,_ x:CGFloat = 0,_ y:CGFloat = 0)->CGMutablePath{
        var transformation:CGAffineTransform = CGAffineTransform(translationX: x, y: y)//swift 3 was -> CGAffineTransformMakeTranslation(x,
        path = path.mutableCopy(using: &transformation)!//swift 3 , was-> CGPathCreateMutableCopyByTransformingPath
        return path
    }
    /**
     * Rotates PARAM: path
     * EXAMPLE: rotate(path,M_PI/4.0)//45deg
     * CAUTION: When using this method remeber to use the CGPathCreateMutableCopy(somePath) if you dont want to edit the original path (THe return statment is jsut for convenince)
     */
    static func rotate(_ path:inout CGPath,_ angle:Double)->CGPath{
        let ang:CGFloat = CGFloat(angle)
        var transformation:CGAffineTransform  = CGAffineTransform(rotationAngle: ang)//swift 3-> was: CGAffineTransformMakeRotation
        path = path.mutableCopy(using: &transformation)!
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