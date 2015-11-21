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
        //Swift.print("StringAsserter.boolean()"+"\(Bool(string == "true").dynamicType)")
        return string.test("^(true|false)$");
    }
    /*
     * Check if string contains another string
     */
    class func contains(a:String, _ b:String)->Bool{
        return a.rangeOfString(b) != nil
    }
    /**
     * Asserts if a string is a digit (10, 20px, -20px, 0.2px, -.2, 20%, 0.2)
     */
    class func digit(string:String)->Bool{
        return RegExp.test(string, "^-?\\d*?\\.?\\d*?(px)?$")
    }
    /**
     *
     */
    class func metric(string:String) -> Bool{
        return RegExp.test(string, "^-?\\d*?\\.?\\d*?(ems|%)?$")
    }
    /**
     *
     */
    class func color(string:String) -> Bool {
        return RegExp.test(string,"^#?([a-fA-F0-9]{3}){1,2}$")
    }
    /**
     *
     */
    class func webColor(string:String)->Bool {
        let webColorPattern:String = "^(?:blue|fuchsia|black|gray|grey|silver|maroon|red|orange|yellow|olive|green|teal|lime|aqua|navy|purple|white|grey1|grey2|grey3|grey4|grey5|grey6|grey7|grey8|grey9|white1|white2|white3|white4|white5|white6|white7|white8|white9)$"
        return RegExp.test(string,webColorPattern)
    }
}