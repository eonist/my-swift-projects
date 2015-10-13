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
    class func predecessorAt(str:String,index:Int)->Character{
        let strIndex = str.startIndex.advancedBy(index)
        return str.characters[strIndex.predecessor()]
    }
    /**
     * Returns the first occurence of @param char in @param str
     */
    class func indexOf(str:String,char:Character)->Int{
        if let strIndex = str.characters.indexOf(char) {
            return str.startIndex.distanceTo(strIndex)
        }
        else {
            -1//indicates that the char doesnt exist
        }
    }
    /**
     * Returns a Character instance at @param index
     */
    class func charAt(str:String,index:Int)->Character{
        let index = str.startIndex.advancedBy(index) //will call succ n times until index
        let char:Character = str[index] //you can also do: text.characters[index2]
        return char
    }
}