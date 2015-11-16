import Foundation

public class CGPathModifier {
    /**
     * Translates @param path
     * NOTE: the path is returned for the sake of convenience
     * NOTE: there is also: CGPathCreateCopyByTransformingPath
     * EXAMPLE: CGPathModifier.translate(&path,20,20)
     */
    public class func translate(inout path:CGMutablePath,_ x:CGFloat = 0,_ y:CGFloat = 0)->CGPath{
        var transformation:CGAffineTransform = CGAffineTransformMakeTranslation(x, y)
        path = CGPathCreateMutableCopyByTransformingPath(path, &transformation)!
        return path
    }
    /**
     * Rotates @param path
     * EXAMPLE: rotate(path,M_PI/4.0)//45deg
     */
    public class func rotate(inout path:CGPath,_ angle:Double)->CGPath{
        let ang:CGFloat = CGFloat(angle)
        var transformation:CGAffineTransform  = CGAffineTransformMakeRotation(ang)
        path = CGPathCreateMutableCopyByTransformingPath(path, &transformation)!
        return path
    }
    /**
     * Scales @param path
     * EXAMPLE: scale(path,2,2)//doubles the size of the path
     */
    public class func scale(inout path:CGPath, _ x:CGFloat = 1,_ y:CGFloat = 1) -> CGPath{
        var transformation:CGAffineTransform  = CGAffineTransformMakeScale(x,y)
        path = CGPathCreateMutableCopyByTransformingPath(path, &transformation)!
        return path
    }
    /**
     * Skews @param path
     * skew(path,M_PI/8,M_PI/12)//alpha is 22.5 degrees and beta is 15 degrees.
     */
    public class func skew(inout path:CGPath,_ alpha:Double,_ beta:Double)-> CGPath{
        var transformation = CGAffineTransform()
        // Create an affine transform that skews the coordinate system, by skewing the x axis by alpha radians and the y axis by beta radians.
        let alp:CGFloat = CGFloat(tan(alpha))
        let bet:CGFloat = CGFloat(tan(beta))
        transformation = CGAffineTransformMake(1, alp, bet, 1, 0, 0);
        // Apply that transform to the path
        path = CGPathCreateMutableCopyByTransformingPath(path, &transformation)!
        return path
    }
}