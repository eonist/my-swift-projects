import Foundation

class AdvanceArrayParser {
    /**
     * Returns the branch at @param index
     * @Note this function is recursive
     * @Note to find the children of the root use an empty array as the index value
     * EXAMPLE: childAt([[red,green][[four,five][1,2,3]]],[1,0,1])//[five]
     */
    class func childAt(children:Array<AnyObject>,_ index:Array<Int>)->Array<AnyObject>?{
        Swift.print("children: " + "\(children)")
        if(index.count == 0 && children.count >= 1){return children}/*returns the root*/
        else if(index.count == 1 && children.count >= index[0]){return [children[index[0]]]}/*the index is at its end point, cut of the branch and packaged as a branch*/
        else if(index.count > 1 && children.count > 0) {
            
            let i = index.slice(1,index.count)
            Swift.print("\(index)" + " tick: " + "\(i)")
            return AdvanceArrayParser.childAt(children[index[0]] as! Array<AnyObject>,i)
        }/*here is where the recursive magic happens*/
        return nil
    }
}