import Foundation

protocol IEventSender {
    var event: ((Event) -> ())?{get set}
    func onEvent(event:Event)
}
