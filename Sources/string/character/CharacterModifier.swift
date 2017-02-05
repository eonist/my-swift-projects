class CharacterModifier {
    /**
     * Removes a character at PARAM: index
     * NOTE: These can be used to remove first and last: str.removeAtIndex(str.characters.indices.first!) // remove first letterstr.removeAtIndex(str.characters.indices.last!) // remove last letter
     */
    static func removeAt(_ str:String,_ index:Int)->String{
        var str = str
        let idx = str.index(str.startIndex, offsetBy: index)//upgraded to swift 3-> was: startIndex.advancedBy
        str.remove(at:idx)
        return str
    }
    /**
     * Removes last letter
     */
    static func removeFirst(_ str:String)->String{
        var str = str
        str.remove(at: str.characters.indices.first!)
        return str
    }
    /**
     * Removes last letter
     */
    static func removeLast(_ str:String)->String{
        var str = str
        str.remove(at: str.characters.indices.last!)
        return str
    }
    /**
     * Returns the PARAM: str in reverse order
     * EXAMPLE: reverse("this string has 29 characters")//sretcarahc 92 sah gnirts siht
     */
    static func reverse(_ str:String)->String{
        var reverse = ""
        for scalar in str.unicodeScalars {
            let asString = "\(scalar)"
            reverse = asString + reverse
        }
        return reverse
    }
}
