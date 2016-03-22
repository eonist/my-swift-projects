import Foundation

class AdvanceArrayParser {
    /**
     * Returns the branch at @param index
     * @Note this function is recursive
     * @Note to find the children of the root use an empty array as the index value
     * EXAMPLE: childAt([[red,green][[four,five][1,2,3]]],[1,0,1])//[five]
     */
    class func childAt<T>(children:Array<T>,_ index:Array<Int>)->[T]?{
        if(index.count == 0 && children.count >= 1){return children}/*returns the root*/
        else if(index.count == 1 && children.count >= index[0]){return [children[index[0]]]}/*the index is at its end point, cut of the branch and packaged as a branch*/
        else if(index.count > 1 && children.count > 0) {
            let temp = children[index[0]]
            return AdvanceArrayParser.childAt(temp,index.slice(1,index.count))
        }/*here is where the recursive magic happens*/
        return nil
    }
}