import Foundation
/**
 * Flag (Pattern) Description:
 * i - If set, matching will take place in a case-insensitive manner.
 * x - If set, allow use of white space and #comments within patterns
 * s - If set, a "." in a pattern will match a line terminator in the input text. By default, it will not. Note that a carriage-return / line-feed pair in text behave as a single line terminator, and will match a single "." in a regular expression pattern
 * m - Control the behavior of "^" and "$" in a pattern. By default these will only match at the start and end, respectively, of the input text. If this flag is set, "^" and "$" will also match at the start and end of each line within the input text.
 * Para - Controls the behavior of \b in a pattern. If set, word boundaries are found according to the definitions of word found in Unicode UAX 29, Text Boundaries. By default, word boundaries are identified by means of a simple classification of characters as either “word” or “non-word”, which approximates traditional regular expression behavior. The results obtained with the two options can be quite different in runs of spaces and other non-word characters.
 */
public class RegExp{
    /**
     * Asserts if a match exists
     * NOTE: NSRegularExpression. https://developer.apple.com/library/mac/documentation/Foundation/Reference/NSRegularExpression_Class/index.html
     * NOTE: for simple implimentations:  str.rangeOfString(pattern, options: .RegularExpressionSearch) != nil
     * EXAMPLE: RegExp.test("hello world","o.*o")//true
     * CAUTION: upgraded in swift 3, was-> str.rangeOfString(pattern, options: .RegularExpressionSearch) != nil
     */
    static func test(_ str:String,_ pattern:String)->Bool{
        return str.range(of: pattern, options:.regularExpression) != nil//or do something like this: return RegExpParser.match(pattern,options).count > 0
    }
    /**
     * NOTE: NSRegularExpression. (has overview of the regexp syntax supported) https://developer.apple.com/library/mac/documentation/Foundation/Reference/NSRegularExpression_Class/index.html
     * NOTE: NSRegularExpressionOptions: DotMatchesLineSeparators,CaseInsensitive,AnchorsMatchLines
     * EXAMPLE: RegExp.match("My name is Taylor Swift","My name is (.*)")//Swift
     * EXAMPLE: RegExp.match("hello world","(\\b\\w+\\b)")//hello, world
     * Example: RegExpParser.match("abc 123 abc 123 abc 123 xyz", "[a-zA-Z]{3}")//["abc", "abc", "abc", "xyz"]
     * TODO: ⚠️️ Probably return optional array?
     * TODO: Then if it is outof bound return eigther an empty array or nil
     * TODO: Then only do substringwithrange if NSRange is not NSOutOfBoundRange type
     */
    static func match(_ text:String, _ pattern:String, _ options: NSRegularExpression.Options = NSRegularExpression.Options.caseInsensitive) -> [String] {
        return matches(text, pattern).map { (text as NSString).substring(with: $0.range)}
    }
    
    
    /**
     * Similar to Exec in other languages
     * NOTE: NSRegExp uses the ICU regexp syntax: http://userguide.icu-project.org/strings/regexp
     * NOTE: Use this method when doing named capturing group or location of matches
     * NOTE: use this call to get the capturing group: (str as NSString).substringWithRange(match.rangeAtIndex(1))  capturing groups from index (1 - n)
     * NOTE: use an "enum" if you need named capturing groups. like: enum FolderTaskParts:Int{ case folder = 1, content }
     * NOTE: its also possible to find number of matches this way: regex.numberOfMatchesInString(text options:[] NSMakeRange(0, nsString.length))
     * TODO: ⚠️️ Figure out how to do numbered capturing groups ($n - n is a digit. Back referencing to a capture group. n must be >= 0 and not greater than ) maybe with \$2 \$3 etc?
     * TODO: Research how to deal with swift unicode chars, emojis etc: see this: http://stackoverflow.com/questions/25882503/how-can-i-use-nsregularexpression-on-swift-strings-with-variable-width-unicode-c
     * EXAMPLE: 
     * let str = "blue:0000FF green:00FF00 red:FF0000"
     * RegExp.matches(str, "(\\w+?)\\:([A-Z0-9]+?)(?: |$)").forEach {
     *     Swift.print("match.numberOfRanges: " + "\($0.numberOfRanges)")/*The first item is the entire match*/
     *     let content = (str as NSString).substringWithRange($0.rangeAtIndex(0))/*the entire match*/
     *     let name = $0.value(str, 1)/*capturing group 1*/
     *     let value = $0.value(str, 2)/*capturing group 2*/
     * }//Outputs: name: green, value: 00FF00...and so on
     */
    static func matches(_ text:String!, _ pattern:String!, _ options:NSRegularExpression.Options = NSRegularExpression.Options.caseInsensitive) -> [NSTextCheckingResult] {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: options)
            let nsString = text as NSString
            let results = regex.matches(in: text,options: [], range: NSMakeRange(0, nsString.length))
            return results
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    /**
     * Replaces all matches with the replacment string
     * Returns Value A string with matching regular expressions replaced by the template string.
     * NOTE: you can use this call replaceMatchesInString to modify the original string, must use nsmutablestring to do this
     * NOTE: NSRegularExpression. https://developer.apple.com/library/mac/documentation/Foundation/Reference/NSRegularExpression_Class/index.html
     * PARAM: string The string to search for values within.
     * PARAM: options: The matching options to use. See NSMatchingOptions for possible values.
     * PARAM: range: The range of the string to search.
     * PARAM: replacement: The substitution template used when replacing matching instances.
     * TODO: The PARAM: text should be inout
     * TODO: move to RegExpModifer, or just create RegExpUtils for all?
     * EXAMPLE: RegExp.replace("<strong>Hell</strong>o, <strong>Hell</strong>o, <strong>Hell</strong>o", "<\\/?strong>",  "*")//Output:  "*Hell*o, *Hell*o, *Hell*o"
     * EXAMPLE: RegExp.replace("yeah yeah","(\\b\\w+\\b)", "bla")//bla bla
     */
    static func replace(_ str:String,_ pattern:String,_ replacement:String,_ options:NSRegularExpression.Options = NSRegularExpression.Options.caseInsensitive)->String{
        do {
            let stringlength = str.characters.count
            let regex = try NSRegularExpression(pattern:pattern , options: options)
            let modString = regex.stringByReplacingMatches(in: str, options: [], range: NSMakeRange(0, stringlength), withTemplate: replacement)
            return modString
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            return ""
        }
    }
    /**
     * Extracts associated capture groups from the RegExp.matches result
     * TODO: ⚠️️ Would be great if .rawValue was done inside this method, can be done with <T> possibly look at the apple docs about enumerations
     * EXAMPLE: RegExp.value(fullString,match,StatusParts.second.rawValue)
     * TODO: ⚠️️ you should check if there is content in the range first, if ther eis not return nilor error
     */
    static func value(_ str:String, _ result:NSTextCheckingResult, _ key:Int)->String{
        return (str as NSString).substring(with: result.rangeAt(key))
    }
    /**
     * New, finds first index of pattern in string
     */
    static func search(_ input:String, _ pattern:String,_ options: NSRegularExpression.Options = NSRegularExpression.Options.caseInsensitive) -> Int?{
        guard let range = input.range(of: pattern, options:.regularExpression) else{return nil}
        return input.distance(from:input.startIndex,to:range.lowerBound)
    }
}
extension NSTextCheckingResult{
    func value(_ str:String, _ key:Int)->String{//Convenience
        return RegExp.value(str, self, key)
    }
}
/*
Research:

**Wrappers:**
http://benscheirman.com/2014/06/regex-in-swift/

https://github.com/glaurent/SwiftRegExp/blob/master/RegExp.swift

https://gist.github.com/ningsuhen/dc6e589be7f5a41e7794

//matches:
http://stackoverflow.com/questions/27880650/swift-extract-regex-matches

//comprehensive tutorial:
http://www.raywenderlich.com/86205/nsregularexpression-swift-tutorial

//uses an infix =- as a shortcut to regexp match:
https://github.com/kasei/SwiftRegex/blob/master/SwiftRegex/SwiftRegex.swift
http://nomothetis.svbtle.com/clean-regular-expressions-using-conversions

//Extension: has a replacer method:
https://gist.github.com/ningsuhen/dc6e589be7f5a41e7794

//find individual groups:
http://stackoverflow.com/questions/9601551/extract-parts-from-regular-expression-with-nsregularexpression?rq=1

//named capturing groups (sort of)
http://stackoverflow.com/questions/24814974/named-capture-groups-with-nsregularexpression?lq=1
*/
