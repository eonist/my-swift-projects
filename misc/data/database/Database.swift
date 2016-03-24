import Foundation

class Database {
    var xml : NSXMLElement
    init(xml:NSXMLElement) {
        self.xml = xml
    }
    /**
     * // :TODO: consider renaming to appendAt
     */
    func addAt(index:Array<Int>,xml:NSXMLElement){// :TODO: shouldnt the arguments be in this order: xml, index// :TODO: do we still need the event dispatching, cant the calling method do this?
        DatabaseModifier.addAt(self, index, xml);
        dispatchEvent(new DatabaseEvent(DatabaseEvent.ADD_AT,index,xml,true));
    }
}
