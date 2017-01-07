class CharacterParser {
    /**
     * Returns the char after PARAM: index
     */
    static func successorAt(str:String,_ index:Int)->Character{
        let strIndex = str.startIndex.advancedBy(index)
        return str.characters[strIndex.successor()]
    }
    /**
     * Returns the char before PARAM: index
     */
    static func predecessorAt(str:String,_ index:Int)->Character{
        let strIndex = str.startIndex.advancedBy(index)
        return str.characters[strIndex.predecessor()]
    }
    /**
     * Returns the first occurence of PARAM: char in PARAM: str
     */
    static func indexOf(str:String,_ char:Character)->Int{
        if let strIndex = str.characters.indexOf(char) {
            return str.startIndex.distanceTo(strIndex)
        }
        else {
            return -1//indicates that the char doesn't exist
        }
    }
    /**
     * Returns a Character instance at PARAM: index
     */
    static func charAt(str:String,_ index:Int)->Character{
        let index = str.startIndex.advancedBy(index) //will call succ n times until index
        let char:Character = str[index] //you can also do: text.characters[index2]
        return char
    }
    /**
     * Retrieve last letter
     */
    static func last(str:String)->Character{
        return str.characters.last!
    }
    /**
     * Retrieve first letter
     */
    static func first(str:String)->Character{
        return str.characters.first!
    }
}