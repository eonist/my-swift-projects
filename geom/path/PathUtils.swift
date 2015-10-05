extension UIBezierPath {
    convenience init(triangleSideLength: CGFloat, origin: CGPoint) {
        self.init()
        let squareRoot = CGFloat(sqrt(3.0))
        let altitude = (squareRoot * triangleSideLength) / 2
        moveToPoint(origin)
        addLineToPoint(CGPoint(x: origin.x + triangleSideLength, y: origin.y))
        addLineToPoint(CGPoint(x: origin.x + triangleSideLength / 2, y: origin.y + altitude))
        closePath()
    }
}