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
     *
     */
    class func addRoundedRectToPath(context:CGContextRef ,  rect:CGRect,  ovalWidth:Float,  ovalHeight:Float){
        float fw, fh
    }
}
