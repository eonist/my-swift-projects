import Foundation
/*
 * // :TODO: addItemsAt
 * // :TODO: removeAll
 * // :TODO: replaceItemAt
 * // :TODO: setNameAt
 * // :TODO: removeRange(range)
 */
class NodeModifier {
    /**
     * Removes the item @param index:Array in @param node
     */
    class func removeAt(inout node:Node, _ index:Array<Int>) -> Node {
        Swift.print("UNTESTED")
        if(index.count == 1 && node.children.count >= index[0]){return removeAt(&node, index[0])}/*the index is at its end point, cut of the branch*/
        else if(index.count > 1 && node.children.count >= index[0] && node.children[index[0]].children.count > 0){/*recursive*/
            node = removeAt(&node.children[index[0]],index.slice2(1,index.count))
        }
        return node
    }
    /**
     * Removes the item @param index in @param node
     */
    class func removeAt(inout node:Node, _ index:Int)->Node{
        return node.children.removeAtIndex(index)
    }
    /**
     * Add an item to the node
     * @Note: object syntax example: [title:"Birds"]
     * EXAMPLE: NodeModifier.addItemAt(database, [0,0], [title:"Peas"])
     */
    class func addDataAt(node:Node, _ index:Array<Int>, _ data:[String:AnyObject]) {
        NodeParser.nodeAt(node, index)?.data = data
    }
    /**
     * Adds an array of objects to the node
     * @Note: the array syntax [[title:"Birds"],[title:"Mamals"]]
     * EXAMPLE: addDataAt(database, [1], [["title":"Birds"],["title":"Mamals"]]);
     */
    class func addDataAt(node:Node, _ index:Array<Int>, _ data:[[String:AnyObject]]){
        
    }
    /**
     *
     */
    class func addValueAt(node:Node, _ index:Array<Int>, _ key:String, _ value:AnyObject){
        NodeParser.nodeAt(node, index)?.data[key] = value
    }
}