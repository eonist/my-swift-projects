import Foundation
/*
 * // :TODO: range() could be usefull but it is an complex function one cant solve all range functionality
 * // :TODO: possibly use child and children instead of item and items, since its db and not a list anymore?
 * // :TODO: add function: index(attribute:Object) which finds the first index that has an attribute that matches both attribute.key and attribute.value add this function to XMLParser and ref frmom this class
 */
class NodeParser {
    /**
     * Returns the branch at an array index
     * @Note this function is recursive
     */
    class func nodeAt(node:Node,_ index:Array<Int>)->Node?{
        if(index.count == 0){return node}/*returns the root*/
        else if(index.count == 1 && node.children.count >= index[0]){return nodeAt(node, index[0])}/*the index is at its end point, cut of the branch*/
        else if(index.count > 1 && node.children.count >= index[0] && node.children[index[0]].children.count > 0){/*recursive*/
            return nodeAt(node.children[index[0]],index.slice2(1,index.count))
        }
        return nil
    }
    /**
     * Returns a node at an index
     */
    class func nodeAt(node:Node,_ index:Int) -> Node?{
        return node.children[index]
    }
    /**
     * Returns data with at @param index in @param node
     */
    class func dataAt(node:Node,_ index:Array<Int>)->[String:AnyObject]{
        return nodeAt(node, index)!.data
    }
    /**
     * Returns value in @node at @param index with @param key
     */
    class func valueAt(node:Node,_ index:Array<Int>, _ key:String)->AnyObject?{
        return dataAt(node, index)[key]
    }
    /**
     * Returns the num of children a node has in a specified branch
     */
    class func countAt(node:Node,_ index:Array<Int>)->Int{
        return nodeAt(node, index)!.children.count
    }
    /**
     * Converts xml to node
     */
    class func node(xml:NSXMLElement,_ root:Node = Node())->Node{
        //Swift.print("node xml.children!.count: " + "\(xml.children!.count)")
        let count = xml.children!.count//or use rootElement.childCount TODO: test this
        for (var i = 0; i < count; i++) {
            let child:NSXMLElement = XMLParser.childAt(xml.children!, i)!
            //print("Import - child.toXMLString(): " + child.toXMLString());
            let node:Node = Node()
            node.name = child.localName!
            let attributes:[Dictionary<String,String>] = XMLParser.attributes(child)
            for attribute in attributes {node.data[attribute["name"]!] = attribute["value"]!}
            if(child.stringValue != nil && child.stringValue!.count > 0) { node.content = child.stringValue! }// :TODO: this may need to be rolled back to previouse code state
            if(child.hasComplexContent()){NodeParser.node(child, node)}//this makes the method recursive
            root.children.append(node)
        }
        return root
    }
    /**
     * Converts node to xml
     */
    class func xml(node:Node)->NSXMLElement{
        let xml:NSXMLElement = NSXMLElement(name:node.name != "" ? node.name : "node")
        for (theKey,theValue) in node.attributes{if(theValue is String) {xml[theKey] = theValue as? String}}//attributes
        for n in node.children{xml.appendChild(NodeParser.xml(n))}
        if(node.content != ""){xml.stringValue = node.content}
        return xml
    }
}

/*

class func toArray(xml:NSXMLElement)->[Dictionary<String,String>] {
    var items:[Dictionary<String,String>] = []
    let count = xml.children!.count//or use rootElement.childCount TODO: test this
    for (var i = 0; i < count; i++) {
        let child:NSXMLElement = XMLParser.childAt(xml.children!, i)!
        //print("Import - child.toXMLString(): " + child.toXMLString());
        var item:Dictionary<String,String> = Dictionary<String,String>()
        let attributes:[Dictionary<String,String>] = XMLParser.attributes(child)
        for attribute in attributes {
            item[attribute["name"]!] = attribute["value"]!
        }
        if(child.stringValue != nil && child.stringValue!.count > 0) { item["xml"] = child.stringValue! }// :TODO: this may need to be rolled back to previouse code state
        items.append(item);
    }
    return items;
}

*/