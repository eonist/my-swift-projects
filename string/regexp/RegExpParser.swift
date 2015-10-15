import Foundation
class RegExpParser{
    /**
    *
    */
    class func match(){
        
    }
    
    
	/*
	 * Returns an Array with the matches 
	 * EXAMPLE: match("£4$9", "[0-9]", text: string)//Output: [4, 9]
	 * NOTE: NSRegularExpression. (has overview of the regexp syntax supported) https://developer.apple.com/library/mac/documentation/Foundation/Reference/NSRegularExpression_Class/index.html
	 * NOTE: you could try this one too: https://www.hackingwithswift.com/example-code/strings/nsregularexpression-how-to-match-regular-expressions-in-strings
     */
	class func brokenMatch(text: String!, searchPattern: String!, options:NSRegularExpressionOptions = []) -> [String] {
	    do {
	        let regex = try NSRegularExpression(pattern: searchPattern, options: options)
	        let nsString = text as NSString
	        let results = regex.matchesInString(text,options: [], range: NSMakeRange(0, nsString.length))
	        return results.map { nsString.substringWithRange($0.range)}
	    } catch let error as NSError {
	        print("invalid regexp: \(error.localizedDescription)")
	        return []//return empty array
	    }
	}
}