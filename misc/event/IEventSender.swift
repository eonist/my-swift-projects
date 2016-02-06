import Foundation

protocol IEventSender {
    var event:Void?
    func onEvent(event:Event)
}
