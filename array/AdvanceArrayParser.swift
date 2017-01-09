import Foundation

class AdvanceArrayParser {
    /**
     * Returns the branch at PARAM: index
     * NOTE: this function is recursive
     * NOTE: to find the children of the root use an empty array as the index value
     * EXAMPLE: childAt([["red","green"],[["four","five"],[1,2,3]]],[1,0,1])//five?
     */
    static func childAt(children:Array<AnyObject>,_ index:Array<Int>)->AnyObject?{
        //Swift.print("children: " + "\(children)")
        if(index.count == 0 && children.count >= 1){return children}/*returns the root*/
        else if(index.count == 1 && children.count >= index[0]){return children[index[0]]}/*the index is at its end point, cut of the branch*/
        else if(index.count > 1 && children.count > 0) {return AdvanceArrayParser.childAt(children[index[0]] as! Array<AnyObject>,index.slice2(1,index.count))}/*here is where the recursive magic happens*/
        return nil
    }
    /**
     * Returns the first index of PARAM: index in PARAM: indices
     * TODO: Rename index to depth or map, and indices to depts or maps? depthIndex?
     * EXAMPLE: index([2,1,1],[[2],[2,1],[2,1,0],[2,0]]);//2
     */
    static func index(index:Array<Int>,_ indices:Array<[Int]>) -> Int{
        for i in 0..<indices.count{
            var indicesIndex:Array<Int> = indices[i]
            for e in 0..<index.count{
                if(/*indicesIndex[e].isNaN || */index[e] < indicesIndex[e]) {break;}
                else if((/*!isNaN(indicesIndex[e]) && */index[e] > indicesIndex[e]) || (index.count < indicesIndex.count && index[e] == indicesIndex[e])) {return i}
            }
        }
        return indices.count/*or else just return the last index*/
    }
}