import Foundation
/**
 * All elements in the hierarchy that want's to propegate the event must implement this protocol 
 */
protocol EventSendable:class {//we use class so that event can be mutated
    typealias CallBack = ((Event) -> ())/*Makes the return type less verbose, ⚠️️ i'm not sure why there is a ? sign at the end*/
    var event:EventSendable.CallBack{get set}
    func onEvent(_ event:Event)
}
