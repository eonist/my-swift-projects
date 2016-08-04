import Foundation

class AdvanceArrayModifier {
    
    //Continue here: Check if the bellow is correct, the bug is probably related to splice2, check legacy code
    
    /**
     *
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