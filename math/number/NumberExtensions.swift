import Foundation

/**
 * Support for addition of CGFLoat and Double
 * TODO: probably use T or Generics or similar
 * TODO: add support for returning Double aswell
 * TODO: add support for Int and Float aswell
 */
public func + (left: CGFloat, right: Double) -> CGFloat {
    return left + CGFloat(right)
}
/**
 * Support for addition of CGFLoat and Double
 */
public func + (left: Double, right: CGFloat) -> CGFloat {
    return CGFloat(left) + right
}
