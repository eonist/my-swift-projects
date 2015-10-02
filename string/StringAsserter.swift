/*
 * Example: Asserts if a word is duoble quated: isWrappedIn("\"abc123\"", "\"")--true
 */
func isWrappedIn(string:String, char:Character){
	return (string.first == char) and (string.last == char)
}