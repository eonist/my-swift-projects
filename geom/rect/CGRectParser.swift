import Cocoa
/**
 * NOTE: CGRectExtension also has alot of methods for parsing the CGRect
 */
class CGRectParser{
    /**
     * Returns a Rectangle instance from any two points (does not have to be topLeft and bottomRight)
     */
    class func rectangleByPoints(p1:CGPoint,_ p2:CGPoint) -> CGRect {
        let top:CGFloat = min(p1.y, p2.y)
        let left:CGFloat = min(p1.x, p2.x)
        let bottom:CGFloat = max(p1.y, p2.y)
        let right:CGFloat = max(p1.x, p2.x)
        let width:CGFloat = right - left
        let height:CGFloat = bottom - top
        return CGRect(left,top,width,height)
    }
    /**
     * NOTE: you can also use: someCGRect.center
     */
    class func center(rectangle:CGRect) -> CGPoint {
        return CGPoint.interpolate(rectangle.topLeft, rectangle.bottomRight, 0.5);
    }
    /**
     * EXAMPLE: roundRect(CGRect rect, CGFloat radius)
     */
    class func roundRect(rect:CGRect,  _ radius:CGFloat) ->CGMutablePathRef{
        let path:CGMutablePathRef = CGPathCreateMutable();
        CGPathMoveToPoint(path, nil, CGRectGetMidX(rect), CGRectGetMinY(rect));
        CGPathAddArcToPoint(path, nil, CGRectGetMaxX(rect), CGRectGetMinY(rect), CGRectGetMaxX(rect), CGRectGetMaxY(rect), radius);
        CGPathAddArcToPoint(path, nil, CGRectGetMaxX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMaxY(rect), radius);
        CGPathAddArcToPoint(path, nil, CGRectGetMinX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMinY(rect), radius);
        CGPathAddArcToPoint(path, nil, CGRectGetMinX(rect), CGRectGetMinY(rect), CGRectGetMaxX(rect), CGRectGetMinY(rect), radius);
        CGPathCloseSubpath(path);
        return path;
    }
    /**
     * Create a path using the coordinates of the rect passed in
     */
    class func path(rect:CGRect)->CGMutablePath{
        let path:CGMutablePath = CGPathCreateMutable()
        //Swift.print(CGRectParser.path() + String(path))
        CGPathMoveToPoint(path, nil, rect.origin.x, rect.origin.y)
        CGPathAddLineToPoint(path, nil, rect.origin.x + rect.size.width, rect.origin.y);// ***** Segment 1 *****
        CGPathAddLineToPoint(path, nil, rect.origin.x + rect.size.width,rect.origin.y + rect.size.height);// ***** Segment 2 *****
        CGPathAddLineToPoint(path, nil, rect.origin.x, rect.origin.y + rect.size.height);// ***** Segment 3 *****
        CGPathCloseSubpath(path);// ***** Segment 4 created by closing the path *****
        return path
    }
    /**
     * Returns the midPoint of each side in PARAM: rect
     */
    class func sides(rect:CGRect) -> Array<CGPoint> {/*<--Was previously named sidePoints*/
        return [rect.left,rect.right,rect.top,rect.bottom]
    }
    /**
     * Returns all the corners in PARAM: rect
     */
    class func corners(rect:CGRect) -> Array<CGPoint> {
        return [rect.topLeft,rect.topRight,rect.bottomLeft,rect.bottomRight]
    }
    /**
     * // :TODO: maybe get the local rect with the pivot as center?? how does it work, hmmm
     */
    class func localRectangle(topLeft:CGPoint,_ bottomRight:CGPoint,_ rotation:CGFloat) -> CGRect {
        let points:Array<CGPoint> = [topLeft, bottomRight]
        var rotatedPoints:Array<CGPoint> = PointModifier.rotatePoints(points, CGPoint(), -rotation)
        return rectangle(rotatedPoints[0], rotatedPoints[1])
    }
    /**
     *
     */
    class func rectangle(topLeft:CGPoint, _ bottomRight:CGPoint) -> CGRect{
        let width:CGFloat = NumberParser.difference(topLeft.x, bottomRight.x)
        let height:CGFloat = NumberParser.difference(topLeft.y, bottomRight.y)
        return CGRect(topLeft.x, topLeft.y, width, height)
    }
}

//math related to the rectangle
//Examples of good candidates for structures include:

//The size of a geometric shape, perhaps encapsulating a width property and a height property, both of type Double.
//A way to refer to ranges within a series, perhaps encapsulating a start property and a length property, both of type Int.
//A point in a 3D coordinate system, perhaps encapsulating x, y and z properties, each of type Double.

/*
struct Point {
var x = 0.0, y = 0.0
}
struct Size {
var width = 0.0, height = 0.0
}
struct Rect {
var origin = Point()
var size = Size()
var center: Point {
get {
let centerX = origin.x + (size.width / 2)
let centerY = origin.y + (size.height / 2)
return Point(x: centerX, y: centerY)
}
set(newCenter) {
origin.x = newCenter.x - (size.width / 2)
origin.y = newCenter.y - (size.height / 2)
}
}
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")


*/

// prints "square.origin is now at (10.0, 10.0)"

//Shorthand Setter Declaration
//If a computed property’s setter does not define a name for the new value to be set, a default name of newValue is used. Here’s an alternative version of the Rect structure, which takes advantage of this shorthand notation:




/*
struct AlternativeRect {
var origin = Point()
var size = Size()
var center: Point {
get {
let centerX = origin.x + (size.width / 2)
let centerY = origin.y + (size.height / 2)
return Point(x: centerX, y: centerY)
}
set {
origin.x = newValue.x - (size.width / 2)
origin.y = newValue.y - (size.height / 2)
}
}
}
*/

/*
//You can simplify the declaration of a read-only computed property by removing the get keyword and its braces

struct Cuboid {
var width = 0.0, height = 0.0, depth = 0.0
var volume: Double {
return width * height * depth
}
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
// prints "the volume of fourByFiveByTwo is 40.0"

*/

/*
Modifying Value Types from Within Instance Methods

Structures and enumerations are value types. By default, the properties of a value type cannot be modified from within its instance methods.

However, if you need to modify the properties of your structure or enumeration within a particular method, you can opt in to mutating behavior for that method. The method can then mutate (that is, change) its properties from within the method, and any changes that it makes are written back to the original structure when the method ends. The method can also assign a completely new instance to its implicit self property, and this new instance will replace the existing one when the method ends.

You can opt in to this behavior by placing the mutating keyword before the func keyword for that method:

*/

/*
struct Point {
var x = 0.0, y = 0.0
mutating func moveByX(deltaX: Double, y deltaY: Double) {
x += deltaX
y += deltaY
}
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveByX(2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")
// prints "The point is now at (3.0, 4.0)"


//
let size = CGSize(width: 20, height: 40)
//The overlay also lets you call Foundation functions on structures in a natural way.

let rect = CGRect(x: 50, y: 50, width: 100, height: 100)
let width = rect.width    // equivalent of CGRectGetWidth(rect)
let maxX = rect.maxY      // equivalent of CGRectGetMaxY(rect)

*/
