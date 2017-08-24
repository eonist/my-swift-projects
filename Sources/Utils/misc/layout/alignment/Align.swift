import Cocoa
/**
 * IMPORTANT: The align method only supports NSView. But use alignmentPoint instead if you have to work with different class types. As it does the same thing as the align method does
 */
class Align {
    /**
     * Aligns PARAM: view to PARAM: canvasAlignment and PARAM: viewAlignment within PARAM: canvasSize with a optional PARAM offset
     * PARAM: view: Layout item you want to manipulate
     * PARAM: canvasSize: Area size  on which you want to align the target to (usually the parent size)
     * PARAM: canvasAlignment: alignment of the target on the canvas
     * PARAM: viewAlignment: alignment of the target within its own canvas
     * PARAM: offset: add additional offset in the x,y axis
     * EXAMPLE:
     * Align.align(someCircle,CGPoint(400,300),Alignment.CENTER,Alignment.TOP_LEFT)//Output: centers a circle within 400x300 rectangle
     * Align.align(someCircle,CGPoint(400,300),Alignment.CENTER_RIGHT,Alignment.CENTER_RIGHT)//Output: aligns the circle to the y axis center and  to the right border of the rectangle but withinn the rectange
     */
    static func align(_ view:NSView, _ canvasSize:CGSize, _ canvasAlignment:String = Alignment.topLeft,_ viewAlignment:String = Alignment.topLeft, _ offset:CGPoint = CGPoint()) {
        let alignmentPoint:CGPoint = Align.alignmentPoint(CGSize(view.w, view.h), canvasSize, canvasAlignment, viewAlignment, offset)
        view.frame.origin = alignmentPoint
    }
    /**
     * Returns the point from where to align target PARAM: objectSize within PARAM: canvasSize at PARAM: objectAlignment and PARAM: canvasAlignment and PARAM: offset
     * PARAM: objectSize the size of the object that is being aligned
     * PARAM: canvasSize is the size of the canvas the object is beeing aligned to (Thinkn of the canvas as a painting and the object as an element in that painting, figurativly speaking)
     * NOTE: this function is usefull when aligning two or more objects where you can add the size together and find the correct alignment point
     */
    static func alignmentPoint(_ objectSize:CGSize, _ canvasSize:CGSize, _ canvasAlignment:String = Alignment.topLeft,_ objectAlignment:String = Alignment.topLeft, _ offset:CGPoint = CGPoint())->CGPoint {
        let canvasP:CGPoint = Align.point(canvasSize, canvasAlignment)
        let objP:CGPoint = Align.point(objectSize, objectAlignment)
        let p = canvasP - objP
        return p + offset
    }
    /**
     * Returns the pivot point of an object according to what pivotAlignment it has
     * EXAMPLE: write an example
     */
    static func point(_ size:CGSize, _ alignment:String) -> CGPoint {
        switch alignment{
            case Alignment.topLeft:return CGPoint()
            case Alignment.topRight:return CGPoint(size.width,0)
            case Alignment.centerCenter, Alignment.center:return CGPoint(round((size.width/2)),round((size.height/2)))
            case Alignment.centerLeft: return CGPoint(0,round((size.height/2)))
            case Alignment.topCenter: return CGPoint(round((size.width/2)),0)
            case Alignment.centerRight: return CGPoint(size.width,round((size.height/2)))
            case Alignment.bottomRight: return CGPoint(size.width,size.height)
            case Alignment.bottomLeft: return CGPoint(0,size.height)
            case Alignment.bottomCenter: return CGPoint(round((size.width/2)),size.height)
            default:fatalError("No alignment matched the argument:" + "\(alignment)")
        }
    }
}
extension Align{
    /**
     * Aligns an array of view instances (batch align)
     * NOTE: alt names: alignMany? or alignAll?
     */
    static func align(_ views:[NSView], _ canvasSize:CGSize, _ canvasAlignment:String = Alignment.topLeft,_ viewAlignment:String = Alignment.topLeft, _ offset:CGPoint = CGPoint()) {
        views.forEach{ view in Align.align(view, canvasSize,canvasAlignment,viewAlignment,offset)}
    }
}
