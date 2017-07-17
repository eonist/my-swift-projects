import Foundation

class AdvanceArrayParser {
    /**
     * Returns the branch at PARAM: index
     * NOTE: this function is recursive
     * NOTE: to find the children of the root use an empty array as the index value
     * EXAMPLE: childAt([["red","green"],[["four","five"],[1,2,3]]],[1,0,1])//five?
     */
    static func childAt(_ children:[AnyObject],_ index:[Int])->AnyObject?{
        if(index.count == 0 && children.count >= 1){return children as AnyObject?}/*returns the root*/
        else if(index.count == 1 && children.count >= index[0]){return children[index[0]]}/*the index is at its end point, cut of the branch*/
        else if(index.count > 1 && children.count > 0) {return AdvanceArrayParser.childAt(children[index[0]] as! [AnyObject],index.slice2(1,index.count))}/*here is where the recursive magic happens*/
        return nil
    }
    /**
     * Returns the first index of PARAM: index in PARAM: indices
     * TODO: Rename index to depth or map, and indices to depts or maps? depthIndex? IndexPath is the the correct term 👌 
     * NOTE: MatrixIndex is a viable option as well. Although I feel its tied to Matrix Math. Which for me at least is more about transformations. I do however like that it describes what it is in 👉just two words👈. Matrix meaning columns and rows and index meaning address to somewhere. 👌
     * EXAMPLE: index([2,1,1],[[2],[2,1],[2,1,0],[2,0]]);//2
     */
    static func index(_ index:[Int],_ indices:[[Int]]) -> Int{
        for i in 0..<indices.count{
            var indicesIndex:[Int] = indices[i]
            for e in 0..<index.count{
                if(indicesIndex.count > e && index.count > e){//<--quick fix
                    if(/*indicesIndex[e].isNaN || */ index[e] < indicesIndex[e]) {break;}
                    else if((/*!isNaN(indicesIndex[e]) && */index[e] > indicesIndex[e]) || (index.count < indicesIndex.count && index[e] == indicesIndex[e])) {return i}
                }
               
            }
        }
        return indices.count/*or else just return the last index*/
    }
    /**
     * Stores indecies as keys
     * ⚠️️ IMPORTANT: keys must be uniqe (Assert uniqness of array before use)
     * ["a","b","c"].hash//[["a":0],["b":1],["c":2]]
     */
    static func hash(_ arr:[String])->[String:Int]{
        var dict:[String:Int] = [:]
        for (i,key) in arr.enumerated(){
            dict[key] = i
        }
        return dict
    }
}
