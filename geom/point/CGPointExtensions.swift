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
     * @Note: Math formula for distance of two points is: AB2 = dx2 + dy2 (distance = sqrt(dx2 + dy2)) where one side is dx - the difference in x-coordinates, and the other is dy - the difference in y-coordinates.
     * @Note: Math formula: c^2=a^2+b^2 (||u|| = √h^2+v^2) (in triangle notation c= hypotenus etc)
     */
    static func distance(a:CGPoint,_ b:CGPoint) -> CGFloat{
        let xDifference:CGFloat = b.x-a.x;
        let yDifference:CGFloat = b.y-a.y;
        return sqrt(pow(xDifference, 2) + pow(yDifference, 2));
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
