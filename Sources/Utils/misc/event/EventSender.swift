import Foundation
/**
 * NOTE: if you "hi-jack" an event its possible to forward the original event to the instance onEvent so that it may continue its propegation
 * NOTE: you can also create eventHandelers inside nested methods. (unlike postEvent which cant do this)
 * NOTE: to propegate instances that are not InteractiveView you can hi-jack the event variable in children. that way you can create structures that send events.
 * TODO: ⚠️️ In the future make the eventcallback look like: ((T:Event) -> ())?
 */
class EventSender:EventSendable {
    var event:CallBack = emptyCallBack/*This holds any method assigned to it that has it's type, basically it holds an empty method at init to avoid optional etc*/
    /**
     * EXAMPLE: override onEvent in a subClass then event.assert(.down,origin:thumb)
     * NOTE: override in subclass and call super
     */
    func onEvent(_ event:Event){
        self.event(event.setImmediate(self))//the setImmediate attaches the immediate instance to the event.
    }
}
