class CharacterAsserter {
    /**
     * Asserts if a string contains a character
     * EXAMPLE: "testing\n".characters.contains(Character("\n"))//true
     */
    static func contains(_ string:String, char:Character)-> Bool{
        return string.characters.contains(char)
    }
}
