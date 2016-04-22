import Cocoa

class Align {
    /**
     * Aligns @param view to @param canvasAlignment and @param viewAlignment within @param canvasSize with a optional @param offset
     * @param view: Layout item you want to manipulate
     * @param canvasSize: Area size  on which you want to align the target to (usually the parent size)
     * @param canvasAlignment: alignment of the target on the canvas
     * @param viewAlignment: alignment of the target within its own canvas
     * @param offset: add additional offset in the x,y axis
     * @example
     * Align.align(someCircle,CGPoint(400,300),Alignment.CENTER,Alignment.TOP_LEFT)//Output: centers a circle within 400x300 rectangle
     * Align.align(someCircle,CGPoint(400,300),Alignment.CENTER_RIGHT,Alignment.CENTER_RIGHT)//Output: aligns the circle to the y axis center and  to the right border of the rectangle but withinn the rectange
     */
    class func align(view:NSView, _ canvasSize:CGPoint, _ canvasAlignment:String = Alignment.topLeft,_ viewAlignment:String = Alignment.topLeft, _ offset:CGPoint = CGPoint()) {
        let alignmentPoint:CGPoint = Align.alignmentPoint(CGPoint(view.width,view.height), canvasSize,canvasAlignment,viewAlignment,offset)
        NSViewModifier.position(view, alignmentPoint)
    }
    /**
     * Returns the point from where to align target @param displayObjectSize within @param canvasSize at @param displayObjectAlignment and @param canvasAlignment and @param offset
     * @param viewSize the size of the displayObject
     * @Note this function is usefull when aligning two or more objects where you can add the size together and find the correct alignment point
     */
    class func alignmentPoint(viewSize:CGPoint, _ canvasSize:CGPoint, _ canvasAlignment:String = Alignment.topLeft,_ viewAlignment:String = Alignment.topLeft, _ offset:CGPoint = CGPoint())->CGPoint {
        var alignmentPoint:CGPoint = Align.point(canvasSize, canvasAlignment)
        let viewAlignmentPoint:CGPoint = Align.point(CGPoint(viewSize.x, viewSize.y), viewAlignment)
        alignmentPoint = alignmentPoint - viewAlignmentPoint
        return alignmentPoint + offset
    }
    /**
    * Returns the pivot point of an object according to what pivotAlignment it has
    * @example // :TODO: write an example
    */
    class func point(size:CGPoint, _ alignment:String) -> CGPoint {
        
        
        
        
        if(alignment == Alignment.TOP_LEFT) return new Point();
        else if(alignment == Alignment.TOP_RIGHT) return  new Point(size.x,0);
        else if(alignment == Alignment.CENTER_CENTER || alignment == Alignment.CENTER) return new Point(Math.round((size.x/2)),Math.round((size.y/2)));
        else if(alignment == Alignment.CENTER_LEFT) return new Point(0,Math.round((size.y/2)));
        else if(alignment == Alignment.TOP_CENTER) return new Point(Math.round((size.x/2)),0);
        else if(alignment == Alignment.CENTER_RIGHT) return new Point(size.x,Math.round((size.y/2)));
        else if(alignment == Alignment.BOTTOM_RIGHT) return new Point(size.x,size.y);
        else if(alignment == Alignment.BOTTOM_LEFT) return new Point(0,size.y);
        else if(alignment == Alignment.BOTTOM_CENTER) return new Point(Math.round((size.x/2)),size.y);
        else throw new IllegalOperationError("No alignment matched the argument: "+alignment);
        return nil;
    }
}
