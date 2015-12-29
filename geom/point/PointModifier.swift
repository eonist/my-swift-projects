import Foundation

class PointModifier {
    /**
     * @param rotation must be between -PI and +PI
     */
    class func safeRotatePoint(pivot:CGPoint, _ point:CGPoint, _ rotation:CGFloat)->CGPoint {
        let pointAngle:CGFloat = Trig.angle(pivot, point)//find the angle of point
        let distance:CGFloat = PointParser.distance(pivot, point);//length of point and pivotPoint
        let rot:CGFloat = Trig.normalize2(pointAngle + rotation);//sum of pointAngle and rotation, normalize this
        return pivot + PointParser.safePolar(distance, rot);//use Point.polar
    }
    /**
     * Scales @Param p at @param pivot with @param scale
     */
    class func scale(p:CGPoint,_ pivot:CGPoint,_ scale:CGPoint/*0-1*/)->CGPoint{
        var transform = CGAffineTransformIdentity
        transform.scaleFromPoint(scale.x, scale.y, pivot)
        return CGPointApplyAffineTransform(p, transform)
    }
}
