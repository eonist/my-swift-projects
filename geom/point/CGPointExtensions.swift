import Foundation
/**
 * Increments a CGPoint with the value of another.
 */
public func += (inout left: CGPoint, right: CGPoint) {
    left = left + right
}

/**
 * Adds two CGPoint values and returns the result as a new CGPoint.
 */
public func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

extension CGPoint{
    
   
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
