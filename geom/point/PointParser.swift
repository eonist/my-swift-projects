import Foundation
class PointParser{
    /**
    * @param rotation must be between -PI and +PI
    */
    class func safeRotatePoint(pivot:CGPoint, point:CGPoint, rotation:CGFloat)->CGPoint {
        var pointAngle:CGFloat = Trig.angle(pivot, point);//find the angle of point
        var distance:CGFloat = Point.distance(pivot, point);//length of point and pivotPoint
        var rot:CGFloat = Trig.normalize2(pointAngle + rotation);//sum of pointAngle and rotation, normalize this
        return pivot.add(PointParser.safePolar(distance, rot));//use Point.polar
    }
    /**
     * Returns the distance between two points
     * @Note: Math formula for distance of two points is: AB2 = dx2 + dy2 (distance = sqrt(dx2 + dy2)) where one side is dx - the difference in x-coordinates, and the other is dy - the difference in y-coordinates.
     * @Note: Math formula: c^2=a^2+b^2 (||u|| = √h^2+v^2) (in triangle notation c= hypotenus etc)
     */
    class func distance(a:CGPoint,_ b:CGPoint) -> CGFloat{
        let xDifference:CGFloat = b.x-a.x;
        let yDifference:CGFloat = b.y-a.y;
        return sqrt(pow(xDifference, 2) + pow(yDifference, 2));
    }
}

/*
 * Equivalence Operators
 * Custom classes and structures do not receive a default implementation of the equivalence operators, known as the “equal to” operator (==) and “not equal to” operator (!=). It is not possible for Swift to guess what would qualify as “equal” for your own custom types, because the meaning of “equal” depends on the roles that those types play in your code.
 * To use the equivalence operators to check for equivalence of your own custom type, provide an implementation of the operators in the same way as for other infix operators:
 */

/*
func == (left: Vector2D, right: Vector2D) -> Bool {
    return (left.x == right.x) && (left.y == right.y)
}
func != (left: Vector2D, right: Vector2D) -> Bool {
    return !(left == right)
}
*/
/*
 * The above example implements an “equal to” operator (==) to check if two Vector2D instances have equivalent values. In the context of Vector2D, it makes sense to consider “equal” as meaning “both instances have the same x values and y values”, and so this is the logic used by the operator implementation. The example also implements the “not equal to” operator (!=), which simply returns the inverse of the result of the “equal to” operator.
 * You can now use these operators to check whether two Vector2D instances are equivalent:
 */

/*
let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vectors are equivalent.")
}
*/
// prints "These two vectors are equivalent."


