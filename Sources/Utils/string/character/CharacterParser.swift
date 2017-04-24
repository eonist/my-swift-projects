class CharacterParser {
    /**
     * Returns the char after PARAM: index
     */
    static func successorAt(_ str:String,_ index:Int)->Character{
        let successor = str.index(after: str.idx(index))//upgraded to swift 3-> was: startIndex.advancedBy
        return str.characters[successor]
    }
    /**
     * Returns the char before PARAM: index
     */
    static func predecessorAt(_ str:String,_ index:Int)->Character{
        let predecessor = str.index(before: str.idx(index))
        return str.characters[predecessor]
    }
    /**
     * Returns the first occurence of PARAM: char in PARAM: str
     */
    static func indexOf(_ str:String,_ char:Character)->Int{
        if let strIndex = str.characters.index(of: char) {
            return str.distance(from: str.startIndex, to: strIndex)//<--upgraded to swift 3 support
        }
        else {
            return -1//indicates that the char doesn't exist
        }
    }
    /**
     * Returns a Character instance at PARAM: index
     */
    static func charAt(_ str:String,_ index:Int)->Character{
        let index = str.idx(index) //will call succ n times until index
        let char:Character = str[index] //you can also do: text.characters[index2]
        return char
    }
    /**
     * Retrieve last letter
     */
    static func last(_ str:String)->Character{
        return str.characters.last!
    }
    /**
     * Retrieve first letter
     */
    static func first(_ str:String)->Character{
        return str.characters.first!
    }
    /**
     * Returns the PARAM: str in reverse order
     * EXAMPLE: reverse("this string has 29 characters")//sretcarahc 92 sah gnirts siht
     */
    static func reversed(_ str:String)->String{
        var reverse = ""
        for scalar in str.unicodeScalars {
            let asString = "\(scalar)"
            reverse = asString + reverse
        }
        return reverse
    }
}
