import Foundation

class NodeEvent:Event {
    static var addAt:String = "nodeEventAddAt"//we mergeed add_at and add since its essentialy the same
    static var removeAt:String = "nodeEventRemoveAt"
    static var removeAll:String = "nodeEventRemoveAll"
    static var setAttributeAt:String = "nodeEventSetAttributeAt"
    var index:Array<Int>
    init(_ type: String, _ index:Array<Int>, _ origin: AnyObject) {
        self.index = index;
        super.init(type, origin)
    }
}
extension NodeEvent{
    var xml:NSXMLElement {return }
}