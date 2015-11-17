import Foundation

extension CGPoint{
    func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
    /**
     * Adds two CGPoint values and returns the result as a new CGPoint.
     */
    func + (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x + right.x, y: left.y + right.y)
    }
    
    /**
     * Increments a CGPoint with the value of another.
     */
    public func += (inout left: CGPoint, right: CGPoint) {
        left = left + right
    }
    /**
     *
     */
    func add(p:CGPoint)->CGPoint{
        return CGPointMake(x + p.x, y + p.y)
    }
    /**
     *
     */
    func subtract(p:CGPoint)->CGPoint{
        return CGPointMake(x - p.x, y - p.y)
    }
    /**
     * Init a CGPoint with Double values
     */
    init(_ x: Double, _ y:Double) {
        self.x = CGFloat(x)
        self.y = CGFloat(y)
    }
}
