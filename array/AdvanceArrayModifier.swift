import Foundation

class AdvanceArrayModifier {    
    /**
     * I think this method sorts each node in an array-tree to highest index like [[1,0][0,1]] -> [[0,1],[1,0]]  (<---I'm not sure if this example is correct)
     * NOTE: This method can't sort arrays which are partial, all indecies must exist from 0 to the end etc (It probably can sort partial arrays, but that requires the addAt method to support adding items to lengths that are beyond the length of the array, To add this support you need to make test to make sure its fail safe)
     */
    static func sortToHighestDepths(indices:Array<[Int]>) -> Array<[Int]>{
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
     * NOTE: the index is returned for convenience
     */
    static func incrementLast(/*inout */var index:Array<Int>) -> Array<Int> {
        index[index.count-1] = index[index.count-1] + 1
        return index
    }
    /**
     * NOTE: the index is returned for convenience
     */
    static func incrementLastBy(var index:Array<Int>,_ integer:Int) -> Array<Int> {
        index[index.count-1] = index[index.count-1] + integer
        return index
    }
}