import Foundation

public class RegExpParser{
    /*
     * NOTE: NSRegularExpression. (has overview of the regexp syntax supported) https://developer.apple.com/library/mac/documentation/Foundation/Reference/NSRegularExpression_Class/index.html
     * EXAMPLE: match("My name is Taylor Swift","My name is (.*)")//Swift
     * EXAMPLE: RegExpParser.match("hello world","(\\b\\w+\\b)")//hello, world
     */
    public class func match(text: String!, _ pattern: String!, _ options: NSRegularExpressionOptions = NSRegularExpressionOptions.CaseInsensitive) -> [String] {
        return matches(text, pattern).map { (text as NSString).substringWithRange($0.range)}
    }
    /**
     * NOTE: Use this method when doing named capturing group
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