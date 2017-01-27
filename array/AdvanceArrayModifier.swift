import Foundation

class AdvanceArrayModifier {    
    /**
     * I think this method sorts each node in an array-tree to highest index like [[1,0][0,1]] -> [[0,1],[1,0]]  (<---I'm not sure if this example is correct)
     * NOTE: This method can't sort arrays which are partial, all indecies must exist from 0 to the end etc (It probably can sort partial arrays, but that requires the addAt method to support adding items to lengths that are beyond the length of the array, To add this support you need to make test to make sure its fail safe)
     * NOTE: see the MDTaskSorter project for how to use this method
     * IMPORTANT: I Think this method is out of order
     * UNIT-TEST: let arr6:Array<[Int]> = [[1,0],[0,1]]; let res = AdvanceArrayModifier.sortToHighestDepths(arr6); let toMatch = [[0,1],[0,1]]; res.first! == toMatch.first! && res.last! == toMatch.last! ? print("works") : print("doesn't work")
     */
    static func sortToHighestDepths(_ indices:Array<[Int]>) -> Array<[Int]>{
        var sortedIndices:Array<[Int]> = []
        let numOfindices:Int = indices.count
        for i in 0..<numOfindices{
            let index:[Int] = indices[i]
            let indicesIndex:Int = AdvanceArrayParser.index(index, indices)
            ArrayModifier.addAt(&sortedIndices, index, indicesIndex)
        }
        return sortedIndices
    }
    /**
     * NOTE: the index is returned for convenience
     */
    static func incrementLast(_ index:Array<Int>) -> Array<Int> {
        var index = index
        index[index.count-1] = index[index.count-1] + 1
        return index
    }
    /**
     * NOTE: the index is returned for convenience
     */
    static func incrementLastBy(_ index:Array<Int>,_ integer:Int) -> Array<Int> {
        var index = index
        index[index.count-1] = index[index.count-1] + integer
        return index
    }
}
