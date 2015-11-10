import Foundation

import AppKit

public class CGPathParser{
	/**
     * EXAMPLE: CGContextAddPath(context, CircleParser.circlePath(0,0,100))
     * PARAM: x is the center x
     * PARAM: y is the center y
     * IMPORTANT: circle is drawn from center position
     * Note: you may add convenience methods for drawing circles from the topLeft position later
     */
    public class func circle(radius:CGFloat, _ x:CGFloat = 0, _ y:CGFloat = 0)->CGMutablePathRef{
        let circlePath:CGMutablePathRef = CGPathCreateMutable()
        let circleCenter:CGPoint = CGPoint(x: x, y: x);
        let circleRadius:CGFloat  = radius;
        let startingAngle:CGFloat  = 0.0, endingAngle = CGFloat(2 * M_PI);
        // Construct the circle path counterclockwise.
        CGPathAddArc(circlePath,nil,circleCenter.x, circleCenter.y, circleRadius,
            startingAngle, endingAngle, false)
        return circlePath
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
     */
    public class func ellipse(w:CGFloat = 100,_ h:CGFloat = 100,_ x:CGFloat = 0,_ y:CGFloat = 0)->CGMutablePathRef{
        let ellipsePath:CGMutablePathRef  = CGPathCreateMutable();
        let rect:CGRect = CGRectMake(x, y,w, h)
        CGPathAddEllipseInRect(ellipsePath, nil,/*<-Transformation*/ rect)
        return ellipsePath
    }
    /**
     * EXAMPLE: roundRect(5,100,100)
     * TODO:  Draws a rounded rectangle using the size of individual x and y radii to draw the rounded corners.: drawRoundRectComplex2(x:Number, y:Number, width:Number, height:Number, radiusX:Number, radiusY:Number, topLeftRadiusX:Number, topLeftRadiusY:Number, topRightRadiusX:Number, topRightRadiusY:Number, bottomLeftRadiusX:Number, bottomLeftRadiusY:Number, bottomRightRadiusX:Number, bottomRightRadiusY:Number):void
     */
    //x, y, graphic.width, graphic.height, _fillet.topLeft, _fillet.topRight, _fillet.bottomLeft, _fillet.bottomRight
    //radius:CGFloat = 10, _ w:CGFloat = 100,_ h:CGFloat = 100, _ x:CGFloat = 0,_ y:CGFloat = 0
    public class func roundRect(x, y, width, height, _fillet.topLeft, _fillet.topRight, _fillet.bottomLeft, _fillet.bottomRight) ->CGMutablePathRef{
        let rect:CGRect = CGRectMake(x,y,w,h)
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
    * Untested
    */
    class func nsBezierPath(path:CGPath)->NSBezierPath?{
        //see reseach for this CGPathTest.swift
        return nil
    }
    
}