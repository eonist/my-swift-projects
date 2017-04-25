import Foundation
/*Class methods:*/
extension CGPoint{
    static func polarPoint(_ radius:CGFloat, _ angle:CGFloat) -> CGPoint {/*Convenience*/
        return PointParser.polar(radius, angle)
    }
    static func distance(_ a:CGPoint, _ b:CGPoint) -> CGFloat{/*Convenience*/
        return PointParser.distance(a,b)
    }
    static func interpolate(_ a:CGPoint, _ b:CGPoint, _ scalar:CGFloat) -> CGPoint{/*Convenience*/
        return PointParser.interpolate(a,b, scalar)
    }
}
/*Convenient extensions*/
extension CGPoint{
    /*Initiaters*/
    init(_ x: Double, _ y:Double) { self.x = CGFloat(x); self.y = CGFloat(y); }/*Init a CGPoint with Double values*/
    init(_ x: Int, _ y:Int) {self.x = CGFloat(x);self.y = CGFloat(y); }/*Init a CGPoint with Int values*/
    init(_ x: CGFloat, _ y:CGFloat) { self.x = x;self.y = y;}/*Init a CGPoint with CGFloat values (this method differes from the default by omitting the required argument names)*/
    /*Parsers*/
    func distance(_ p:CGPoint) -> CGFloat { return CGPoint.distance(self,p) }//distance from self to p
    func polarPoint(_ radius:CGFloat, _ angle:CGFloat) -> CGPoint { return self + CGPoint.polarPoint(radius, angle) }//polarPoint from self
    //func polar(radius:CGFloat, _ angle:CGFloat) -> CGPoint { return polarPoint(radius, angle) }//convenience and legacy support
    func interpolate(_ p:CGPoint,_ scalar:CGFloat) -> CGPoint { return CGPoint.interpolate(self,p,scalar) }//interpolate from self to b by scalar
    func copy()->CGPoint{return CGPoint(self.x,self.y)}
    func clone()->CGPoint{return CGPoint(self.x,self.y)}
    func add(_ p:CGPoint)->CGPoint{return PointParser.add(self, p)}
    func subtract(_ p:CGPoint) -> CGPoint {return PointParser.subtract(self, p)}
    func multiply(_ p:CGPoint) -> CGPoint {return PointParser.multiply(self, p)}
    func divide(_ p:CGPoint) -> CGPoint {return PointParser.divide(self, p)}
    /*Asserters*/
    func equals(_ p:CGPoint) -> Bool {return PointAsserter.equals(self, p)}
    
    subscript(dir:Dir) -> CGFloat {/*Convenience*/
        get {
            switch dir{
                case .hor:
                    return self.x
                case .ver:
                    return self.y
            }
        }set {
            switch dir{
                case .hor:
                    self.x = newValue
                case .ver:
                    self.y = newValue
            }
        }
    }
}
/*Convenient operators*/
public func +(a: CGPoint, b: CGPoint) -> CGPoint { return PointParser.add(a, b)}//Adds the coordinates of point p to the coordinates of this point to create a new point
public func -(a: CGPoint, b: CGPoint) -> CGPoint { return PointParser.subtract(a, b)}//Subtracts the coordinates of point p from the coordinates of this point to create a new point.
public func +=( a: inout CGPoint, b: CGPoint) {a.x += b.x;a.y += b.y;}//modifies a by adding b
public func -=( a: inout CGPoint, b: CGPoint) {a.x -= b.x;a.y -= b.y;}//modifies a by substracting b
public func * (left: CGPoint, right: CGPoint) -> CGPoint {return PointParser.multiply(left, right)}//Multiplies two CGPoint values and returns the result as a new CGPoint.
public func *= ( left: inout CGPoint, right: CGPoint) {left = left * right}/*Multiplies a CGPoint with another.*/
public func * (point: CGPoint, scalar: CGFloat) -> CGPoint {return CGPoint(x: point.x * scalar, y: point.y * scalar)}/*Multiplies the x and y fields of a CGPoint with the same scalar value and (returns the result as a new CGPoint.)*/
public func *= ( point: inout CGPoint, scalar: CGFloat) {point = point * scalar}/*Multiplies the x and y fields of a CGPoint with the same scalar value.*/
public func / (left: CGPoint, right: CGPoint) -> CGPoint {return PointParser.divide(left, right)}/*Divides two CGPoint values and returns the result as a new CGPoint.*/
public func /= ( left: inout CGPoint, right: CGPoint) {left = left / right}/*Divides a CGPoint by another.*/
public func / (point: CGPoint, scalar: CGFloat) -> CGPoint {return CGPoint(x: point.x / scalar, y: point.y / scalar)}/*Divides the x and y fields of a CGPoint by the same scalar value and returns (the result as a new CGPoint.)*/
public func /= ( point: inout CGPoint, scalar: CGFloat) {point = point / scalar}/*Divides the x and y fields of a CGPoint by the same scalar value.*/
