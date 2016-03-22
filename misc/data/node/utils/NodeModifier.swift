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
     * Add an item to the database
     * @Note: To modifiy an item at a specific index, first getItemAt, then store that as an xml ,then removeItemAt, then addItemAtIndex (the xml you stored)
     * @Note: object syntax example: {title:"Birds"}
     * @example DatabaseModifier.addItemAt(database, [0,0], {title:"Peas"});
     */
    class func addItemAt(node:Node, index:Array<Int>, item:Object) -> void {
        var child:XML = ObjectParser.xml(item);
        XMLModifier.addChildAt(database.xml, index, child);
    }
}