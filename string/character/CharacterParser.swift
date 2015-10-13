import Foundation

class CharacterParser {
    /**
     * Returns the char after @param index
     */
    class func successorAt(str:String,index:Int)->Character{
        let strIndex = str.startIndex.advancedBy(index)
        return str.characters[strIndex.successor()]
    }
    /**
     * Returns the char before @param index
     */
    func predecessorAt(str:String,index:Int)->Character{
        let strIndex = str.startIndex.advancedBy(index)
        return str.characters[strIndex.predecessor()]
    }
}