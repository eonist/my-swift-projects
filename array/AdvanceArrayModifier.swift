import Foundation

class AdvanceArrayModifier {
    
    //Continue here: Check if the bellow is correct, the bug is probably related to splice2, check legacy code
    //write a description of what sortToHighestDepths does. Also make a note that it cant sort arrays which are uncomplete, well it can but then you need to alter addAt, and is it needed? fix the code that creates the array instead right?
    
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