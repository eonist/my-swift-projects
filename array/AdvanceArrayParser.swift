import Foundation

class AdvanceArrayParser {
    /**
     * Returns the branch at @param index
     * @Note this function is recursive
     * @Note to find the children of the root use an empty array as the index value
     * EXAMPLE: childAt([["red","green"],[["four","five"],[1,2,3]]],[1,0,1])//five?
     */
    class func childAt(children:Array<AnyObject>,_ index:Array<Int>)->AnyObject?{
        //Swift.print("children: " + "\(children)")
        if(index.count == 0 && children.count >= 1){return children}/*returns the root*/
        else if(index.count == 1 && children.count >= index[0]){return children[index[0]]}/*the index is at its end point, cut of the branch*/
        else if(index.count > 1 && children.count > 0) {return AdvanceArrayParser.childAt(children[index[0]] as! Array<AnyObject>,index.slice2(1,index.count))}/*here is where the recursive magic happens*/
        return nil
    }
    /**
     * Returns the first index of @param index in @param indices
     * TODO: Rename index to depth or map, and indices to depts or maps? depthIndex?
     * @example index([2,1,1],[[2],[2,1],[2,1,0],[2,0]]);//2
     */
    class func index(index:Array<Int>,_ indices:Array<[Int]>) -> Int{
        let lengthOfIndices:Int = indices.count/*Cpu optimiztion*/
        let lengthOfIndex:Int = index.count/*Cpu optimiztion*/
        for (var i : Int = 0; i < lengthOfIndices; i++) {
            var indicesIndex:Array<Int> = indices[i]
            for (var e : Int = 0; e < lengthOfIndex; e++) {
                if(/*indicesIndex[e].isNaN || */index[e] < indicesIndex[e]) {break;}
                else if((/*!isNaN(indicesIndex[e]) && */index[e] > indicesIndex[e]) || (index.count < indicesIndex.count && index[e] == indicesIndex[e])) {return i}
            }
        }
        return indices.count/*or else just return the last index*/
    }
}