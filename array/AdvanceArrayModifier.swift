import Foundation

class AdvanceArrayModifier {
    
    //Continue here make a method that finds the highestDepth, so in [[4,3],[6,1],[6,2],[0,0],] the [6,2] should be the highestDepth. This is much more efficient than sorting an entire array and picking the index:0 after (The algo should use temp variables ) 
    
    
    /**
     * I think this method sorts each node in an array-tree to highest index like [[1,0][0,1]] -> [[0,1],[1,0]]  (<---I'm not sure if this example is correct)
     * NOTE: This method can't sort arrays which are partial, all indecies must exist from 0 to the end etc (It probably can sort partial arrays, but that requires the addAt method to support adding items to lengths that are beyond the length of the array, To add this support you need to make test to make sure its fail safe)
     */
    class func sortToHighestDepths(indices:Array<[Int]>) -> Array<[Int]>{
        var sortedIndices:Array<[Int]> = []
        let numOfindices:Int = indices.count
        for (var i : Int = 0; i < numOfindices; i++) {
            let index:[Int] = indices[i]
            let indicesIndex:Int = AdvanceArrayParser.index(index, indices)
            ArrayModifier.addAt(&sortedIndices, index, indicesIndex)
        }
        return sortedIndices
    }
    /**
     * @Note the index is returned for convenience
     */
    class func incrementLast(/*inout */var index:Array<Int>) -> Array<Int> {
        index[index.count-1] = index[index.count-1] + 1
        return index
    }
    /**
     * @Note the index is returned for convenience
     */
    class func incrementLastBy(var index:Array<Int>,_ integer:Int) -> Array<Int> {
        index[index.count-1] = index[index.count-1] + integer
        return index
    }
}