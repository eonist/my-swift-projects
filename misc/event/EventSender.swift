import Foundation

class EventSender:IEventSender {
    var event: ((Event) -> ())?/*this holds any method assigned to it that has its type*/
    /**
    * EXAMPLE: override onEvent in a subClass then assert origin === thumb && event.type == ButtonEvent.down
    */
    func onEvent(event:Event){
        //override in subclass
    }
}
