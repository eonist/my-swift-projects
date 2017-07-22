import Foundation
/**
 * NOTE: if you "hi-jack" an event its possible to forward the original event to the instance onEvent so that it may continue its propegation
 * NOTE: you can also create eventHandelers inside nested methods. (unlike postEvent which cant do this)
 * NOTE: to propegate instances that are not InteractiveView you can hi-jack the event variable in children. that way you can create structures that send events.
 */
typealias EventCallBack = ((Event) -> ())?/*Makes the return type less verbose, ⚠️️ i'm not sure why there is a ? sign at the end*/
class EventSender:EventSendable {
    var event:EventCallBack = {return {event in}}()/*This holds any method assigned to it that has its type, basically it holds an empty method at init to avoid optional etc*/
    /*private static var eventCall:EventCallBack {//TODO:this should probably be private
        return {
            (event:Event) -> Void in /*Swift.print("\(ClassParser.type(self))  event handler missing,  event.type: \(event.type) event.origin: \(ClassParser.type(event.origin))" )*//*Empty call so that if no event handler is attached it doesnt throw an error*/
        }
    }*/
    /*returns closure that will take care of propagating the event to the parent*/
    /**
     * EXAMPLE: override onEvent in a subClass then assert origin === thumb && event.type == ButtonEvent.down
     */
    func onEvent(_ event:Event){//override in subclass and call super
        self.event!(event.setImmediate(self))//the setImmediate attaches the immediate instance to the event.
    }
}
