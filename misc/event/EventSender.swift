import Foundation

class EventSender {
    var selector: ((sender: AnyObject?, type:String) -> ())?/*this holds any method assigned to it that has its type*/
}
