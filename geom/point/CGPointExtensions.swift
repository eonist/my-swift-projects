import Foundation


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
    /**
     * Init a CGPoint with CGFloat values (this method differes from the default by omitting the required argument names)
     */
    init(_ x: CGFloat, _ y:CGFloat) {
        self.x = CGFloat(x)
        self.y = CGFloat(y)
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