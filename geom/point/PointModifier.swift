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
     * EXAMPLE: PointModifier.scale(CGPoint(0,0), CGPoint(40,40), CGPoint(2,2))//Output: (-40.0, -40.0)
     */
    class func scale(p:CGPoint,_ pivot:CGPoint,_ scale:CGPoint/*0-1*/)->CGPoint{
        var transform = CGAffineTransformIdentity
        transform.scaleFromPoint(scale.x, scale.y, pivot)
        return CGPointApplyAffineTransform(p, transform)
    }
    /**
     * Scales an array of points from @param pivotPoint to @param xScale and @param yScale 
     * @param points reoresents the points to be scaled
     * @param pivot represents the origin point where the @param points are scaled from 
     * @param scale represents the x and y axis scale ratio
     * @Note Does not modify the original array
     * @example: 
     * circle.setPosition(100,100)
     * var pivotPoint:Point = new Point(50,50)
     * var scaledPoints:Array = PointModifier.scalePoints([new Point(circle.x,circle.y)], pivotPoint,1, 1.5)
     * circle.setPosition(scaledPoints[0]);//Output: the circle is now at 100,125
     */
    class func scalePoints(points:Array<CGPoint>,_ pivot:CGPoint,_ scale:CGPoint)->Array<CGPoint>{
        var scaledPoints:Array<CGPoint> = []
        for p : CGPoint in points{ scaledPoints.append(PointModifier.scale(p,pivot,scale))}
        return scaledPoints
    }
    /**
     * Use this when you want to scale the points directly
     */
    class func scalePoints(inout points:Array<CGPoint>,_ pivot:CGPoint,_ scale:CGPoint) {
        for var i = 0; i < points.count; ++i{points[i] = PointModifier.scale(points[i],pivot,scale)}
    }
}