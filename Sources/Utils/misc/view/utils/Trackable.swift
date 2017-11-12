import Cocoa

protocol Trackable:class{
    var trackingArea:NSTrackingArea? {get set}
    func removeTrackingArea(_ trackingArea:NSTrackingArea)
    func addTrackingArea(_ trackingArea:NSTrackingArea)
    //    func createTrackingArea() -> Void
    var frame:NSRect {get}
}
extension Trackable{
    /**
     * New
     */
    func createTrackingArea(_ options:NSTrackingArea.Options = [NSTrackingArea.Options.activeAlways, NSTrackingArea.Options.mouseMoved,NSTrackingArea.Options.mouseEnteredAndExited]){
        if let trackingArea = self.trackingArea {
            self.removeTrackingArea(trackingArea)/*remove old trackingArea if it exists*/
        }
        let newTrackingArea = NSTrackingArea(rect: self.frame, options: options, owner: self, userInfo: nil)
        self.trackingArea = newTrackingArea
        self.addTrackingArea(newTrackingArea)//<--This will be in the Skin class in the future and the owner will be set to Element to get interactive events etc
    }
}
