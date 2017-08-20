import Foundation
/*
 * Creates a rectangle instance (with support for rounded corners)
 * EXAMPLE: <rect x="64" y="64" fill="none" stroke="#000000" stroke-miterlimit="10" width="512" height="512"/>
 */
class SVGRect:SVGGraphic {
    var rect:CGRect
    var radius:CGPoint/*for round rect, radius*/
    /**
     * PARAM: fill (is of type Number so that we can test for NaN when parsing to svg xml)
     */
    init(_ width:CGFloat,_ height:CGFloat,_ x:CGFloat,_ y:CGFloat,_ rx:CGFloat,_ ry:CGFloat, _ style:SVGStyle,_ id:String) {
        self.rect = CGRect(x,y,width,height)
        self.radius = CGPoint(rx,ry)
        super.init(style,id)
    }
    /**
     * NOTE: If you do not specify a starting x or y value, it is presumed to be zero. 
     * NOTE: If you specify a width or height of zero, then the rectangle is not displayed. 
     * NOTE: It is an error to provide negative values for either width or height.
     * NOTE: If you specify only one of rx or ry, they are presumed to be equal.
     * NOTE: The maximum number you may specify for rx (the x-radius) is one-half the width of the rectangle; the maximum value of ry (the y-radius) is one-half the height of the rectangle.
     * TODO: ⚠️️ The maximum number you may specify for rx (the x-rad@objc @objc ius) is one-half the width of the rectangle; the maximum value of ry (the y-radius) is one-half the height of the rectangle.
     * TODO: ⚠️️ You can set the frame to the rect, no need for the fancy frame creation method
     */
    override func draw() {
        guard self.rect.w > 0 && self.rect.h > 0 else{return}/*None*/
        let rect:CGRect = CGRect(!self.rect.x.isNaN ? self.rect.x : 0, !self.rect.y.isNaN ? self.rect.y : 0, self.rect.width, self.rect.height);//we have to do this here since there is no hard ref to self in memory yet.
        guard let style = style else {fatalError("Style not available")}
        if style.fill != nil  {/*Fill*/
            fillShape.path = {
                if radius.x.isNaN && radius.y.isNaN {
                    return CGRect(0,0,rect.w,rect.h).path
                }else{
                    return CGPathParser.roundRect(CGRect(0,0,self.rect.w,self.rect.h), !radius.x.isNaN ? radius.x : radius.y, !radius.y.isNaN ? radius.y : radius.x)/*<--positioned relative to the frame*/
                }
            }()
            fillShape.frame = {/*position and set the size of the frame*/
                let caseA = style.stroke != nil && style.stroke! is Double && !(style.stroke! as! Double).isNaN
                let caseB = style.stroke != nil && style.stroke! is SVGGradient
                if caseA || caseB {
                    return RectGraphicUtils.fillFrame(rect, style.strokeWidth!, OffsetType(OffsetType.center))
                }else {
                    return rect
                }
            }()
        }
        if style.stroke != nil {/*Line,checks if there is a stroke in style*/
            let lineOffsetRect = RectGraphicUtils.lineOffsetRect(rect, style.strokeWidth!, OffsetType(OffsetType.center))
            lineShape.frame = lineOffsetRect.lineFrameRect
            lineShape.path = {
                if radius.x.isNaN && radius.y.isNaN {
                    return lineOffsetRect.lineRect.path
                }else {
                    return CGPathParser.roundRect(lineOffsetRect.lineRect, !radius.x.isNaN ? radius.x : radius.y, !radius.y.isNaN ? radius.y : radius.x)/*<--positioned relative to the frame*/
                }
            }()
        }
    }
    func setSize(_ width:CGFloat,_ height:CGFloat) {
        self.rect.w = width
        self.rect.h = height
    }
    required init(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
