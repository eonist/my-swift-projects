import Foundation
/**
 * Creates a circle instance
 * EXAMPLE: <circle cx="30" cy="30" r="20" style="stroke: black; fill: none;" />
 */
class SVGCircle:SVGGraphic{
    var cX:CGFloat/*Center x*/
    var cy:CGFloat/*Center y*/
    var r:CGFloat
    init(_ cx:CGFloat, _ cy:CGFloat, _ r:CGFloat, _ style : SVGStyle? = nil, _ id : String? = nil) {
        self.cX = cx
        self.cy = cy
        self.r = r
        super.init(style, id)
    }
    /**
     * NOTE: If the radius is zero, no shape will be displayed; it is an error to provide a negative radius.
     * NOTE: if the cx or cy is omitted (nan), it is presumed to be zero.
     * NOTE: it is an error to provide a negative radius.
     * NOTE: strokeWidth should always be >= 0 if there is a lineStyle (asserting if there is a linestyle is done by the caller of this method)
     */
    override func draw(){
        if !r.isNaN {
            let x:CGFloat = (!cX.isNaN ? cX : 0) - r
            let y:CGFloat = (!cy.isNaN ? cy : 0) - r
            let rect:CGRect = CGRect(x, y, r*2, r*2)
            if style!.fill != nil {/*Fill*/
                let fillFrame:CGRect = {
                    if (style!.stroke != nil && style!.stroke! is Double && !(style!.stroke! as! Double).isNaN) || style!.stroke != nil && style!.stroke! is SVGGradient  {
                        return  RectGraphicUtils.fillFrame(rect, style!.strokeWidth!, OffsetType(OffsetType.center))
                    }else{
                        return rect
                    }
                }()
                fillShape.frame = fillFrame/*Position and set the size of the frame*/
                fillShape.path = CGPathParser.circle(r,r,r)/*<--the path is positioned relative to the frame, remember the circle is drawn from the center not from 0,0 which is what we want when it concerns the SVGCircle*//*CGPathParser.ellipse(CGRect(0,0,rect.width,rect.height))*/
            }
            if style!.stroke != nil {/*Line, checks if there is a stroke in style*/
                let lineOffsetRect = RectGraphicUtils.lineOffsetRect(rect, style!.strokeWidth!, OffsetType(OffsetType.center))
                lineShape.frame = lineOffsetRect.lineFrameRect
                /*this may not work if the x and y is more than 0,0 etc make sure it works*/
                lineShape.path = CGPathParser.ellipse(lineOffsetRect.lineRect)/*<--why arent we using the circle method here?, well this works aswell*/
            }
        }
    }
    required init(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
extension SVGCircle{
    var center:CGPoint {get{return CGPoint(cX,cy)}set{cX = newValue.x;cy = newValue.y}}
}
