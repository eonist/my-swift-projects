import Foundation
/**
 * NOTE: index:Array = [0,2,1,0] //means node at 0, node at 2, node at 1, node at 0
 * // :TODO: addItemsAt
 * // :TODO: removeAll
 * // :TODO: replaceItemAt
 * // :TODO: setNameAt
 * // :TODO: removeRange(range)
 * @example:
 * // :TODO: Node should have some core methods for easy access
 * // :TODO: add a method for setting the xml setXML that also dispatches an event
 */
class Node {// :TODO: this should stricly be a DataClass, all none basic functions that are not excplicit get or set should be moved to Parser,Modifier, asserter classes, also make a not of thi sin the java doc
    var data:Dictionary<String,String>
    var children:Array<Node>
    init(_ data:Dictionary<String,String>,_ children:Array<Node>) {
        self.data = data
        self.children = children
    }
    //xml
    //removeAt
    //removeAll
    //addAt
    //add
    //setAttributeAt
    //setXML
}


/*
In math terms:
Root – The top node in a tree.
Child – A node directly connected to another node when moving away from the Root.
Parent – The converse notion of a child.
Siblings – Nodes with the same parent.
Descendant – A node reachable by repeated proceeding from parent to child.
Ancestor – A node reachable by repeated proceeding from child to parent.
Leaf – A node with no children.
Degree – Number of sub trees of a node.
*/