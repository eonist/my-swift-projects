import Cocoa

class NSBezierPathParser {
    /**
     * untest
     */
    static func cgPath(_ nsBezierPath:NSBezierPath)->CGPath?{
        if nsBezierPath.elementCount == 0 {
            return nil
        }
        let path = CGMutablePath()
        var didClosePath = false
        for i in 0...nsBezierPath.elementCount-1 {//TODO: ⚠️️ why isn't this: 0..<.elementCount?
            var points = [NSPoint](repeating: NSZeroPoint, count: 3)
            switch nsBezierPath.element(at: i, associatedPoints: &points) {
                case .moveToBezierPathElement:path.move(to:points[0])//swift 3 updated
                case .lineToBezierPathElement:path.addLine(to: points[0])
                case .curveToBezierPathElement:path.addCurve(to: points[2], control1: points[0], control2: points[1])
                case .closePathBezierPathElement:path.closeSubpath()
                didClosePath = true;
            }
        }
        if !didClosePath {
            path.closeSubpath()
        }
        return path.copy()
    }
}
