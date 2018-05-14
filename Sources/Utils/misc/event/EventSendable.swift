import Foundation
/**
 * All elements in the hierarchy that want's to propegate the event must implement this protocol 
 */
protocol EventSendable:class { /*we use class so that event can be mutated*/
    //TODO: ⚠️️ Not sure if the extra parenthesies are needed inthe bellow line
    typealias CallBack = ((Event) -> ())/*Makes the return type less verbose*/
    var event:EventSendable.CallBack{ get set }
    func onEvent(_ event:Event)
}
