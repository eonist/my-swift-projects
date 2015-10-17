import Foundation
/*
 * Flag (Pattern) Description:
 * i - If set, matching will take place in a case-insensitive manner.
 * x - If set, allow use of white space and #comments within patterns
 * s - If set, a "." in a pattern will match a line terminator in the input text. By default, it will not. Note that a carriage-return / line-feed pair in text behave as a single line terminator, and will match a single "." in a regular expression pattern
 * m - Control the behavior of "^" and "$" in a pattern. By default these will only match at the start and end, respectively, of the input text. If this flag is set, "^" and "$" will also match at the start and end of each line within the input text.
 * Para - Controls the behavior of \b in a pattern. If set, word boundaries are found according to the definitions of word found in Unicode UAX 29, Text Boundaries. By default, word boundaries are identified by means of a simple classification of characters as either “word” or “non-word”, which approximates traditional regular expression behavior. The results obtained with the two options can be quite different in runs of spaces and other non-word characters.
 */

public class RegExpModifier{
	/*
	 * Replaces all matches with the replacment string
	 * NOTE: you can use this call replaceMatchesInString to modify the original string, must use nsmutablestring to do this
	 * @param string The string to search for values within.
	 * @param options: The matching options to use. See NSMatchingOptions for possible values.
	 * @param range: The range of the string to search.
	 * @param replacement: The substitution template used when replacing matching instances.
     * Returns Value A string with matching regular expressions replaced by the template string.
	 * EXAMPLE: RegExpModifier.replace("<strong>Hell</strong>o, <strong>Hell</strong>o, <strong>Hell</strong>o", "<\\/?strong>",  "*")//Output:  "*Hell*o, *Hell*o, *Hell*o"
     * EXAMPLE: RegExpModifier.replace("yeah yeah","(\\b\\w+\\b)", "bla")//bla bla
     * NOTE: NSRegularExpression. https://developer.apple.com/library/mac/documentation/Foundation/Reference/NSRegularExpression_Class/index.html
     * TODO: The @param text should be inout
     * TODO: move to RegExpModifer, or just create RegExpUtils for all?
     */
    public class func replace(str:String,_ pattern:String,_ replacement:String,_ options:NSRegularExpressionOptions = NSRegularExpressionOptions.CaseInsensitive)->String{
        do {
            let stringlength = str.characters.count
            let regex = try NSRegularExpression(pattern:pattern , options: options)
            let modString = regex.stringByReplacingMatchesInString(str, options: [], range: NSMakeRange(0, stringlength), withTemplate: replacement)
            //print(modString)
            return modString
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            return ""
        }
    }
}