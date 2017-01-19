import Foundation

class NodeParser {
    static func childrenCount(_ node:Node, _ index:Array<Int>) -> Int {
        return XMLParser.childAt(node.xml, index)!.children!.count
    }
}
