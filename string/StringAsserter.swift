class StringAsserter{
	/*
	 * Example: Asserts if a word is duoble quated: isWrappedWith("\"abc123\"", "\"")--true
	 */
	class func isWrappedWith(string:String, _ char:Character)->Bool{
		return (string.characters.first == char) && (string.characters.last == char)
	}
	/**
	 *	Asserts whether the specified string begins with the spcified prefix.
	 *	@param string: The string that the prefix will be checked against.
	 *	@param prefix: The prefix that will be tested against the string.
	 *	@return True if the string starts with the prefix, false if it does not.
	 */	
	class func beginsWith(string:String, _ prefix:String)->Bool{
        //let range = prefix.startIndex..<prefix.endIndex//create a range
        //return (prefix == string.substringWithRange(range));
        return string.hasPrefix(prefix)
	}
    /**
     * Asserts if @param str ends with @param suffix
     */
    class func endWith(str:String, _ suffix:String)->Bool{
        return str.hasSuffix(suffix)
    }
    /**
     * Asserts if a string is the word true
     */
    class func boolean(string:String)->Bool{
        return string == "true";
    }
    /*
     * Check if string contains another string
     */
    class func contains(a:String, _ b:String)->Bool{
        return a.rangeOfString(b) != nil
    }
}