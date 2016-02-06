import Foundation

protocol IEventSender {
    var event: ((event:Event) -> Void)?
    func onEvent(event:Event)
}
