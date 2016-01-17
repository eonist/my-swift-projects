import Foundation
/*
 *Creates a rectangle instance
 * @example <rect x="64" y="64" fill="none" stroke="#000000" stroke-miterlimit="10" width="512" height="512"/>
 * // :TODO: possibly replace the subclassing with decoration!?!
 */
class SVGRect : SVGGraphic {
    var width : CGFloat
    var height : CGFloat
    var x:CGFloat
    var y : CGFloat
    var rx : CGFloat/*for round rect, radius*/
    var ry : CGFloat/*for round rect, radius*/
    /**
     * @param fill (is of type Number so that we can test for NaN when parsing to svg xml)
     */
    init(_ width:CGFloat,_ height:CGFloat,_ x:CGFloat,_ y:CGFloat,_ rx:CGFloat,_ ry:CGFloat, _ style:SVGStyle,_ id:String) {
        Swift.print("SVGRect.init()" + "\(width)" + " height: " + "\(height)")
        Swift.print("x: " + "\(x)")
        Swift.print("y: " + "\(y)")
        self.width = width;
        self.height = height;
        self.x = x;
        self.y = y;
        self.rx = rx;
        self.ry = ry;
        super.init(style,id);
    }
    /**
     * @Note If you do not specify a starting x or y value, it is presumed to be zero. 
     * @Note If you specify a width or height of zero, then the rectangle is not displayed. 
     * @Note It is an error to provide negative values for either width or height.
     * @Note If you specify only one of rx or ry, they are presumed to be equal.
     * @Note The maximum number you may specify for rx (the x-radius) is one-half the width of the rectangle; the maximum value of ry (the y-radius) is one-half the height of the rectangle.
     * // :TODO: The maximum number you may specify for rx (the x-radius) is one-half the width of the rectangle; the maximum value of ry (the y-radius) is one-half the height of the rectangle. 
     */
    override func draw() {
        //Swift.print("SVGRect.draw() width: " + "\(self.width)" + "height:" + "\(self.height)")
        if(width <= 0 && height <= 0) {/*None*/
            return
        }
        if((rx.isNaN) && (ry.isNaN) ) {/*Rect*/
            //TODO: you need to check to see if line is needed before you draw the fill path
            
            let rect:CGRect = CGRect(!self.x.isNaN ? self.x : 0, !self.y.isNaN ? self.y : 0, self.width, self.height);//we have to do this here since there is no hard ref to self in memory yet. 
            Swift.print("rect: " + "\(rect)")
            /*Fill*/
            fillShape.path = CGRect(0,0,width,height).path/*<--positioned relative to the frame*/
            let fillFrame = (style!.stroke is Double && !(style!.stroke as! Double).isNaN) || style!.stroke is SVGGradient ?  RectGraphicUtils.fillFrame(rect, style!.strokeWidth, OffsetType(OffsetType.center)) : rect
            Swift.print("fillFrame: " + "\(fillFrame)")
            //TODO: you can set the frame to the rect, no need for the fancy frame creation method
            fillShape.frame = fillFrame/*,position and set the size of the frame*/
            
            //TODO: you need to check to see if line is needed before you draw the line path
            
            /*line*/
            let lineOffsetRect = RectGraphicUtils.lineOffsetRect(rect, style!.strokeWidth, OffsetType(OffsetType.center))
            Swift.print("lineOffsetRect: " + "\(lineOffsetRect)")
            lineShape.frame = lineOffsetRect.lineFrameRect
            lineShape.path = lineOffsetRect.lineRect.path
        }
        else {/*RoundRect*/
            fatalError("RoundRect Not implemented yet")
            //GraphicsModifier.drawRoundRect(graphics, SVGRectParser.rectangle(this), !isNaN(_rx) ? _rx : _ry, !isNaN(_ry) ? _ry : _rx)
        }
    }
    func setSize(width:CGFloat,height:CGFloat) {
      self.width = width;
      self.height = height;
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}



/**
 * Convenience
 */
extension SVGRect{
    var position:CGPoint {get{return CGPoint(x,y)}set {x = newValue.x;y = newValue.y}}
    var size:CGSize {get{return CGSize(width,height)}set {width = newValue.width;height = newValue.height}}
}


