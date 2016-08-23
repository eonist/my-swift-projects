import Foundation

class GradientBoxUtils{
    /**
     * Returns the start and end of a linear gradient (that fills an exact rectangle at any angle) (aka GradientBox)
     * @NOTE: this is a really important method concerning gradients. And its pretty well coded and easy to understand. 
     * @NOTE: there may be faster ways to calculate this so imporve it if its necassery
     */
    
    
    //Continue here: the problem is when the angle approches diagonal, the the points are wrong
    //try a diagonal gradient with the graphics lib test in explorer
    //if you can't find a quick fix then maybe setup a leverSpinner and debug it with visual circles that align them selfs as you change the gradient rotation
    
    
    class func points(rect:CGRect, _ angle:CGFloat)->(start:CGPoint,end:CGPoint){
        //Swift.print("rect: " + "\(rect)")
        //Swift.print("angle: " + "\(angle)")
        //let angle = Trig.normalize2(angle)/*normalizes the angle between between -π and π*/ //<----TODO: fix this problem in the cssPropertyparser not here,actually there may be other use cases for the graphics class so it needs to be here, you could throw an error?
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
        //Swift.print("rect.center: " + "\(rect.center)")
        let distPoint = PointParser.directionalAxisDistance(rect.center, cornerPoint, angle)
        //Swift.print("distPoint: " + String(distPoint))
        let end:CGPoint = rect.center.polarPoint(distPoint.x, angle)
        //Swift.print("end: " + String(end))
        let start:CGPoint = rect.center.polarPoint(-distPoint.x, angle)
        //Swift.print("start: " + String(start))
        return (start,end)
    }
}