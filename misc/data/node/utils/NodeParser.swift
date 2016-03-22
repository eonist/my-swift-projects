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
}

