import Foundation

class EventHandler {
    func addEventHandler(){
        
    }
    func removeEventHandler
    if(leftMouseDraggedEventListener == nil) {
        leftMouseDraggedEventListener = NSEvent.addLocalMonitorForEvents(matching: [.leftMouseDragged], handler: onModalDrag)
    }
    if(leftMouseDraggedEventListener != nil){
        NSEvent.removeMonitor(leftMouseDraggedEventListener!)
        leftMouseDraggedEventListener = nil//<--this part may not be needed
    }/*We remove a global mouse move event listener*/
    
}
