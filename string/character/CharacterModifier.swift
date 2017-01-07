class CharacterModifier {
    /**
     * Removes a character at @param index
     * NOTE: These can be used to remove first and last: str.removeAtIndex(str.characters.indices.first!) // remove first letterstr.removeAtIndex(str.characters.indices.last!) // remove last letter
     */
    static func removeAt(var str:String,_ index:Int)->String{
        str.removeAtIndex(str.startIndex.advancedBy(index))
        return str
    }
    /**
     *
     */
    static func removeFirst(var str:String)->String{
        str.removeAtIndex(str.characters.indices.first!)/*remove last letter*/
        return str
    }
    /**
     *
     */
    static func removeLast(var str:String)->String{
        str.removeAtIndex(str.characters.indices.last!)/*remove last letter*/
        return str
    }
    /**
     * Returns the @param str in reverse order
     * EXAMPLE: reverse("this string has 29 characters")//sretcarahc 92 sah gnirts siht
     */
    static func reverse(str:String)->String{
        var reverse = ""
        for scalar in str.unicodeScalars {
            let asString = "\(scalar)"
            reverse = asString + reverse
        }
        return reverse
    }
}