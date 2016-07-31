import Foundation

class AdvanceArrayModifier {
    /**
     *
     */
    class func sortToHighestDepths(indices:Array<[Int]>) -> Array<[Int]>{
        var sortedIndices:Array<Int> = []
        var numOfindices:Int = indices.count
        for (var i : Int = 0; i < numOfindices; i++) {
            var index:[Int] = indices[i]
            var indicesIndex:Int = AdvanceArrayParser.index(index, indices)
            ArrayModifier.addAt(sortedIndices, index, indicesIndex)
        }
        return sortedIndices;
    }
    /**
     * Returns the først index of @param index in @param indices
     * TODO: Rename index to depth or map, and indices to depts or maps? depthIndex?
     * @example index([2,1,1],[[2],[2,1],[2,1,0],[2,0]]);//2
     */
    public static function index(index:Array,indices:Array):int{
    var lengthOfIndices:int = indices.length;/*Cpu optimiztion*/
    var lengthOfIndex:int = index.length;/*Cpu optimiztion*/
    for (var i : int = 0; i < lengthOfIndices; i++) {
				var indicesIndex:Array = indices[i];
				for (var e : int = 0; e < lengthOfIndex; e++) {
    if(isNaN(indicesIndex[e]) || index[e] < indicesIndex[e]) break;
    else if((!isNaN(indicesIndex[e]) && index[e] > indicesIndex[e]) || (index.length < indicesIndex.length && index[e] == indicesIndex[e])) return i;
				}
    }
    return indices.length;/*or else just return the last index*/
    }
}
