import Foundation

class NodeParser {
    /**
     * Returns the branch at @param index
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
     *
     */
    class func nodeAt(node:Node,_ index:Int) -> Node?{
        return node.children[index]
    }
    /**
     *
     */
    class func dataAt(node:Node,_ index:Array<Int>)->[String:AnyObject]{
        return nodeAt(node, index)!.data
    }
    /**
     *
     */
    class func valueAt(node:Node,_ index:Array<Int>, _ key:String)->AnyObject?{
        return dataAt(node, index)[key]
    }
    /**
     *
     */
    class func countAt(node:Node,_ index:Array<Int>)->Int{
        return nodeAt(node, index)!.children.count
    }
}

