import Foundation

class NodeModifier {
    /**
     * Removes the item @param index in @param node
     */
    func removeItemAt(inout node:Node, index:Array<Int>) -> Node {
        
        //continue here: check if you have a removeAt that is recursive
        
        return ArrayModifier.removeAt(&node, index)
    }
}
