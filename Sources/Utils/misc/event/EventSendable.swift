import Foundation

protocol EventSendable {
    var event:EventCallBack{get set}
    func onEvent(_ event:Event)
}
