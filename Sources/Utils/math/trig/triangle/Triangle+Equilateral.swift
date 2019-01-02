import Foundation

class TriangleMath {
	/**
    * Returns the adjcent length in a right-angled triangle
    * NOTE: the sides in a rightangled triangle is called: Hypotenuse, opposite, and adjacent
    * NOTE: for non 60-30-90 triangles, you can use: adj = opposite / tan(Θ) ref: https://math.stackexchange.com/questions/1116018/find-adjacent-only-knowing-angle-and-opposite
    */
   static func adjacent(opposite:CGFloat) -> CGFloat{
      return TriangleMath.aABTob(opposite, 60, 30)
   }
   /**
    * Creates an equal sided triangle (equilateral triangle)
    * EXAMPLE:
    * let triangle = TriangleMath.equilateralTriangle(height: 100)
    * let points:[CGPoint] = [triangle.a,triangle.b,triangle.c]
    * let cgPath = CGPathParser.polyLine(points:points, close: true)
    * let shapeLayer:CAShapeLayer = .init()
    * CGPathModifier.fill(shape: shapeLayer, cgPath: cgPath, fillColor: .green)
    * self.view.layer.addSublayer(shapeLayer)
    */
   static func equilateralTriangle(height:CGFloat) -> (a:CGPoint,b:CGPoint,c:CGPoint) {
      let adjacentSide = TriangleMath.adjacent(opposite: 100)
      let hypotenuseSide = adjacentSide * 2
//      let polarPT = TriangleMath.polar(hypotenuseSide, ㎭ * 60)
      let a = CGPoint.init(x: 0, y: height)
      let b = CGPoint.init(x: adjacentSide, y: 0)
      let c = CGPoint.init(x: hypotenuseSide, y: height)
      return (a,b,c)
   }
}
