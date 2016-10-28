import Foundation
/**
 * All elements in the hierarchy that want's to propegate the event must implement this protocol 
 */
protocol IEventSender:class {
    var event: ((Event) -> ())?{get set}//maybe rename to eventRelay?
    func onEvent(event:Event)
}