import Foundation

public func +(a: CGPoint, b: CGPoint) -> CGPoint { return CGPoint(a.x+b.x, a.y+b.y)}//Adds the coordinates of point p to the coordinates of this point to create a new point
public func -(a: CGPoint, b: CGPoint) -> CGPoint { return CGPoint(a.x-b.x, a.y-b.y)}//Subtracts the coordinates of point p from the coordinates of this point to create a new point.
public func +=(inout a: CGPoint, b: CGPoint) {a.x += b.x;a.y += b.y;}//modifies a by adding b
public func -=(inout a: CGPoint, b: CGPoint) {a.x -= b.x;a.y -= b.y;}//modifies a by substracting b

/**
 * Multiplies two CGPoint values and returns the result as a new CGPoint.
 */
public func * (left: CGPoint, right: CGPoint) -> CGPoint {
    
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
