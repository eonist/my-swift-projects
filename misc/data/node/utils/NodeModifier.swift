import Foundation
/*
 * // :TODO: look into making an prependItemAt, appendItemAt ?
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
        if(index.count == 1 && node.children.count >= index[0]){return removeAt(node, index[0])}/*the index is at its end point, cut of the branch*/
        else if(index.count > 1 && node.children.count >= index[0] && node.children[index[0]].children.count > 0){/*recursive*/
            node = removeAt(&node.children[index[0]],index.slice2(1,index.count))
        }
        return node
    }
    /**
     * Removes the item @param index in @param node
     */
    class func removeAt(/*inout*/ node:Node, _ index:Int)->Node{
        return node.children.removeAtIndex(index)
    }
    /**
     * Removes every leaf in a tree-structure. Reverse recursive
     * EXAMPLE: removeAll(node).count//0
     */
    class func removeAll(/*inout*/n:Node,_ parent:Node? = nil){
        if(n.children.count > 0){while(n.children.count > 0){removeAll(n.children[0],n)}}//branch, we never remove branches
        else if(parent != nil){parent?.children.removeAtIndex(0)}//leaf, we only remove leafs
    }
    /**
     *
     */
    class func replaceAt(node:Node, var index:Array<Int>, _ child:Node){
        let last = index.pop()
        NodeParser.nodeAt(node, index)?.children[last]
    }
    /**
     * Adds @param child to @param node at @param index
     *
     */
    class func addAt(node:Node, _ index:Array<Int>, _ child:Node){
        NodeParser.nodeAt(node, index)?.add(child)
    }
    /**
     * Adds @param child to @param node
     */
    class func add(node:Node,_ child:Node){
        node.children.append(child)
    }
    /**
     * Add an item to the node
     * @Note: object syntax example: [title:"Birds"]
     * EXAMPLE: NodeModifier.addItemAt(node, [0,0], ["title":"Peas"])
     */
    class func addDataAt(node:Node, _ index:Array<Int>, _ data:[String:AnyObject]) {
        NodeParser.nodeAt(node, index)?.data = data
    }
    /**
     * Adds a @param value by @param key at @param index in @param node
     */
    class func addValueAt(node:Node, _ index:Array<Int>, _ key:String, _ value:AnyObject){
        NodeParser.nodeAt(node, index)?.data[key] = value
    }
    /**
     * Sets the name of the item @param index in @param database with @param name
     * @example NodeModifier.setNameAt(node, [0], "text");
     */
    class func setNameAt(node:Node, _ index:Array<Int>, _ name:String) {
        NodeParser.nodeAt(node, index)?.name = name
    }
    /**
     * Sorts the items at @param index in @param database on the title of the item with @param options
     * @example NodeModifier.sortByName(node, [],Array.descending);
     */
    class func sortByName(node:Node, _ index:Array<Int>,_ options:Int = 0) {// :TODO: ...rest??
        //not implemented yet, use ArrayParser.conditionSort() and the legacy code
    }
    /**
     * Sorts the items at @param index in @param database on @param attributeKey with @param options
     * @example NodeModifier.sortByAttribute(node, [0], "title");//, Array.descending
     */
    class func sortByAttribute(node:Node,index:Array<Int>,attributeKey:String,options:Int = 0) {
        //not implemented yet, use ArrayParser.conditionSort() and the legacy code
    }
}