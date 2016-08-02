import Foundation
/**
* NOTE: index:Array = [0,2,1,0] //means node at 0, node at 2, node at 1, node at 0
* NOTE: a benefit of not using Node and instead using XML is that you then can access things deply nested inside xml, with ease. Which i guess you can if you convert the xml to NOde aswell. But then its 3 conversions which may not be great.
* // :TODO: Node should have some core methods for easy access
* // :TODO: add a method for setting the xml setXML that also dispatches an event
* NOTE: To store data as a child, you can just add another node and have the data in content variable
* // :TODO: range() could be usefull but it is an complex function one cant solve all range functionality
* // :TODO: possibly use child and children instead of item and items, since its db and not a list anymore?
* // :TODO: add function: index(attribute:Object) which finds the first index that has an attribute that matches both attribute.key and attribute.value add this function to XMLParser and ref frmom this class
*/
class Node : EventSender{//this should probably extend NSXMLElement, and just implement the eventsender as a method instead
    var xml : NSXMLElement
    init(_ xml:NSXMLElement = NSXMLElement()) {
        self.xml = xml
    }
    /**
     * // :TODO: consider renaming to appendAt 
     */
    func addAt(index:Array<Int>,_ xml:NSXMLElement){// :TODO: shouldnt the arguments be in this order: xml, index// :TODO: do we still need the event dispatching, cant the calling method do this?
        XMLModifier.addChildAt(self.xml, index, xml)
        onEvent(NodeEvent(NodeEvent.addAt,index,self))
    }
    /**
     * @example setAttributeAt([0], ["title":"someTitle"]);
     * // :TODO: rename to changeAttribute? or editAttribute?
     */
    func setAttributeAt(index:Array<Int>,_ attributes:Dictionary<String,String>){// :TODO: do we still need the event dispatching, cant the calling method do this?
        XMLModifier.setAttributeAt(xml, index, attributes)
        onEvent(NodeEvent(NodeEvent.setAttributeAt,index,self))
    }
    /**
     * Removes the item @param index
     */
    func removeAt(index:Array<Int>)->NSXMLElement{// :TODO: do we still need the event dispatching, can't the calling method do this?
        let removedXML:NSXMLElement = XMLModifier.removeChildAt(xml, index)
        onEvent(NodeEvent(NodeEvent.removeAt,index,self))
        return removedXML
    }
}
/*
Terminologies used in Trees:

Root – The top node in a tree.
Child – A node directly connected to another node when moving away from the Root.
Parent – The converse notion of a child.
Siblings – Nodes with the same parent.
Descendant – A node reachable by repeated proceeding from parent to child.
Ancestor – A node reachable by repeated proceeding from child to parent.
Leaf – A node with no children.
Internal node – A node with at least one child
External node – A node with no children.
Degree – Number of sub trees of a node.
Edge – Connection between one node to another.
Path – A sequence of nodes and edges connecting a node with a descendant.
Level – The level of a node is defined by 1 + (the number of connections between the node and the root).
Height of node – The height of a node is the number of edges on the longest path between that node and a leaf.
Height of tree – The height of a tree is the height of its root node.
Depth – The depth of a node is the number of edges from the node to the tree's root node.
Forest – A forest is a set of n ≥ 0 disjoint trees.
*/