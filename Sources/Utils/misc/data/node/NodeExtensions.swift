import Foundation

extension Node{
    /**
     * TODO: consider renaming to appendAt
     */
    func addAt(_ index:[Int],_ xml:XML){// :TODO: shouldn't the arguments be in this order: xml, index// :TODO: do we still need the event dispatching, cant the calling method do this?
        _ = XMLModifier.addChildAt(self.xml, index, xml)
        onEvent(NodeEvent(NodeEvent.addAt,index,self))
    }
    /**
     * EXAMPLE: setAttributeAt([0], ["title":"someTitle"]);
     * TODO: rename to changeAttribute? or editAttribute?
     */
    func setAttributeAt(_ index:[Int],_ attributes:[String:String]){// :TODO: 👉 do we still need the event dispatching, cant the calling method do this?👈
        _ = XMLModifier.setAttributeAt(xml, index, attributes)
        onEvent(NodeEvent(NodeEvent.setAttributeAt,index,self))
    }
    /**
     * Removes the item PARAM: index
     */
    func removeAt(_ index:[Int])->XML{// :TODO: do we still need the event dispatching, can't the calling method do this?
        let removedXML:XML = XMLModifier.removeChildAt(xml, index)
        onEvent(NodeEvent(NodeEvent.removeAt,index,self))
        return removedXML
    }
}
