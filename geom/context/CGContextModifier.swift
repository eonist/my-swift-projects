import Foundation
/*
* CGContextGetClipBoundingBox(context) - Returns the clipping area of the context
* CGContextGetPathBoundingBox(context) - havent got this to work yet, may only work for paths created by the context not paths you add? or open paths or or?
* CGContextGetTypeID() - the context id?
*/
public class CGContextModifier{
    /**
     * Clears the CGContext
     * EXAMPLE: CGContextModifier.clear(context,self.bounds)
     _ Note: there is also: CGTextDrawingMode.Invisible
     * self.view.clearsContextBeforeDrawing = YES;
     * a call to setNeedsDisplay may work
     * creating a zero width and height rect and clipping it, then drawing on to of that and then making a new clip. try chaing clip a few times to see this idea in effect
     */
    public class func clear(context:CGContext,_ bounds:NSRect){
        CGContextClearRect(context, bounds)
    }
}