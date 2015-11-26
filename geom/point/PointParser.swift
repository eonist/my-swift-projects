import Foundation
class PointParser{
    /**
     * Returns a point in a polar cordinate system by @param len and @param angle (in a safe way)
     * @param angle must be between -PI and PI use:  Angle.normalized2(angle)
     * TODO: compact this method
     * TODO: why is this safe and regular polar isnt
     */
    class func safePolar(len:CGFloat, _ angle:CGFloat)->CGPoint {
        var x:CGFloat = cos(angle) * len;
        var y:CGFloat = sin(angle) * len;
        if(angle == 0){
            x = len;
            y = 0;
        }else if(angle == π || angle == -π){
            x = -len;
            y = 0;
        }else if(angle == -π/2){
            x = 0;
            y = -len;
        }else if(angle == π/2){
            x = 0;
            y = len;
        }else{
            x = cos(angle) * len;
            y = sin(angle) * len;
        }
        return CGPoint(x,y);
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
    /**
     * Returns a point, in a polar cordinate system (from 0,0), for @param angle and @param length
     * @param radius: the radius of the circle
     * @param angle: the angle where the point is (in radians) (-π to π) (3.14.. to 3.14..)
     * @return a point on a circle where the pivot is TopLeft Corner (0,0)
     * @Note formula "<angle*cos*radius,angle*sin*radius>"
     * Base formula CosΘ = x/len
     * Base Formula SinΘ = y/len
     * @Note: One can also use Point.polar(radius,radian) or equivilent method in the spesific language
     */
    class func polar(radius:CGFloat, _ angle:CGFloat) -> CGPoint {
        let x:CGFloat = /*radius + */(radius * cos(angle));
        let y:CGFloat = /*radius + */(radius * sin(angle));
        return CGPoint(x, y);
    }
    /**
     * @Note works similar to directionalAxisDifference, but returns only positive values (distance can only be positive)
     */
    class func directionalAxisDistance(pivot:Point,point:Point,rotation:Number)->CGPoint {
        var leveledPoint:CGPoint = PointModifier.safeRotatePoint(pivot,point, -rotation);/*find the x and y in a correctly angled axis point system by using -angleAxis*/
        return axisDistance(pivot, leveledPoint);
    }
    /**
     * Returns the distance between points in both the x and y axis. (unlike Point.distance which returns the diagonal distance between two points)
     * // :TODO: potentially make polarAxisDistance which would potentially support any angled axis
     * @Note: think of this method as a way of finding the horizontal and vertical distance between two points
     */
    class func axisDistance(p1:CGPoint, _p2:CGPoint)->CGPoint {
        return CGPoint(NumberParser.distance(p1.x, p2.x), NumberParser.distance(p1.y, p2.y));
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


