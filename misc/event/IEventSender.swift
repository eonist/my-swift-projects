import Foundation

protocol IEventSender {
    var event:(Event)
    func onEvent(event:Event)
}
