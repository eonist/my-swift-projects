import Cocoa
/**
 * Debugs gestures by visualizing the touch points
 */
class GestureHUD {
    var debugCircDict = [String:EllipseGraphic]()
    var view:NSView
    init(_ view:NSView){
        self.view = view
    }
    func touchesBegan(_ event:NSEvent){
        let touches:Set<NSTouch> = event.touches(matching:NSTouch.Phase.began, in: view)
        for touch in touches {//
//            Swift.print("touchesBegan id: "+"\((touch as NSTouch).identity)")
            let id:String = "\(touch.identity)"
            let touchPos:CGPoint = touch.pos(view) - CGPoint(20,20)//set to pivot of circ
            let ellipse = EllipseGraphic(touchPos.x,touchPos.y,40,40,FillStyle(NSColor.white.alpha(0.5)),nil)
            debugCircDict[id] = ellipse//add the debugCirc to a dictionary that uses the touch.id for key
            view.addSubview(ellipse.graphic)
            ellipse.draw()
        }
    }
    func touchesMoved(_ event:NSEvent){
        let touches:Set<NSTouch> = event.touches(matching:NSTouch.Phase.any, in: view)//touchesMatchingPhase:NSTouchPhaseAny inView:self
//        Swift.print("touches.count: " + "\(touches.count)")
        for touch in touches {
            let id:String = "\(touch.identity)"
            let touchPos:CGPoint = touch.pos(view) - CGPoint(20,20)//offset pos // touch.normalizedPosition
            let ellipse:EllipseGraphic? = debugCircDict[id]
            ellipse?.setPosition(touchPos)
            ellipse?.draw()
        }
    }
    func touchesEnded(_ event:NSEvent){
        let endingTouches:Set<NSTouch> = event.touches(matching:NSTouch.Phase.ended, in: view)
//        Swift.print("endingTouches.count: " + "\(endingTouches.count)")
        for endingTouch in endingTouches {
            let id:String = "\(endingTouch.identity)"
            let ellipse:EllipseGraphic? = debugCircDict.removeValue(forKey:id)
            ellipse?.graphic.removeFromSuperview()
        }
    }
}
