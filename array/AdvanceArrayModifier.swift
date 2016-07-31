import Foundation

class AdvanceArrayModifier {
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
}
