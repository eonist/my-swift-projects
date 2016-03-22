import Foundation

class NodeModifier {
    /**
     * Removes the item @param index in @param node
     */
    class func removeAt(inout node:Node, _ index:Array<Int>) -> Node {
        Swift.print("UNTESTED")
        if(index.count == 1 && node.children.count >= index[0]){return removeAt(&node, index[0])}/*the index is at its end point, cut of the branch*/
        else if(index.count > 1 && node.children.count >= index[0] && node.children[index[0]].children.count > 0){/*recursive*/
            node = removeAt(&node.children[index[0]],index.slice(1,index.count))
        }
        return node
    }
    /**
     *
     */
    class func removeAt(inout node:Node, _ index:Int)->Node{
        return node.children.removeAtIndex(index)
    }
}