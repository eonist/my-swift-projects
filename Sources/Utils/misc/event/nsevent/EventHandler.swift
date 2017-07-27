import Cocoa

class EventHandler {
    func addEventHandler(){
        if(leftMouseDraggedEventListener == nil) {
            leftMouseDraggedEventListener = NSEvent.addLocalMonitorForEvents(matching: [.leftMouseDragged], handler: onModalDrag)
        }
    }
    func removeEventHandler
    
    if(leftMouseDraggedEventListener != nil){
        NSEvent.removeMonitor(leftMouseDraggedEventListener!)
        leftMouseDraggedEventListener = nil//<--this part may not be needed
    }/*We remove a global mouse move event listener*/
    
}
