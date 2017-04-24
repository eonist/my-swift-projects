class CharacterModifier {
    /**
     * Removes a character at PARAM: index
     * NOTE: These can be used to remove first and last: str.removeAtIndex(str.characters.indices.first!) // remove first letterstr.removeAtIndex(str.characters.indices.last!) // remove last letter
     */
    static func removeAt(_ str:inout String,_ index:Int)->String{
        let idx = str.index(str.startIndex, offsetBy: index)//upgraded to swift 3-> was: startIndex.advancedBy
        str.remove(at:idx)
        return str
    }
    /**
     * Removes last letter
     */
    static func removeFirst(_ str:inout String)->String{
        str.remove(at: str.characters.indices.first!)
        return str
    }
    /**
     * Removes last letter
     */
    static func removeLast(_ str:inout String)->String{
        str.remove(at: str.characters.indices.last!)
        return str
    }
}
