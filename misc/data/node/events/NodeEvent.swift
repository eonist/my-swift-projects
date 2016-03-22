import Foundation

class NodeEvent:Event{
    static var addAt:String = "databaseEventAddAt"//we mergeed add_at and add since its essentialy the same
    static var removeAt:String = "databaseEventRemoveAt"
    static var removeAll:String = "nodeEventRemoveAll"
    static var changeAt:String = "nodeEventChangeAt"
    var index:Array<Int>
    init(_ type: String, _ index:Array<Int>, _ origin: AnyObject) {
        self.index = index;
        super.init(type, origin)
    }
}
