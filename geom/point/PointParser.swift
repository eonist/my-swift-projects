import Foundation
class PointParser{
    /**
     * Returns a point between PARAM: p1 and PARAM: p2 multiplied by the PARAM: scalar
     * PARAM: scalar: the scalar is between 0 and 1
     * NOTE: PointParser.interpolate() is different form the Adobe flash native Point.interpolate, the later multiplies from p2 to p1,
     * the former multiplies form p1 tp p2 which i think is more logical
     * // :TODO: using Math.abs could be more optimized? this optimization needs research. check the proto site
     */
    static func interpolate(a:CGPoint, _ b:CGPoint, _ scalar:CGFloat)->CGPoint {
        return CGPoint(NumberParser.interpolate(a.x, b.x, scalar), NumberParser.interpolate(a.y, b.y, scalar))
    }
    /**
     * Returns a point in a polar cordinate system by PARAM: len and PARAM: angle (in a safe way)
     * PARAM: angle must be between -PI and PI use:  Angle.normalized2(angle)
     * TODO: compact this method
     * TODO: why is this safe and regular polar isnt
     */
    static func safePolar(len:CGFloat, _ angle:CGFloat)->CGPoint {
        var x:CGFloat = cos(angle) * len
        var y:CGFloat = sin(angle) * len
        if(angle == 0){
            x = len
            y = 0
        }else if(angle == π || angle == -π){
            x = -len
            y = 0
        }else if(angle == -π/2){
            x = 0
            y = -len
        }else if(angle == π/2){
            x = 0
            y = len
        }else{
            x = cos(angle) * len
            y = sin(angle) * len
        }
        return CGPoint(x,y)
    }
    /**
     * Returns the distance between two points
     * NOTE: Math formula for distance of two points is: AB2 = dx2 + dy2 (distance = sqrt(dx2 + dy2)) where one side is dx - the difference in x-coordinates, and the other is dy - the difference in y-coordinates.
     * NOTE: Math formula: c^2=a^2+b^2 (||u|| = √h^2+v^2) (in triangle notation c= hypotenus etc)
     */
    static func distance(a:CGPoint,_ b:CGPoint) -> CGFloat{
        let xDifference:CGFloat = NumberParser.relativeDifference(a.x,b.x)
        let yDifference:CGFloat = NumberParser.relativeDifference(a.y,b.y)
        return sqrt(pow(xDifference, 2) + pow(yDifference, 2))
    }
    /**
     * Returns a point, in a polar cordinate system (from 0,0), for PARAM: angle and PARAM: length
     * Return: a point on a circle where the pivot is TopLeft Corner (0,0)
     * PARAM: radius: the radius of the circle
     * PARAM: angle: the angle where the point is (in radians) (-π to π) (3.14.. to 3.14..)
     * NOTE: formula "<angle*cos*radius,angle*sin*radius>"
     * NOTE: One can also use Point.polar(radius,radian) or equivilent method in the spesific language
     * Base formula CosΘ = x/len
     * Base Formula SinΘ = y/len
     */
    static func polar(radius:CGFloat, _ angle:CGFloat) -> CGPoint {
        let x:CGFloat = /*radius + */(radius * cos(angle))
        let y:CGFloat = /*radius + */(radius * sin(angle))
        return CGPoint(x, y)
    }
    /**
     * Returns the slope of two points (the rate of change)
     * FORMULA: "y2-y1/x2-x1"
     * NOTE: you can also find slope by this: Math.tan(Trig.angle(p1,p2))
     * NOTE: if slope returns infinity that means its straight down
     * NOTE: if slope returns -infinity that means its straight up
     * NOTE: if the slope returns 0 that means its straight forward or straight back, this makes it hard to destinguish between forward and backward slope unless you flip the x and y for both values incases where all y values are equal
     * NOTE: if the slope returns NaN that means p1 equals p2
     * Positive line increases from left to right
     * Negative line decreases from right to left
     * Zero line is horizontal
     * Undefined line is vertical
     */
    static func slope(p1:CGPoint,_ p2:CGPoint)->CGFloat {
        let a:CGFloat = (p2.y-p1.y)
        //print("a: " + a)
        let b:CGFloat = (p2.x-p1.x)
        //print("b: " + b)
        //var test:Number = Math.tan(Trig.angle(p1,p2))
        //print("test: " + test)
        return a/b
    }
    /**
     * Returns the x position when a line passes through PARAM: p1 and PARAM: y2 and that line has a slope-value of PARAM: slope
     * PARAM: slope (the rate of change between x and y) use PointParser.slope(p1,p2) to find the slope
     * NOTE: based on the equation: "slope = (y2-y1)/(x2-x1)"
     * NOTE: the Angle.y() is a similar method but it uses the angle to find the x
     * NOTE: this method is great if you have 2 points and you want to find the third but you only know the y value of that point
     * EXAMPLE: PointParser.x(new Point(100,100), 200, 1);//Output: 200
     */
    static func x(p1:CGPoint,_ y2:CGFloat,_ slope:CGFloat)->CGFloat {
        return ((y2-p1.y)/slope)+p1.x
    }
    /**
     * Returns the y position when a line passes through PARAM: p1 and PARAM: y2 and that line has a slope-value of PARAM: slope
     * NOTE: based on the equation: "slope = (y2-y1)/(x2-x1)"
     * NOTE: the Angle.x() is a similar method but it uses the angle to find the x
     * NOTE: this method is great if you have 2 points and you want to find the third but you only know the x value of that point
     * PARAM: slope (the rate of change between x and y) use PointParser.slope(p1,p2) to find the slope
     * EXAMPLE: PointParser.y(new Point(100,100), 200, 1);//Output: 200
     */
    static func y(p1:CGPoint,_ x2:CGFloat,_ slope:CGFloat)->CGFloat {
        return (slope*(x2 - p1.x))+p1.y
    }
    /**
     * Returns the difference between two points
     * print(new Point(20,20),new Point(-40,-40))//Output: (-60,-60)
     * print(new Point(20,20),new Point(40,-40))//Output: (20,-60)
     * print(difference(new Point(2,2), new Point(4,4)))//Outputs: (2,2)
     * print(difference(new Point(2,2), new Point(-4,-4)))//Outputs: (-6,-6)
     * print(difference(new Point(-2,-2), new Point(-4,-4)))//Outputs: (-2,-2)
     * print(difference(new Point(-2,-2), new Point(4,4)))//Outputs: (6,6)
     * NOTE: great at finding polar points when the pivot isnt at point 0,0
     * // :TODO: is there a math formula ? write the formula you have atleast
     */
    static func difference(p1:CGPoint,_ p2:CGPoint)->CGPoint {
        let x:CGFloat = NumberParser.difference(p1.x, p2.x)
        let y:CGFloat = NumberParser.difference(p1.y, p2.y)
        return CGPoint(x,y)
    }
    /**
     *
     */
    static func relativeDifference(a:CGPoint,_ b:CGPoint)->CGPoint{
        let x:CGFloat = NumberParser.relativeDifference(a.x, b.x)
        let y:CGFloat = NumberParser.relativeDifference(a.y, b.y)
        return CGPoint(x,y)
    }
    /**
     * NOTE: works similar to directionalAxisDifference, but returns only positive values (distance can only be positive)
     */
    static func directionalAxisDistance(pivot:CGPoint,_ point:CGPoint, _ rotation:CGFloat)->CGPoint {
        let leveledPoint:CGPoint = PointModifier.safeRotatePoint(pivot,point, -rotation)/*find the x and y in a correctly angled axis point system by using -angleAxis*/
        return axisDistance(pivot, leveledPoint)
    }
    /**
     * Returns the distance between points in both the x and y axis. (unlike Point.distance which returns the diagonal distance between two points)
     * // :TODO: potentially make polarAxisDistance which would potentially support any angled axis
     * NOTE: think of this method as a way of finding the horizontal and vertical distance between two points
     */
    static func axisDistance(p1:CGPoint, _ p2:CGPoint)->CGPoint {
        return CGPoint(NumberParser.distance(p1.x, p2.x), NumberParser.distance(p1.y, p2.y))
    }
    /**
     * Returns the distance (can be positive or negative) in x and y axis
     * IMPORTANT: use the x value and the Point.polar(x,axisangle) to find the p
     * NOTE: remember to rotate the axix after its been returned from this method
     * PARAM: rotation: the angle you want to levle with
     * // :TODO: shouldnt the axis be found by Angle.angle(p1,p2) ?!?
     * // :TODO: you may not need to use rotation with pivot, the pivot may not be needed
     * // :TODO: rename to localDifference, another sugestion would be axisDifference or leveledDifference
     */
    static func directionalAxisDifference(pivot:CGPoint,_ point:CGPoint,_ rotation:CGFloat)->CGPoint {
        let leveledPoint:CGPoint = PointModifier.safeRotatePoint(pivot,point, -rotation)/*find the x and y in a correctly angled axis point system by using -angleAxis*/
        return PointParser.difference(pivot, leveledPoint)/*use the x value and the Point.polar(x,axisangle) to find the p*/
    }
    /**
     * NOTE: same as directionalAxisDifference, but uses the NumerParser.relativeDifference() method
     */
    static func relativeDirectionalAxisDifference(pivot:CGPoint,_ point:CGPoint,_ rotation:CGFloat)->CGPoint {
        let leveledPoint:CGPoint = PointModifier.safeRotatePoint(pivot,point, -rotation)/*find the x and y in a correctly angled axis point system by using -angleAxis*/
        return PointParser.relativeDifference(pivot, leveledPoint)/*use the x value and the Point.polar(x,axisangle) to find the p*/
    }
    
    /**
     * Returns a CGRect that makes derived from PARAM: points (think bounding box of points)
     */
    static func rectangle(points:Array<CGPoint>)->CGRect{
        var max:CGPoint = points.count > 0 ? (points[0] as CGPoint).copy():CGPoint()
        var min:CGPoint = points.count > 0 ? (points[0] as CGPoint).copy():CGPoint()
        for point : CGPoint in points {
            if(point.x > max.x) {max.x = point.x}
            else if(point.x < min.x){ min = CGPoint(point.x,min.y)}
            if(point.y > max.y){ max.y = point.y}
            else if(point.y < min.y){ min.y = point.y}
        }
        return cornersToRectangle(min,max)
    }
    /**
     * Returns an rectangle from a topLeft and bottomRight corners
     * NOTE: getting the points from an rectangle: _transformBox.boundingBox.getRect(_transformBox) output: (x=0, y=0, w=400, h=400)
     */
    static func cornersToRectangle(topLeft:CGPoint, _ bottomRight:CGPoint)->CGRect{
        let width:CGFloat = NumberParser.distance(topLeft.x, bottomRight.x)
        let height:CGFloat = NumberParser.distance(topLeft.y, bottomRight.y)
        return CGRect(topLeft.x, topLeft.y, width, height)
    }
    /**
     * Returns the avarage point in an array of point
     * NOTE: Centeroid definition: the center of mass of a geometric object of uniform
     * NOTE: Median definition: the midpoint of a frequency distribution of observed values or quantities
     * NOTE: could also be named avg for average
     * TODO: rename to average?
     * // :TODO: add support for ...args see dataprovider for example, this may slow down this function which needs to be fast,maybe make a fastMedian suppliment function then?
     */
    static func median(points:Array<CGPoint>) -> CGPoint{
        var median:CGPoint = CGPoint()
        for point:CGPoint in points {
            median.x += point.x// :TODO: possibly use point.add?, you can also just do median += point here
            median.y += point.y
        }
        let numOfPoints:Int = points.count
        median.x /= numOfPoints.cgFloat// :TODO: possibly use point.divide or similar utility function?
        median.y /= numOfPoints.cgFloat
        return median
    }
    /**
     * Returns a Point half way between PARAM: p1 and p2
     * Note: can also use Point.interpolate(p1,p2,0.5)
     * // :TODO: can you write an example just with substraction, this might be usefull and more optimized
     * EXAMPLE (how to do it with substraction and addition)
     * var minX:Number = Math.min(p1.x,p2.x);
     * var minY:Number = Math.min(p1.y,p2.y);
     * var maxX:Number = Math.max(p1.x,p2.x);
     * var maxY:Number = Math.max(p1.y,p2.y);
     * var center:CGPoint = CGPoint(minX+((maxX-minX)/2),(minY+((maxY-minY)/2)));
     */
    static func center(p1:CGPoint, _ p2:CGPoint) -> CGPoint {
        return CGPoint.interpolate(p1,p2,0.5)
    }
    /**
     * Returns a Point half way between PARAM: p1 and PARAM: p2
     * NOTE: formula: "(x1+x2)/2 , (y1,y2)/2"
     * NOTE: probably faster than using interpolation
     */
    static func midPoint(p1:CGPoint,_ p2:CGPoint) -> CGPoint {
        return CGPoint((p1.x+p2.x)/2,(p1.y+p2.y)/2)
    }
    /**
     * Returns a new point comprised of the addition of two points
     */
    static func add(a:CGPoint,_ b:CGPoint) -> CGPoint {
        return CGPoint(a.x+b.x, a.y+b.y)
    }
    /**
     * Returns a new point comprised of the subtraction of two points
     */
    static func subtract(a:CGPoint,_ b:CGPoint) -> CGPoint {
        return CGPoint(a.x-b.x, a.y-b.y)
    }
    /**
     * Returns a new point comprised of the division of two points
     */
    static func divide(a:CGPoint,_ b:CGPoint) -> CGPoint {
        return CGPoint(a.x/b.x, a.y/b.y)
    }
    /**
     * Returns the multiplication of two points
     * EXAMPLE: PointParser.multiply(CGPoint(20,20), CGPoint(2,2))//Output: (40,40)
     */
    static func multiply(a:CGPoint,_ b:CGPoint) -> CGPoint {
        return CGPoint(a.x*b.x, a.y*b.y)
    }
    /**
    * Returns the point of intersection between two lines
    * PARAM: p1, p2 (Point) line 1 point struct
    * PARAM: p3, p4 (Point) line 2 point struct
    * NOTE: you can use Trigonometry to accomplish this see the Traingle classes, its basically when you have 2 angles and 1 side, since you have 2 angles you have the third aswell, then you can use sin and cos to find the point
    * NOTE: if eigther p1 or p2 is CoLinear and within with p3 and p4 then it will yield an intersection
    * NOTE: if line a touches the start or end of line b then it intersects
    * NOTE: if 2 lines are colinear this method will return (x=0, y=NaN) or (x=NaN, y=0) or (x=NaN, y=NaN) same if the lines are equal
    * NOTE: you can also use convergingPoint in TriangleMath instead of intersection 
    * // :TODO: thouroughly test this function before deployment, what happens with parralell lines for instance?
    * // :TODO: comment this method
    * // :TODO: do reasearch into vectors, slope and the intersection of vectrors
    * // :TODO: this actually gave a bad result
    * // :TODO: if the end of line a is equal to the end of line b then it returns a faulty result (x=0, y=NaN)
    * // :TODO: doesnt handle parallel cases very well (x=0, y=NaN), do you mean paralellel or colinear?
    * // :TODO: if you deal with finding the intersection on a case that makes a cross, then you can probably do a faster intersection that is also more correct, if y = y and x = x and y is within the length of b, and x is within the length of b then the intersection must be a.y and b.x etc
    */
    static func intersection(p1:CGPoint, _ p2:CGPoint, _ p3:CGPoint, _ p4:CGPoint) -> CGPoint {
        let x1:CGFloat = p1.x
        let y1:CGFloat = p1.y
        let x4:CGFloat = p4.x
        let y4:CGFloat = p4.y
        let dx1:CGFloat = p2.x - x1
        Swift.print("dx1: " + "\(dx1)")
        let dx2:CGFloat = p3.x - x4
        Swift.print("dx2: " + "\(dx2)")
        var p:CGPoint = CGPoint()
        if (dx1 == 0 || dx2 == 0){// :TODO: not 0 or what?
            print("case a");
            p.x = 0
            p.y = 0
            /*return NaN;*/
        }
        let m1:CGFloat = (p2.y - y1) / dx1
        let m2:CGFloat = (p3.y - y4) / dx2
        if (dx1 == 0){// :TODO: not 0 or what?
            print("case b")
            p.x = x1
            p.y = m2 * (x1 - x4) + y4
            return p
        }else if (dx2 == 0){// :TODO: not 0 or what?
            print("case c");
            p.x = x4
            p.y = m1 * (x4 - x1) + y1
            return p
        }
        p.x = (-m2 * x4 + y4 + m1 * x1 - y1) / (m1 - m2)
        p.y = m1 * (p.x - x1) + y1
        return p
    }
    /**
     * beta
     * NOTE: sometimes when 2 lines touch at the begining or ends they dont yeild the correct intersection
     * NOTE: when line a touches the line part of line b, not line b end or beginning then 3 points are collinear and the line a point that is collinear with line b is returned
     * NOTE: the lines cant be colinear or equal
     */
    static func normalizedIntersection(aP1:CGPoint, _ aP2:CGPoint, _ bP1:CGPoint, _ bP2:CGPoint) -> CGPoint {
        if(aP1.equals(bP1) || aP1.equals(bP2)){ return aP1}
        else if(aP2.equals(bP1) || aP2.equals(bP2)){ return aP2}
        else if(PointAsserter.collinear(aP1, aP2, bP1)){ return bP1}
        else if(PointAsserter.collinear(aP1, aP2, bP2)){ return bP2}
        else if(PointAsserter.collinear(bP1, bP2, aP1)){ return aP1}
        else if(PointAsserter.collinear(bP1, bP2, aP2)){ return aP2}
        else {return PointParser.intersection(aP1, aP2, bP1, bP2)}
    }
}
/**
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