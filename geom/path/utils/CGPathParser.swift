import Foundation
import AppKit/*Needed for the NSBezierPath type*/

public class CGPathParser{
    /**
     * Returns a path with straight lines derived from an array of points (think follow the dots)
     * TODO: shouldnt this path be closed by a real close call?
     * NOTE: effectivly it creates a PolyLine
     */
    class func lines(points:Array<CGPoint>,_ close:Bool = false,_ offset:CGPoint = CGPoint(0,0))->CGMutablePathRef{
        let path:CGMutablePathRef = CGPathCreateMutable()
        if(points.count > 0) { CGPathMoveToPoint(path, nil, points[0].x+offset.x, points[0].y+offset.y)}
        for (var i : Int = 1; i < points.count; i++) {
            //Swift.print("LineTo: x: " + "\(points[i].x+offset.x)" + " y: " + "\(points[i].y+offset.y)")
            CGPathAddLineToPoint(path,nil,points[i].x+offset.x, points[i].y+offset.y)
        }
        if(close){
            //Swift.print("close")
            CGPathAddLineToPoint(path,nil,points[0].x+offset.x, points[0].y+offset.y);/*closes it self to the start position*/
            CGPathCloseSubpath(path)/*it may not be necessary to have the above line when you call this method*/
        }
        return path
    }
    /**
     * NOTE: We do not need to close this path
     */
    public class func line(p1:CGPoint,_ p2:CGPoint)->CGMutablePathRef{
        let linePath:CGMutablePathRef = CGPathCreateMutable()
        CGPathMoveToPoint(linePath, nil, p1.x, p1.y)
        CGPathAddLineToPoint(linePath, nil, p2.x, p2.y)
        return linePath
    }
	/**
     * EXAMPLE: CGContextAddPath(context, CircleParser.circlePath(0,0,100))
     * PARAM: x is the center x
     * PARAM: y is the center y
     * IMPORTANT: circle is drawn from center position
     * Note: you may add convenience methods for drawing circles from the topLeft position later
     */
    public class func circle(radius:CGFloat, _ cx:CGFloat = 0, _ cy:CGFloat = 0)->CGMutablePathRef{
        let circlePath:CGMutablePathRef = CGPathCreateMutable()
        let circleCenter:CGPoint = CGPoint(x: cx, y: cy);
        let circleRadius:CGFloat  = radius;
        let startingAngle:CGFloat  = 0.0, endingAngle = CGFloat(2 * M_PI);
        // Construct the circle path counterclockwise.
        CGPathAddArc(circlePath,nil,circleCenter.x, circleCenter.y, circleRadius,startingAngle, endingAngle, false)
        CGPathCloseSubpath(circlePath);
        return circlePath
    }
    /**
     * Returns a circle path from top left
     */
    public class func circ(radius:CGFloat, _ x:CGFloat = 0, _ y:CGFloat = 0)->CGMutablePathRef{
        return ellipse(radius*2, radius*2, x, x)
    }
    /**
     *
     */
    public class func rect(w:CGFloat = 100,_ h:CGFloat = 100, _ x:CGFloat = 0,_ y:CGFloat = 0)->CGMutablePathRef{
        let rectPath:CGMutablePathRef  = CGPathCreateMutable();
        let rectangle:CGRect = CGRectMake(x, y,w, h);/* Here are our rectangle boundaries */
        CGPathAddRect(rectPath, nil/*<-Transformation*/, rectangle);/* Add the rectangle to the path */
        //CGPathCloseSubpath(rectPath)
        return rectPath
    }

    /**
     * EXAMPLE: CGPathParser.ellipse(100,200)
     * IMPORTANT: ellipse is drawn from top left position
     * Note: you may add convenience methods for drawing ellipses from the center later
     * TODO: add support for transformation
     */
    public class func ellipse(w:CGFloat = 100,_ h:CGFloat = 100,_ x:CGFloat = 0,_ y:CGFloat = 0, _ transformation:CGAffineTransform? = nil)->CGMutablePathRef{
        let ellipsePath:CGMutablePathRef  = CGPathCreateMutable();
        let rect:CGRect = CGRectMake(x, y,w, h)
        CGPathAddEllipseInRect(ellipsePath, nil/*transformation*/, rect)
        return ellipsePath
    }
    /**
     * EXAMPLE: roundRect(5,100,100)
     * TODO:  Draws a rounded rectangle using the size of individual x and y radii to draw the rounded corners.: drawRoundRectComplex2(x:Number, y:Number, width:Number, height:Number, radiusX:Number, radiusY:Number, topLeftRadiusX:Number, topLeftRadiusY:Number, topRightRadiusX:Number, topRightRadiusY:Number, bottomLeftRadiusX:Number, bottomLeftRadiusY:Number, bottomRightRadiusX:Number, bottomRightRadiusY:Number):void you have the code for this somewhere
     * NOTE: was: //radius:CGFloat = 10, _ w:CGFloat = 100,_ h:CGFloat = 100, _ x:CGFloat = 0,_ y:CGFloat = 0
     * NOTE: you can also use: CGPathCreateWithRoundedRect() and CGPathAddRoundedRect()
     */
    public class func roundRect(x:CGFloat, _ y:CGFloat, _ w:CGFloat, _ h:CGFloat, _ topLeftRadius:CGFloat, _ topRightRadius:CGFloat, _ bottomLeftRadius:CGFloat, _ bottomRightRadius:CGFloat) -> CGMutablePathRef{
        let rect:CGRect = CGRectMake(x,y,w,h)
        let path:CGMutablePathRef = CGPathCreateMutable();
        CGPathMoveToPoint(path, nil, CGRectGetMidX(rect), CGRectGetMinY(rect));
        CGPathAddArcToPoint(path, nil, CGRectGetMaxX(rect), CGRectGetMinY(rect), CGRectGetMaxX(rect), CGRectGetMaxY(rect), topRightRadius);//TR
        CGPathAddArcToPoint(path, nil, CGRectGetMaxX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMaxY(rect), bottomRightRadius);
        CGPathAddArcToPoint(path, nil, CGRectGetMinX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMinY(rect), bottomLeftRadius);
        CGPathAddArcToPoint(path, nil, CGRectGetMinX(rect), CGRectGetMinY(rect), CGRectGetMaxX(rect), CGRectGetMinY(rect), topLeftRadius);
        CGPathCloseSubpath(path);
        return path;
    }
    /**
     * Untested
     */
    class func nsBezierPath(path:CGPath)->NSBezierPath?{
        //see examples for this on stackoverflow
        return nil
    }
    /**
     * Returns the boundingBox for the stroke in (the returned CGRect is in 0,0 space)
     * TODO: Move this method somewhere else?
     */
    class func boundingBox(path:CGPath,_ lineStyle:ILineStyle)->CGRect{
        let outlinePath:CGPath? = CGPathCreateCopyByStrokingPath(path, nil, lineStyle.thickness, lineStyle.lineCap, lineStyle.lineJoin, lineStyle.miterLimit)
        Swift.print("outlinePath: " + "\(outlinePath)")
        let boundingBox:CGRect = CGPathGetPathBoundingBox(outlinePath)/*there is also CGPathGetBoundingBox, which works a bit different, the difference is probably just support for cruves etc*/
        return boundingBox
    }
}
extension CGPathParser{
    /**
     * Convenince method
     */
    class func ellipse(rect:CGRect)->CGMutablePathRef{
        return ellipse(rect.width, rect.height, rect.x, rect.y)
    }
    /**
     * Draws an ellipse from the center
     */
    class func ellipse(center:CGPoint,_ size:CGSize)->CGMutablePathRef{
        return ellipse(size.width, size.height, center.x-(size.width/2), center.y-(size.height/2))
    }
    /**
     * Draws an ellipse from the center
     */
    class func roundRect(rect:CGRect,_ fillet:Fillet)->CGMutablePathRef{
        return roundRect(rect.x, rect.y, rect.width, rect.height, fillet.topLeft, fillet.topRight, fillet.bottomLeft, fillet.bottomRight)
    }
    /**
     * RoundRect with only w and h of all 4 corners (SVG uses this method)
     */
    class func roundRect(rect:CGRect,_ cornerheight:CGFloat,_ cornerWidth:CGFloat)->CGMutablePathRef{
        let path:CGMutablePathRef = CGPathCreateMutable();
        CGPathAddRoundedRect(path, nil, rect, cornerheight, cornerWidth)
        return path
    }
}