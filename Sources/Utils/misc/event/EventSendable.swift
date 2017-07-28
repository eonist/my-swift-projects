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
    func addHandler<T:Event>(_ handler:@escaping (T)->Void, _ type:String? = nil){
        event = { argEvent in
            if let e = argEvent as? T {
                if type == nil {
                    handler(e)
                }else if let type = type, argEvent.type == type {
                    handler(e)
                }
                
            }
        }
    }
    /**
     * New,convenient
     */
    func removeHandler(){
        event = {event in}//assign empty closure
    }
}
