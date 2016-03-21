import Foundation

class NodeModifier {
    /**
     * Removes the item @param index in @param node
     */
    func removeItemAt(inout node:Node, index:Array<Int>) -> Node {
        return ArrayModifier.removeAt(&node, i: <#T##Int#>)
    }
}
