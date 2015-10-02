/*
 * Example: Asserts if a word is duoble quated: isWrappedWith("\"abc123\"", "\"")--true
 */
func isWrappedWith(string:String, char:Character){
	return (string.first == char) and (string.last == char)
}