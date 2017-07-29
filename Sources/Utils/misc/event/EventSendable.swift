import Foundation
/**
 * All elements in the hierarchy that want's to propegate the event must implement this protocol 
 * TODO: Rename to: EventSendable?
 */
typealias IEventSender = EventSendable//Legacy support
protocol EventSendable:class {
    var event:EventCallBack{get set}
    func onEvent(_ event:Event)
}
extension EventSendable{
    /**
     * New
     * 1. Assigns a closure, 
     * 2. event is only passed on if event type match
     * EXAMPLE: promptBtn.addHandler { (event:ButtonEvent) in print(event.type)}
     */
    func addHandler<T:Event>(type:String? = nil,_ handler:@escaping (T)->Void){
        event = { argEvent in
            guard let e = argEvent as? T else {return}
            guard type == nil || (type != nil && e.type == type!) else {return}
            handler(e)
        }
    }
    /**
     * New,convenient
     */
    func removeHandler(){
        event = {event in}//assign empty closure
    }
}
