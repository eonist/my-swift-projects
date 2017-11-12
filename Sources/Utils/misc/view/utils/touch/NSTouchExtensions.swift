import Cocoa

extension NSTouch {
    /**
     * Returns the relative position of the touch to the view
     * NOTE: the normalizedTouch is the relative location on the trackpad. values range from 0-1. And are y-flipped
     * TODO: debug if the touch area is working with a rect with a green stroke
     */
    func pos(_ view:NSView) -> CGPoint{
        let w = view.frame.size.width
        let h = view.frame.size.height
        let touchPos:CGPoint = CGPoint(self.normalizedPosition.x,1 + (self.normalizedPosition.y * -1))/*flip the touch coordinates*/
        let deviceSize:CGSize = self.deviceSize
        let deviceRatio:CGFloat = deviceSize.width/deviceSize.height/*find the ratio of the device*/
        let viewRatio:CGFloat = w/h
        var touchArea:CGSize = CGSize(w,h)
        /*Unifor-shrink the device to the view frame*/
        if(deviceRatio > viewRatio){/*device is wider than view*/
            touchArea.height = h/viewRatio
            touchArea.width = w
        }else if(deviceRatio < viewRatio){/*view is wider than device*/
            touchArea.height = h
            touchArea.width = w/deviceRatio
        }/*else ratios are the same*/
        let touchAreaPos:CGPoint = CGPoint((w - touchArea.width)/2,(h - touchArea.height)/2)/*we center the touchArea to the View*/
        return CGPoint(touchPos.x * touchArea.width,touchPos.y * touchArea.height) + touchAreaPos
    }
}
extension NSTouch.Phase{
    /**
     * Great when logging phaseType
     * TODO: Would it be possible to return .began.rawValue instead?
     */
    var type:String{
        if(self == NSTouch.Phase.began){
            return "began"
        }else if(self == NSTouch.Phase.moved){
            return "moved"
        }else if(self == NSTouch.Phase.stationary){
            return "stationary"
        }else if(self == NSTouch.Phase.ended){
            return "ended"
        }else if(self == NSTouch.Phase.cancelled){
            return "cancelled"
        }else if(self == NSTouch.Phase.touching){
            return "touching"
        }else{
            return "no match"
        }
    }
}
/**
 * TODO: Would it be possible to return .began.rawValue instead?
 */
extension NSEvent.Phase{
    var type:String{
        if(self == NSEvent.Phase.began){
            return "began"
        }else if(self == NSEvent.Phase.stationary){
            return "stationary"
        }else if(self == NSEvent.Phase.changed){
            return "changed"
        }else if(self == NSEvent.Phase.ended){
            return "ended"
        }else if(self == NSEvent.Phase.cancelled){
            return "cancelled"
        }else if(self == NSEvent.Phase.mayBegin){
            return "mayBegin"
        }else{
            return "no match"
        }
    }
}
