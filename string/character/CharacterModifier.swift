class CharacterModifier {
    /**
     *
     */
    class func removeAt(var str:String,_ index:Int)->String{
        str.removeAtIndex(str.characters.indices[index])
    }
}