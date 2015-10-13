class StringAsserter{
	/*
	 * Example: Asserts if a word is duoble quated: isWrappedWith("\"abc123\"", "\"")--true
	 */
	class func isWrappedWith(string:String, char:Character)->Bool{
		return (string.characters.first == char) && (string.characters.last == char)
	}
	/**
	 *	Asserts whether the specified string begins with the spcified prefix.
	 *	@param input: The string that the prefix will be checked against.
	 *	@param prefix: The prefix that will be tested against the string.
	 *	@return True if the string starts with the prefix, false if it does not.
	 */	
	class func beginsWith(string:String, prefix:String)->Bool{
        let range = prefix.startIndex..<prefix.endIndex//create a range
        return (prefix == string.substringWithRange(range));
	}
    /*
     * Asserts if a 
     */
    class func containsChar(string:String, char:Character)-> Bool{
       return string.characters.contains(char)
    }
    /**
     * Asserts if a string is the word true
     */
    class func boolean(string:String)->Bool{
        return string == "true";
    }
}