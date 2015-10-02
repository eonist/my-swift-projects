/*
 * Example: Asserts if a word is duoble quated: is_wrapped_in("\"abc123\"", "\"")--true
 */
func isWrappedIn(string:String, char:Character){
	return (string.first == char) and (string.last == char)
}