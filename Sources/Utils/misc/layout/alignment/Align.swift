import Foundation
/**
 * Align is a util class to help align views and graphics. The core principle is based around a stage-pivot and an object pivot. The align type you add to these two pivot deterimins the final position of the object
 * NOTE: The align method only supports NSView/UIView. But use alignmentPoint instead if you have to work with different class types. As it does the same thing as the align method does
 */
class Align{
    /**
     * Aligns PARAM: view to PARAM: canvasAlignment and PARAM: viewAlignment within PARAM: canvasSize with a optional PARAM offset
     * PARAM: view: Layout item you want to manipulate
     * PARAM: canvasSize: Area size  on which you want to align the target to (usually the parent size)
     * PARAM: canvasAlignment: alignment of the target on the canvas
     * PARAM: viewAlignment: alignment of the target within its own canvas
     * PARAM: offset: add additional offset in the x,y axis
     * EXAMPLE:
     * Align.align(someCircle,CGSize(400,300),.center,.topLeft)//Output: centers a circle within 400x300 rectangle
     * Align.align(someCircle,CGSize(400,300),.centerRight,.centerRight)//Output: aligns the circle to the y axis center and  to the right border of the rectangle but withinn the rectange
     */
    static func align(_ view:ViewType,  canvasSize:CGSize,  canvasAlign:Alignment , viewAlign:Alignment ,  offset:CGPoint = CGPoint()) {
        let alignmentPoint:CGPoint = Align.alignmentPoint(CGSize(view.frame.width, view.frame.height), canvasSize: canvasSize, canvasAlign: canvasAlign, objectAlign: viewAlign, offset: offset)
        view.frame.origin = alignmentPoint
    }
    /**
     * Returns the point from where to align target PARAM: objectSize within PARAM: canvasSize at PARAM: objectAlignment and PARAM: canvasAlignment and PARAM: offset
     * PARAM: objectSize the size of the object that is being aligned
     * PARAM: canvasSize is the size of the canvas the object is beeing aligned to (Thinkn of the canvas as a painting and the object as an element in that painting, figurativly speaking)
     * NOTE: this function is usefull when aligning two or more objects where you can add the size together and find the correct alignment point
     */
    static func alignmentPoint(_ objectSize:CGSize, canvasSize:CGSize, canvasAlign:Alignment , objectAlign:Alignment ,  offset:CGPoint = CGPoint())->CGPoint {
        let canvasP:CGPoint = Align.point(canvasSize, align: canvasAlign)
        let objP:CGPoint = Align.point(objectSize, align: objectAlign)
        let p = canvasP - objP
        return p + offset
    }
    /**
     * Returns the pivot point of an object according to what pivotAlignment it has
     * EXAMPLE: write an example
     */
    static func point(_ size:CGSize, align:Alignment) -> CGPoint {
        switch align{
        case .topLeft:return CGPoint()
        case .topRight:return CGPoint(size.width,0)
        case .centerCenter:return CGPoint(round((size.width/2)),round((size.height/2)))
        case .centerLeft: return CGPoint(0,round((size.height/2)))
        case .topCenter: return CGPoint(round((size.width/2)),0)
        case .centerRight: return CGPoint(size.width,round((size.height/2)))
        case .bottomRight: return CGPoint(size.width,size.height)
        case .bottomLeft: return CGPoint(0,size.height)
        case .bottomCenter: return CGPoint(round((size.width/2)),size.height)
        }
    }
}
extension Align{
    /**
     * Aligns an array of view instances (batch align)
     * NOTE: alt names: alignMany? or alignAll?
     */
    static func align(_ views:[ViewType], canvasSize:CGSize, canvasAlign:Alignment , viewAlign:Alignment , offset:CGPoint = CGPoint()) {
        views.forEach{ view in Align.align(view, canvasSize: canvasSize, canvasAlign: canvasAlign, viewAlign: viewAlign, offset: offset)}
    }
}
