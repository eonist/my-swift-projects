import Foundation

class Database : EventSender{
    var xml : NSXMLElement
    init(xml:NSXMLElement) {
        self.xml = xml
    }
    /**
     * // :TODO: consider renaming to appendAt
     */
    func addAt(index:Array<Int>,xml:NSXMLElement){// :TODO: shouldnt the arguments be in this order: xml, index// :TODO: do we still need the event dispatching, cant the calling method do this?
        XMLModifier.addChildAt(self.xml, index, xml);
        onEvent(DatabaseEvent(DatabaseEvent.addAt,index,self))
    }
    /**
     * @example setAttributeAt([0], ["title":"someTitle"]);
     * // :TODO: rename to changeAttribute? or editAttribute?
     */
    func setAttributeAt(index:Array<Int>,_ attributes:Dictionary<String,String>){// :TODO: do we still need the event dispatching, cant the calling method do this?
        XMLModifier.setAttributeAt(xml, index, attributes)
        onEvent(DatabaseEvent(DatabaseEvent.setAttributeAt,index,self))
    }
    /**
     * Removes the item @param index in @param database
     */
    func removeAt(index:Array<Int>){// :TODO: do we still need the event dispatching, can't the calling method do this?
        XMLModifier.removeChildAt(xml, index)
        onEvent(DatabaseEvent(DatabaseEvent.removeAt,index,self))
    }
}
