import Foundation


extension CGPoint{
    /**
    * Returns the distance between two points
    * @Note: Math formula for distance of two points is: AB2 = dx2 + dy2 (distance = sqrt(dx2 + dy2)) where one side is dx - the difference in x-coordinates, and the other is dy - the difference in y-coordinates.
    * @Note: Math formula: c^2=a^2+b^2 (||u|| = √h^2+v^2) (in triangle notation c= hypotenus etc)
    */
    func distance(p:CGPoint) -> CGFloat {
        let xDifference:CGFloat = p.x-self.x;
        let yDifference:CGFloat = p.y-self.y;
        return sqrt(pow(xDifference, 2) + pow(yDifference, 2));
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
    /**
     * Init a CGPoint with Int values
     */
    init(_ x: Int, _ y:Int) {
        self.x = CGFloat(x)
        self.y = CGFloat(y)
    }
    /**
     * Init a CGPoint with CGFloat values (this method differes from the default by omitting the required argument names)
     */
    init(_ x: CGFloat, _ y:CGFloat) {
        self.x = x
        self.y = y
    }
}

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

/**
 * Subtracts two CGPoint values and returns the result as a new CGPoint.
 */
public func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}
/**
 * Decrements a CGPoint with the value of another.
 */
public func -= (inout left: CGPoint, right: CGPoint) {
    left = left - right
}
/**
 * Multiplies two CGPoint values and returns the result as a new CGPoint.
 */
public func * (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x * right.x, y: left.y * right.y)
}
/**
 * Multiplies a CGPoint with another.
 */
public func *= (inout left: CGPoint, right: CGPoint) {
    left = left * right
}

/**
 * Multiplies the x and y fields of a CGPoint with the same scalar value and
 * returns the result as a new CGPoint.
 */
public func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

/**
 * Multiplies the x and y fields of a CGPoint with the same scalar value.
 */
public func *= (inout point: CGPoint, scalar: CGFloat) {
    point = point * scalar
}

/**
 * Divides two CGPoint values and returns the result as a new CGPoint.
 */
public func / (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x / right.x, y: left.y / right.y)
}

/**
 * Divides a CGPoint by another.
 */
public func /= (inout left: CGPoint, right: CGPoint) {
    left = left / right
}

/**
 * Divides the x and y fields of a CGPoint by the same scalar value and returns
 * the result as a new CGPoint.
 */
public func / (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / scalar, y: point.y / scalar)
}

/**
 * Divides the x and y fields of a CGPoint by the same scalar value.
 */
public func /= (inout point: CGPoint, scalar: CGFloat) {
    point = point / scalar
}