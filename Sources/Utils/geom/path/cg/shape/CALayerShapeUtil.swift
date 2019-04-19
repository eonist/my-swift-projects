class CGShapeUtil {
	/**
    * Draw line
	 * NOTE: remember to: shapeLayer.addSublayer(lineLayer)
    * It's also possible to do this with UIBezierPath
    * let path:UIBezierPath = {
    *    let aPath = UIBezierPath.init()//cgPath: linePath
    *    aPath.move(to: p1)
    *    aPath.addLine(to: p2)
    *    aPath.close()//Keep using the method addLineToPoint until you get to the one where about to close the path
    *    return aPath
    * }()
    */
    static func drawLine( lineLayer:CAShapeLayer, line:(p1:CGPoint, p2:CGPoint), style:(stroke:UIColor,strokeWidth:CGFloat)) -> CAShapeLayer{
		let lineLayer:CAShapeLayer = .init()
		let path:CGMutablePath = CGMutablePath()
		path.move(to: line.p1)
		path.addLine(to: line.p2)
		lineLayer.path = path/*Setup the CAShapeLayer with the path, colors, and line width*/
		lineLayer.strokeColor = style.stroke.cgColor
		lineLayer.lineWidth = style.strokeWidth
		lineLayer.lineCap = .round
      return lineLayer
	}
   /**
    * polyline
    */
   static func drawPolyLine(points:[CGPoint],style:(fillColor:UIColor?,strokeColor:UIColor?,thickness:CGFloat?)?),close:Bool = false) -> CAShapeLayer{
      let shapeLayer:CAShapeLayer = .init()
		let path:CGMutablePath = CGPathParser.polyline(points.points,close:close)
      shapeLayer.path = path/*Setup the CAShapeLayer with the path, colors, and line width*/
      shapeLayer.strokeColor = style?.strokeColor?.cgColor
      shapeLayer.lineWidth = style?.thickness ?? shapeLayer.lineWidth
      shapeLayer.fillColor = style?.fillColor?.cgColor
      return shapeLayer
   }
   /**
    * Draws a rectange in shapeLayer
    * ## Examples:
    * let rectShape = CGShapeUtil.drawRect(shapeLayer:.init(),.init(x:0,y:0,width:100,height:100),style(nil,.black,14))
    * view.layer.addSublayer(rectShape)
    */
   static func drawRect(shapeLayer:CAShapeLayer, rect:CGRect, style:(fillColor:UIColor?,strokeColor:UIColor?,thickness:CGFloat?)?) -> CAShapeLayer{
      let path:CGMutablePath  = CGMutablePath()
      path.addRect(rect)
      shapeLayer.path = path
      shapeLayer.strokeColor = style?.strokeColor?.cgColor
      shapeLayer.lineWidth = style?.thickness ?? shapeLayer.lineWidth
      shapeLayer.fillColor = style?.fillColor?.cgColor
      return shapeLayer
   }
   /**
    * Draws circle
    * PARAM: progress: 0-1
    */
   static func drawCircle(with circleLayer:CAShapeLayer, circle:Circle, style:Style, progress:CGFloat){
      let circlePath = UIBezierPath(arcCenter: CGPoint(x: circle.center.x, y: circle.center.y), radius:circle.radius, startAngle: CGFloat(Double.pi * -0.5), endAngle: CGFloat(Double.pi * 1.5), clockwise: true)/*The path should be the entire circle, for the strokeEnd and strokeStart to work*/
      circleLayer.path = circlePath.cgPath/*Setup the CAShapeLayer with the path, colors, and line width*/
      circleLayer.fillColor = style.fill.cgColor
      circleLayer.strokeColor = style.stroke.cgColor
      circleLayer.lineWidth = style.strokeWidth
      circleLayer.lineCap = .round
      circleLayer.strokeEnd = progress/*Sets progress of the stroke between predefined start and predefined end*/
   }
   /**
    * Draws circle
    * - PARAM: progress: 0-1
    * ## Examples:
    * let circlePath:BezierPath = .init(ovalIn: rect)//(arcCenter: CGPoint(x: circle.center.x, y: circle.center.y), radius:circle.radius, startAngle: CGFloat(Double.pi * -0.5), endAngle: CGFloat(Double.pi * 1.5), clockwise: true)/*The path should be the entire circle, for the strokeEnd and strokeStart to work*/
    */
   static func drawCircle(with circleLayer:CAShapeLayer, circle:(center:CGPoint,radius:CGFloat), style:Style, progress:CGFloat) -> CAShapeLayer{
      let pt:CGPoint = .init(x: circle.center.x-circle.radius, y: circle.center.y-circle.radius)
      let size:CGSize = .init(width: circle.radius*2, height: circle.radius*2)
      let rect = CGRect.init(origin:pt , size:size )
      return drawCircle(with: circleLayer, rect: rect, style: style, progress: progress)
   }
   /**
   * Draws circle
   * - PARAM: progress: 0-1
   */
  static func drawCircle(with circleLayer:CAShapeLayer, rect:CGRect, style:Style, progress:CGFloat) -> CAShapeLayer{
     circleLayer.path = .init(ellipseIn: rect, transform: nil)/*Setup the CAShapeLayer with the path, colors, and line width*/
     circleLayer.fillColor = style.fill.cgColor
     circleLayer.strokeColor = style.stroke.cgColor
     circleLayer.lineWidth = style.strokeWidth
     circleLayer.lineCap = .round
     circleLayer.strokeEnd = progress/*Sets progress of the stroke between predefined start and predefined end*/
     return circleLayer
  }
   /**
    * Add color to shape
    * - parameter shape: the shape for the fill to be applied to
    * - parameter cgPath: the cgPath to fill inside
    * - parameter fillColor: the color to apply to the shape
    */
   static func fill(shape:CAShapeLayer, cgPath:CGPath, fillColor:UIColor){
      shape.path = cgPath/*Setup the CAShapeLayer with the path, colors, and line width*/
      shape.fillColor = fillColor.cgColor
   }
   typealias Corners = (topLeft:CGFloat,  topRight:CGFloat,  bottomLeft:CGFloat,  bottomRight:CGFloat)
   typealias Style = (fill:Color, stroke:Color, strokeWidth:CGFloat)
   /**
    * Draws rounded rect
    */
   static func drawRoundedRect(layer:CAShapeLayer, rect:CGRect, radius:Corners, style:Style) -> CAShapeLayer{
      let path = roundedRect(rect: rect, radius: radius)
      layer.path = path/*Setup the CAShapeLayer with the path, colors, and line width*/
      layer.fillColor = style.fill.cgColor
      layer.strokeColor = style.stroke.cgColor
      layer.lineWidth = style.strokeWidth
      layer.lineCap = .round
      return layer
   }
}
