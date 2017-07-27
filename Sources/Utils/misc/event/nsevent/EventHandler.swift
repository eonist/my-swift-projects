import Cocoa
/**
 * NSEventMask types: leftMouseDown,leftMouseUp,rightMouseDown,rightMouseUp,mouseMoved,leftMouseDragged,rightMouseDragged,mouseEntered,mouseExited,keyDown,keyUp,flagsChanged,appKitDefined,systemDefined,applicationDefined,periodic,cursorUpdate,scrollWheel,tabletPoint,tabletProximity,otherMouseDown,otherMouseUp,otherMouseDragged
 * NSEventMask gesture types: gesture,magnify,swipe,rotate,beginGesture,endGesture
 * TODO: You might want to add bubble:Bool flag that blocks further event bubbling etc
 */
class EventHandler {
    var leftMouseDraggedEventListener:Any?
    
    func onModalDrag(event:NSEvent) -> NSEvent?{
        
        return event
    }
    
    func addEventHandler(_ eventMask:NSEventMask, _ callBack:()->Void){
        if(leftMouseDraggedEventListener == nil) {
            leftMouseDraggedEventListener = NSEvent.addLocalMonitorForEvents(matching: [.leftMouseDragged], handler: onModalDrag)
        }
    }
    func removeEventHandler(){
        if(leftMouseDraggedEventListener != nil){
            NSEvent.removeMonitor(leftMouseDraggedEventListener!)
            leftMouseDraggedEventListener = nil//<--this part may not be needed
        }/*We remove a global mouse move event listener*/
    }
    
    
    
}
