import Foundation
/**
* NOTE: index:Array = [0,2,1,0] //means node at 0, node at 2, node at 1, node at 0
* NOTE:
* @example:
* // :TODO: Node should have some core methods for easy access
* // :TODO: add a method for setting the xml setXML that also dispatches an event
* NOTE: To store data as a child, you can just add another node and have the data in content variable
* // :TODO: range() could be usefull but it is an complex function one cant solve all range functionality
* // :TODO: possibly use child and children instead of item and items, since its db and not a list anymore?
* // :TODO: add function: index(attribute:Object) which finds the first index that has an attribute that matches both attribute.key and attribute.value add this function to XMLParser and ref frmom this class
*/
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
