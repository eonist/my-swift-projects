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
	class func beginsWith(input:String, prefix:String):Boolean->String{
		return (prefix == input.substring(0, prefix.length));
	}	
}