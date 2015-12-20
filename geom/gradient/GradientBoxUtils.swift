import Foundation

class GradientBoxUtils{
    /**
     * Returns the start and end of a linear gradient (that fills an exact rectangle at any angle)
     */
    class func points(rect:CGRect, var angle:CGFloat)->(start:CGPoint,end:CGPoint){
        angle = Trig.normalize2(angle)
        var cornerPoint:CGPoint = CGPoint()
        switch true{
        case CGFloatRangeAsserter.within(Trig.tl, angle):
            //Swift.print("Q1")
            cornerPoint = rect.topLeft
        case CGFloatRangeAsserter.within(Trig.tr, angle):
            //Swift.print("Q2")
            cornerPoint = rect.topRight
        case CGFloatRangeAsserter.within(Trig.br, angle):
            //Swift.print("Q3")
            cornerPoint = rect.bottomRight
        case CGFloatRangeAsserter.within(Trig.bl, angle):
            //Swift.print("Q4")
            cornerPoint = rect.bottomLeft
        default:
            fatalError("Angle is out of the allowed range (-π to π): " + "\(angle)")
            break;
        }
        let distPoint = PointParser.directionalAxisDistance(rect.center, cornerPoint, angle)
        //Swift.print("distPoint: " + String(distPoint))
        let end:CGPoint = rect.center.polarPoint(distPoint.x, angle)
        //Swift.print("end: " + String(end))
        let start:CGPoint = rect.center.polarPoint(-distPoint.x, angle)
        //Swift.print("start: " + String(start))
        return (start,end)
    }
}