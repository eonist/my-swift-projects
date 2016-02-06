import Foundation

class EventSender:IEventSender {
    var selector: ((sender: AnyObject?, type:String) -> ())?/*this holds any method assigned to it that has its type*/
    /**
    * EXAMPLE: override onEvent in a subClass then assert origin === thumb && event.type == ButtonEvent.down
    */
    func onEvent(event:Event){
        if(self.superview is IInteractiveView){(self.superview as! IInteractiveView).onEvent(event)}
    }
}
