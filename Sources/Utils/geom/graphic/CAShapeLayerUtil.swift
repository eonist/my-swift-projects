class CAShapeLayerUtil {
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
}
