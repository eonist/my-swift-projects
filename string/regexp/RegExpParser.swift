import Foundation

public class RegExpParser{
    /*
     * NOTE: NSRegularExpression. (has overview of the regexp syntax supported) https://developer.apple.com/library/mac/documentation/Foundation/Reference/NSRegularExpression_Class/index.html
     * EXAMPLE: match("My name is Taylor Swift","My name is (.*)")//Swift
     * EXAMPLE: RegExpParser.match("hello world","(\\b\\w+\\b)")//hello, world
     * NOTE: NSRegularExpressionOptions: DotMatchesLineSeparators,CaseInsensitive,AnchorsMatchLines
     */
    public class func match(text: String!, _ pattern: String!, _ options: NSRegularExpressionOptions = NSRegularExpressionOptions.CaseInsensitive) -> [String] {
        return matches(text, pattern).map { (text as NSString).substringWithRange($0.range)}
    }
    /**
     * NOTE: NSRegExp uses the ICU regexp syntax: http://userguide.icu-project.org/strings/regexp
     * NOTE: Use this method when doing named capturing group or location of matches
     * Note: use this call to get the capturing group: (str as NSString).substringWithRange(match.rangeAtIndex(1))  capturing groups from index (1 - n)
     * NOTE: use an "enum" if you need named capturing groups. like: enum FolderTaskParts:Int{ case folder = 1, content }
     * TODO: Figure out how to do numbered capturing groups ($n - n is a digit. Back referencing to a capture group. n must be >= 0 and not greater than ) maybe with \$2 \$3 etc?
     * TODO: Research how to deal with swift unicode chars, emojis etc: see this: http://stackoverflow.com/questions/25882503/how-can-i-use-nsregularexpression-on-swift-strings-with-variable-width-unicode-c
     * NOTE: its also possible to find number of matches this way: regex.numberOfMatchesInString(text options:[] NSMakeRange(0, nsString.length))
     */
    public class func matches(text: String!, _ pattern: String!, _ options: NSRegularExpressionOptions = NSRegularExpressionOptions.CaseInsensitive) -> [NSTextCheckingResult] {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: options)
            let nsString = text as NSString
            let results = regex.matchesInString(text,options: [], range: NSMakeRange(0, nsString.length))
            return results
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
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