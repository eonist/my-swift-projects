class CharacterAsserter {
    /*
     * Asserts if a string contains a character
     * EXAMPLE: "testing\n".characters.contains(Character("\n"))//true
     */
    class func contains(string:String, char:Character)-> Bool{
        return string.characters.contains(char)
    }
}