class CharacterModifier {
    /**
     * Removes a character at @param index
    * NOTE: These can be used to remove first and last: str.removeAtIndex(str.characters.indices.first!) // remove first letterstr.removeAtIndex(str.characters.indices.last!) // remove last letter
     */
    class func removeAt(var str:String,_ index:Int)->String{
        str.removeAtIndex(str.startIndex.advancedBy(index))
    }
}