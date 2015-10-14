class CharacterAsserter {
    /*
     * Asserts if a string contains a character
     */
    class func contains(string:String, char:Character)-> Bool{
        return string.characters.contains(char)
    }
}