class StringAsserter{
	/*
	 * Example: Asserts if a word is duoble quated: isWrappedWith("\"abc123\"", "\"")--true
	 */
	static func isWrappedWith(_ string:String, _ char:Character)->Bool{
		return (string.characters.first == char) && (string.characters.last == char)
	}
	/**
	 *	Asserts whether the specified string begins with the spcified prefix.
	 *	PARAM: string: The string that the prefix will be checked against.
	 *	PARAM: prefix: The prefix that will be tested against the string.
	 *	RETURN: True if the string starts with the prefix, false if it does not.
	 */	
	static func beginsWith(_ string:String, _ prefix:String)->Bool{
        //let range = prefix.startIndex..<prefix.endIndex//create a range
        //return (prefix == string.substringWithRange(range));
        return string.hasPrefix(prefix)
	}
    /**
     * Asserts if PARAM: str ends with @param suffix
     */
    static func endWith(_ str:String, _ suffix:String)->Bool{
        return str.hasSuffix(suffix)
    }
    /**
     * Asserts if a string is the word true
     */
    static func boolean(_ string:String)->Bool{
        //Swift.print("StringAsserter.boolean()"+"\(Bool(string == "true").dynamicType)")
        return string.test("^(true|false)$")
    }
    /*
     * Check if string contains another string
     */
    static func contains(_ a:String, _ b:String)->Bool{
        return a.range(of: b) != nil//upgraded to swift 3 syntax
    }
    /**
     * Asserts if a string is a digit (10, 20px, -20px, 0.2px, -.2, 20%, 0.2)
     */
    static func digit(_ string:String)->Bool{
        return RegExp.test(string, "^-?\\d*?\\.?\\d*?(px)?$")
    }
    /**
     *
     */
    static func metric(_ string:String) -> Bool{
        return RegExp.test(string, "^-?\\d*?\\.?\\d*?(ems|%)?$")
    }
    /**
     *
     */
    static func color(_ string:String) -> Bool {
        return RegExp.test(string,"^#?([a-fA-F0-9]{3}){1,2}$")
    }
    /**
     *
     */
    static func webColor(_ string:String)->Bool {
        let webColorPattern:String = "^(?:blue|fuchsia|black|gray|grey|silver|maroon|red|orange|yellow|olive|green|teal|lime|aqua|navy|purple|white|grey1|grey2|grey3|grey4|grey5|grey6|grey7|grey8|grey9|white1|white2|white3|white4|white5|white6|white7|white8|white9)$"
        return RegExp.test(string,webColorPattern)
    }
    /**
     * Asserts if a string is in lower case
     */
    static func lowerCase(_ string:String)->Bool {
        return string == string.lowercased()
    }
	/**
	 * Asserts if PARAM: value is a percentage
	 */
	static func percentage(_ value:String)->Bool{
		return value.test(".*?(?=%)")
	}
}
