class RegExpParser{
	/*
	 * Returns an Array with the matches 
	 * EXAMPLE: match("£4$9", "[0-9]", text: string)//Output: [4, 9]
	 * NOTE: NSRegularExpression. https://developer.apple.com/library/mac/documentation/Foundation/Reference/NSRegularExpression_Class/index.html
	 */
	func match(text: String!, pattern: String!, options:Array = []) -> [String] {
	    do {
	        let regex = try NSRegularExpression(pattern: regex, options: [])
	        let nsString = text as NSString
	        let results = regex.matchesInString(text,options: [], range: NSMakeRange(0, nsString.length))
	        return results.map { nsString.substringWithRange($0.range)}
	    } catch let error as NSError {
	        print("invalid regexp: \(error.localizedDescription)")
	        return []
	    }
	}
}