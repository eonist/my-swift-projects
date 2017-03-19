import Foundation

class NodeParser {
    static func childrenCount(_ node:Node, _ index:[Int]) -> Int {
        return XMLParser.childAt(node.xml, index)!.children!.count
    }
    /**
     * New
     */
    static func dataAt(_ node:Node,_ idx:[Int]) -> [String:String]{
        let xml:XML = XMLParser.childAt(node.xml, idx)!
        //print("dataAt.xml:  \(xml)")
        let attributes:[String:String] = XMLParser.attribs(xml)
        return attributes
    }
}
