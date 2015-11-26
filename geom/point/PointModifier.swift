import Foundation

class PointModifier {
    /**
     * @param rotation must be between -PI and +PI
     */
    class func safeRotatePoint(pivot:CGPoint, point:CGPoint, rotation:CGFloat)->CGPoint {
        let pointAngle:CGFloat = Trig.angle(pivot, point)//find the angle of point
        let distance:CGFloat = PointParser.distance(pivot, point);//length of point and pivotPoint
        let rot:CGFloat = Trig.normalize2(pointAngle + rotation);//sum of pointAngle and rotation, normalize this
        return pivot + PointParser.safePolar(distance, rot);//use Point.polar
    }
}
