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
