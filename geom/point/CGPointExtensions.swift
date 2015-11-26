import Foundation


extension CGPoint{
    /**
     * @param radius: the radius of the circle
     * @param angle: the angle where the point is (in radians) (-π to π) (3.14.. to 3.14..)
     * @return a point on a circle where the pivot is TopLeft Corner (0,0)
     * @Note: One can also use Point.polar(radius,radian) or equivilent method in the spesific language
     */
    static func polarPoint(radius:CGFloat, _ angle:CGFloat) -> CGPoint {
        let x:CGFloat = /*radius + */(radius * cos(angle));
        let y:CGFloat = /*radius + */(radius * sin(angle));
        return CGPoint(x, y);
    }
    /**
     * Returns the distance between two points
     */
    static func distance(a:CGPoint,_ b:CGPoint) -> CGFloat{
        return PointParser.distance(a,b)
    }
}
/*Convenient extensions*/
extension CGPoint{
    func distance(p:CGPoint) -> CGFloat { return CGPoint.distance(self,p) }//distance from self to p
    func polarPoint(radius:CGFloat, _ angle:CGFloat) -> CGPoint { return self + CGPoint.polarPoint(radius, angle) }//polarPoint from self
    init(_ x: Double, _ y:Double) { self.x = CGFloat(x); self.y = CGFloat(y); }//Init a CGPoint with Double values
    init(_ x: Int, _ y:Int) {self.x = CGFloat(x);self.y = CGFloat(y); }//Init a CGPoint with Int values
    init(_ x: CGFloat, _ y:CGFloat) { self.x = x;self.y = y;}//Init a CGPoint with CGFloat values (this method differes from the default by omitting the required argument names)
}
