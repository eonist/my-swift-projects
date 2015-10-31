import Cocoa
class CGContextModifier{
    /**
    * Note: the float, cgfloat stuff can be cleaned up to only use cg float if ever used.
    */
   class func addStar(context:CGContextRef,_ center:CGPoint, _ radius:Float, _ angle:Float){
        let x:Float  = radius * sinf(angle * Float(M_PI) / 5.0) + Float(center.x)
    
        let y:Float  = radius * cosf(angle * Float(M_PI) / 5.0) + Float(center.y)
    
		CGContextMoveToPoint(context, CGFloat(x), CGFloat(y))
		for(var i:Int = 1; i < 5; ++i){
			let x:Float = radius * sinf((Float(i) * 4.0 * Float(M_PI) + angle) / 5.0) + Float(center.x);
			let y:Float = radius * cosf((Float(i) * 4.0 * Float(M_PI) + angle) / 5.0) + Float(center.y);
			CGContextAddLineToPoint(context, CGFloat(x), CGFloat(y))
		}
		CGContextClosePath(context)// And close the subpath.
   }
	/**
    * Bulk call to stroke a sequence of line segments.
    * Note: Stroke a sequence of line segments one after another in `context'. Theline segments are specified by `points', an array of `count' CGPoints.This function is equivalent to
	 * Note: // Equivalent to for(i=0; i<count; i+=2) { MoveToPoint(point[i]); AddLineToPoint(point[i+1]); StrokePath(); }
	 * Example: [CGPointMake(10.0, 150.0),CGPointMake(70.0, 120.0),CGPointMake(130.0, 150.0), CGPointMake(190.0, 120.0), CGPointMake(250.0, 150.0), CGPointMake(310.0, 120.0)]
    */
   class func addLine(context:CGContextRef, _ points:Array<CGPoint>){
		CGContextStrokeLineSegments(context, points, points.count);
		//unsure if you need to close it here
    }
    /**
     *
     */
    class func drawWithWidth(/*stroke: (CGFloat) width color: (UIColor *) color*/){
        /*
        CGContextRef context = UIGraphicsGetCurrentContext();
        if (context == NULL){
            NSLog(@"Error: No context to draw to");
            return; }
        CGContextSaveGState(context);
        // Set the color
        if (color) [color setStroke];
        // Store the width
        CGFloat holdWidth = self.lineWidth; self.lineWidth = width;
        // Draw
        [self stroke];
        // Restore the width self.lineWidth = holdWidth; CGContextRestoreGState(context);
        */
    }
    /**
     * Fill with supplied color
     */
    class func drawWithFill(/*fill:UIColor*/){
            /*
            CGContextRef context = UIGraphicsGetCurrentContext();
            if (context == NULL){
                NSLog(@"Error: No context to draw to");
                return;
            }
            CGContextSaveGState(context);
            [fillColor set];
            [self fill]; CGContextRestoreGState(context);
            }
            */
    }
    
    /**
     * IMPORTANT: i think Quartz has a similar method now built in. but nice to have around, untill you bring in better code
     * Note: The routine addRoundedRectToPath first makes sure that neither the oval width or the oval height is zero. If either is zero, the code simply adds the rectangle to the current path. For the case where the oval width and oval height are both
     * Example:
     CGRect rect = {{10., 10.}, {210., 150.}};
     float ovalWidth = 100., ovalHeight = 100.; CGContextSetLineWidth(context, 2.); CGContextBeginPath(context);
     addRoundedRectToPath(context, rect, ovalWidth, ovalHeight); CGContextSetRGBStrokeColor(context, 1., 0., 0., 1.); CGContextDrawPath(context, kCGPathStroke);
     */
    class func addRoundedRectToPath(context:CGContextRef ,  rect:CGRect,  ovalWidth:Float,  ovalHeight:Float){
        /*
                float fw, fh
                // If either ovalWidth or ovalHeight is 0, add a regular rectangle. if (ovalWidth == 0 || ovalHeight == 0) {
                CGContextAddRect(context, rect);
    }else{
    CGContextSaveGState(context);
    // Translate to lower-left corner of rectangle. CGContextTranslateCTM(context, CGRectGetMinX(rect),
    CGRectGetMinY(rect));
    // Scale by the oval width and height so that
    // each rounded corner is 0.5 units in radius. CGContextScaleCTM(context, ovalWidth, ovalHeight);
    // Unscale the rectangle width by the amount of the x scaling.
    fw = CGRectGetWidth(rect) / ovalWidth;
    // Unscale the rectangle height by the amount of the y scaling.
    fh = CGRectGetHeight(rect) / ovalHeight;
    // Start at the right edge of the rectangle, at the midpoint in Y. CGContextMoveToPoint(context, fw, fh/2);
    // ***** Segment 1 *****
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 0.5);
    // ***** Segment 2 *****
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 0.5);
    // ***** Segment 3 *****
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 0.5);
    // ***** Segment 4 *****
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 0.5);
    // Closing the path adds the last segment. CGContextClosePath(context);
    CGContextRestoreGState(context);
    } }
    */
    }
}
