import Foundation

class GradientBoxUtils{
    /**
     * Returns the start and end of a linear gradient (that fills an exact rectangle at any angle) (aka GradientBox)
     * @NOTE: this is a really important method concerning gradients. And its pretty well coded and easy to understand. 
     * @NOTE: there may be faster ways to calculate this so imporve it if its necassery
     * EXAMPLE: GradientBoxUtils.points(CGRect(0,0,100,100), 45*Trig.rad) //Ouputs: 0,0 and 100,100
     */
    class func points(rect:CGRect, _ angle:CGFloat)->(start:CGPoint,end:CGPoint){
        //Swift.print("rect: " + "\(rect)")
        //Swift.print("angle: " + "\(angle)")
        //
        //Swift.print("GradientBoxUtils.angle: " + "\(angle)")
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
        Swift.print("cornerPoint: " + "\(cornerPoint)")
        Swift.print("rect.center: " + "\(rect.center)")
        let normalizedAngle = Trig.normalize(angle)//clamps the angle between: 0 and Math.PI*2 Radian (0 - 6.28)
        Swift.print("normalizedAngle: " + "\(normalizedAngle)")
        let distPoint = PointParser.directionalAxisDistance(rect.center, cornerPoint, normalizedAngle)
        Swift.print("distPoint: " + String(distPoint))
        let end:CGPoint = rect.center.polarPoint(distPoint.y, angle)
        //Swift.print("end: " + String(end))
        let start:CGPoint = rect.center.polarPoint(-distPoint.y, angle)
        //Swift.print("start: " + String(start))
        return (start,end)
    }
}