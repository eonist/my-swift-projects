import Foundation
/**
 * Creates a circle instance
 * @example <circle cx="30" cy="30" r="20" style="stroke: black; fill: none;" />
 */
class SVGCircle : SVGGraphic{
    var cx : CGFloat;//center x
    var cy : CGFloat;//center y
    var r : CGFloat;
    init(_ cx:CGFloat, _ cy:CGFloat, _ r:CGFloat, _ style : SVGStyle? = nil, _ id : String? = nil) {
      self.cx = cx;
      self.cy = cy;
      self.r = r;
      super.init(style, id);
    }
    /**
    * @Note If the radius is zero, no shape will be displayed; it is an error to provide a negative radius.
    * @Note if the cx or cy is omitted (nan), it is presumed to be zero.
    * @Note it is an error to provide a negative radius.
    */
    override func draw(){
        if(!r.isNaN) {
            /*Fill*/
            let x:CGFloat = (!cx.isNaN ? cx : 0) - r
            let y:CGFloat = (!cy.isNaN ? cy : 0) - r
            let rect:CGRect = CGRect(x, y, r*2, r*2)
            let fillFrame = !style!.stroke.isNaN ?  RectGraphicUtils.fillFrame(rect, style!.strokeWidth, OffsetType(OffsetType.center)) : rect
            fillShape.frame = fillFrame/*,position and set the size of the frame*/
            fillShape.path = CGPathParser.circle(r,r,r)/*<--the path is positioned relative to the frame, remeber the circle is drawn from the center not from 0,0 which is what we want when it concerns the SVGCircle*//*CGPathParser.ellipse(CGRect(0,0,rect.width,rect.height))*/
            /*Line*/
            
            
            //continue here implement the line as the above but with code from the EllispeGraphic. remember to use the circle method no tthe ellipse method
        }
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
extension SVGCircle{
    var center:CGPoint {get{return CGPoint(cx,cy)}set{cx = newValue.x;cy = newValue.y}}
}