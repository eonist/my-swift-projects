class RegExpAsserter{

	/*
	 * Asserts if a match exists 
	 * NOTE: NSRegularExpression. https://developer.apple.com/library/mac/documentation/Foundation/Reference/NSRegularExpression_Class/index.html
	 */
	class func test(text: String!, pattern: String!, options:Array<String> = [])->Bool{
		return RegExpParser.match(pattern,options).count > 0
	}
}