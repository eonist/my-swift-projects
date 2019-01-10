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
    static func drawLine(_ lineLayer:CAShapeLayer, line:(p1:CGPoint, p2:CGPoint), style:(stroke:UIColor,strokeWidth:CGFloat)) -> CAShapeLayer{
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
    * Add color to shape
    * - parameter shape: the shape for the fill to be applied to
    * - parameter cgPath: the cgPath to fill inside
    * - parameter fillColor: the color to apply to the shape
    */
   static func fill(shape:CAShapeLayer, cgPath:CGPath, fillColor:UIColor){
      shape.path = cgPath/*Setup the CAShapeLayer with the path, colors, and line width*/
      shape.fillColor = fillColor.cgColor
   }
}
