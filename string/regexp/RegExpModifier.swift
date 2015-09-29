/*
 * Replaces all matches with the replacment string
 string The string to search for values within.
options The matching options to use. See NSMatchingOptions for possible values.
range	The range of the string to search.
template	The substitution template used when replacing matching instances.
Return Value A string with matching regular expressions replaced by the template string.

 * NOTE: NSRegularExpression. https://developer.apple.com/library/mac/documentation/Foundation/Reference/NSRegularExpression_Class/index.html
 */
func replace(text: String!, pattern: String!,replacement:String,options:Array = []){
	//not implemented yet
	func stringByReplacingMatchesInString(_ string: String,
                              options options: NSMatchingOptions,
                                range range: NSRange,
                         withTemplate templ: String) -> String
}

Description:
i - If set, matching will take place in a case-insensitive manner.
x - If set, allow use of white space and #comments within patterns
s - If set, a "." in a pattern will match a line terminator in the input text. By default, it will not. Note that a carriage-return / line-feed pair in text behave as a single line terminator, and will match a single "." in a regular expression pattern
m - Control the behavior of "^" and "$" in a pattern. By default these will only match at the start and end, respectively, of the input text. If this flag is set, "^" and "$" will also match at the start and end of each line within the input text.
Para - Controls the behavior of \b in a pattern. If set, word boundaries are found according to the definitions of word found in Unicode UAX 29, Text Boundaries. By default, word boundaries are identified by means of a simple classification of characters as either “word” or “non-word”, which approximates traditional regular expression behavior. The results obtained with the two options can be quite different in runs of spaces and other non-word characters.