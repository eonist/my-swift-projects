import Cocoa
/**
 * NOTE: CGRectExtension also has alot of methods for parsing the CGRect
 */
class CGRectParser{
    /**
     * Returns a Rectangle instance from any two points (does not have to be topLeft and bottomRight)
     */
    static func rectangleByPoints(_ p1:CGPoint,_ p2:CGPoint) -> CGRect {
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
    static func center(_ rectangle:CGRect) -> CGPoint {
        return CGPoint.interpolate(rectangle.topLeft, rectangle.bottomRight, 0.5);
    }
    /**
     * EXAMPLE: roundRect(CGRect rect, CGFloat radius)
     */
    static func roundRect(_ rect:CGRect,  _ radius:CGFloat) -> CGMutablePath{
        let path:CGMutablePath = CGMutablePath()
        path.move(to:CGPoint(rect.midX, rect.minY))//was-> CGPathMoveToPoint
        path.addArc(tangent1End: CGPoint(rect.maxX, rect.minY), tangent2End: CGPoint(rect.maxX, rect.maxY), radius: radius)//Swift 3 upgrade, was-> CGPathAddArcToPoint(path, nil, CGRectGetMaxX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMaxY(rect), radius)
        path.addArc(tangent1End: CGPoint(rect.maxX, rect.maxY), tangent2End: CGPoint(rect.minX, rect.maxY), radius: radius)
        path.addArc(tangent1End: CGPoint(rect.minX, rect.maxY), tangent2End: CGPoint(rect.minX, rect.minY), radius: radius)
        path.addArc(tangent1End: CGPoint(rect.minX, rect.minY), tangent2End: CGPoint(rect.maxX, rect.minY), radius: radius)
        path.closeSubpath()
        return path
    }
    /**
     * Create a path using the coordinates of the rect passed in
     */
    static func path(_ rect:CGRect)->CGMutablePath{
        let path:CGMutablePath = CGMutablePath()
        path.move(to:CGPoint(rect.origin.x, rect.origin.y))//was-> CGPathMoveToPoint
        path.addLine(to: CGPoint(rect.origin.x + rect.size.width, rect.origin.y))// ***** Segment 1 *****
        path.addLine(to: CGPoint(rect.origin.x + rect.size.width,rect.origin.y + rect.size.height))// ***** Segment 2 *****
        path.addLine(to: CGPoint( rect.origin.x, rect.origin.y + rect.size.height))// ***** Segment 3 *****
        path.closeSubpath()// ***** Segment 4 created by closing the path *****
        return path
    }
    /**
     * Returns the midPoint of each side in PARAM: rect
     */
    static func sides(_ rect:CGRect) -> [CGPoint] {/*<--Was previously named sidePoints*/
        return [rect.left,rect.right,rect.top,rect.bottom]
    }
    /**
     * Returns an array with Line instances of all sides of a rectangle
     */
    static func sides(_ rectangle:CGRect) -> [Line] {
        return [topSide(rectangle),rightSide(rectangle),bottomSide(rectangle),leftSide(rectangle)]
    }
    static func topSide(_ rectangle:CGRect) -> Line {
        return Line(rectangle.topLeft, CGPoint(rectangle.right.x,rectangle.top.y))
    }
    static func rightSide(_ rectangle:CGRect) -> Line {
        return Line(CGPoint(rectangle.right.x,rectangle.top.y),rectangle.bottomRight)
    }
    static func bottomSide(_ rectangle:CGRect) -> Line {
        return Line(rectangle.bottomRight,CGPoint(rectangle.left.x,rectangle.bottom.y))
    }
    static func leftSide(_ rectangle:CGRect) -> Line {
        return Line(CGPoint(rectangle.left.x,rectangle.bottom.y),rectangle.topLeft)
    }
    /**
     * Returns all the corners in PARAM: rect
     */
    static func corners(_ rect:CGRect) -> [CGPoint] {
        return [rect.topLeft,rect.topRight,rect.bottomLeft,rect.bottomRight]
    }
    /**
     * TODO: maybe get the local rect with the pivot as center?? how does it work, hmmm
     */
    static func localRectangle(_ topLeft:CGPoint,_ bottomRight:CGPoint,_ rotation:CGFloat) -> CGRect {
        let points:[CGPoint] = [topLeft, bottomRight]
        var rotatedPoints:[CGPoint] = CGPointModifier.rotatePoints(points, CGPoint(), -rotation)
        return rectangle(rotatedPoints[0], rotatedPoints[1])
    }
    static func rectangle(_ topLeft:CGPoint, _ bottomRight:CGPoint) -> CGRect{
        let width:CGFloat = CGFloatParser.difference(topLeft.x, bottomRight.x)
        let height:CGFloat = CGFloatParser.difference(topLeft.y, bottomRight.y)
        return CGRect(topLeft.x, topLeft.y, width, height)
    }
    /**
     * TODO: create a similar method for localToGlobal
     * NOTE: This method used to be a modifying method but was remade as a parser, as its easier to use this way (make a duplocate method if mutating is need in the future)
     * EXAMPLE: var localRectangle:CGRect = CGRectParaser.globalToLocal(rectangle1.clone(), view)
     */
    static func globalToLocal(_ globalRectangle:CGRect,_ localView:NSView) -> CGRect {
        var globalRectangle = globalRectangle
        var localRectangle:CGRect = CGRect(0,0,globalRectangle.width,globalRectangle.height)
        let globalToLocalPoint:CGPoint = localView.globalToLocal(globalRectangle.topLeft)
        _ = localRectangle.offsetInPlace(globalToLocalPoint)
        globalRectangle.x = localRectangle.x
        globalRectangle.y = localRectangle.y
        return globalRectangle
    }
}
