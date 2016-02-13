import Foundation
/**
 * NOTE: if you hi-jack an event its possible to forward the original event to the instance onEvent so that it may continue its propegation
 * NOTE: you can also create eventHandelers inside nested methods. (unlike postEvent which cant do this)
 * NOTE: to propegate instances that are not InteractiveView you can hi-jack the event variable in children. that way you can create structures that send events.
 */
class EventSender:IEventSender {
    var event: ((Event) -> ())?/*this holds any method assigned to it that has its type*/
    init(){
        event = onEvent
    }
    /**
     * EXAMPLE: override onEvent in a subClass then assert origin === thumb && event.type == ButtonEvent.down
     * IMPORTANT: Remember to add immediate to the outgoing event. 
     * TODO: it may be usefull to implement the immediate attaching functionality in the bellow method
     */
    func onEvent(event:Event){//override in subclass and call super
        self.event!(event.setImmediate(self))
    }
}
