import Foundation

class NodeParser {
    class func childrenCount(node:Node, _ index:Array<Int>) -> Int {
        return XMLParser.childAt(node.xml, index)!.children!.count
    }
}