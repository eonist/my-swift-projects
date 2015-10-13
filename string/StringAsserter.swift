class StringAsserter{
	/*
	 * Example: Asserts if a word is duoble quated: isWrappedWith("\"abc123\"", "\"")--true
	 */
	class func isWrappedWith(string:String, char:Character)->Bool{
		return (string.characters.first == char) && (string.characters.last == char)
	}
	/**
	 *	Determines whether the specified string begins with the spcified prefix.
	 *	@param input: The string that the prefix will be checked against.
	 *	@param prefix: The prefix that will be tested against the string.
	 *	@return True if the string starts with the prefix, false if it does not.
	 */	
	class func beginsWith(input:String, prefix:String)->Bool{
		//return (prefix == input.subString(0, prefix.characters.count));
        let name = "How do you use String.substringWithRange?"
        let range = prefix.startIndex..<name.startIndex.advancedBy(10)
        let res:String = name.substringWithRange(range)

        
        return false
	}
    /*
     *
     */
    class func containsChar(string:String, char:Character)-> Bool{
       return string.characters.contains(char)
    }
}