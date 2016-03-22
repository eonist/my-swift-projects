import Foundation

class NodeAsserter {
    /**
     * Asserts if a Node has children at @param index 
     */
    class func hasChildrenAt(node:Node,_ index:Array<Int>) -> Bool {
        return NodeParser.countAt(node,index) > 0
    }
}
