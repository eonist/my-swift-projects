class CharacterModifier {
    /**
     * Removes a character at @param index
     */
    class func removeAt(var str:String,_ index:Int)->String{
        str.removeAtIndex(str.startIndex.advancedBy(index))
    }
}