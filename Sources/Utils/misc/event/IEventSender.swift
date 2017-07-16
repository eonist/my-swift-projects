import Foundation
/**
 * All elements in the hierarchy that want's to propegate the event must implement this protocol 
 * TODO: Rename to: EventSendable?
 */
typealias EventSendable = IEventSender//Legacy support
protocol IEventSender:class {
    var event:EventCallBack{get set}
    func onEvent(_ event:Event)
}
