import Foundation

protocol IEventSender:class {
    var event: ((Event) -> ())?{get set}
    func onEvent(event:Event)
}
