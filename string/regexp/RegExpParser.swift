import Foundation
public class RegExpParser{
    /**
    * EXAMPLE: test("hello world","o.*o")//true
    * NOTE: for simple implimentations:  str.rangeOfString(pattern, options: .RegularExpressionSearch) != nil
    */
    public class func test(str:String,_ pattern:String)->Bool{
        return str.rangeOfString(pattern, options: .RegularExpressionSearch) != nil
    }
    /*
    * NOTE: NSRegularExpression. (has overview of the regexp syntax supported) https://developer.apple.com/library/mac/documentation/Foundation/Reference/NSRegularExpression_Class/index.html
    * EXAMPLE: match("My name is Taylor Swift","My name is (.*)",NSRegularExpressionOptions.CaseInsensitive)
    */
    public class func match(text: String!, _ regex: String!, _ options: NSRegularExpressionOptions = []) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex, options: options)
            let nsString = text as NSString
            let results = regex.matchesInString(text,options: [], range: NSMakeRange(0, nsString.length))
            return results.map { nsString.substringWithRange($0.range)}
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    /*
    * TODO: The @param text should be inout
    * TODO: move to RegExpModifer, or just create RegExpUtils for all?
    */
    public class func replace(str:String,_ pattern:String,_ replacement:String,_ options:NSRegularExpressionOptions)->String{
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
    /*
    
    //whats wrong with this:
    
    public class func replace(text:String, _ regex: String, _ replacement: String,_ options: NSRegularExpressionOptions = []) -> String {
    do {
    let regex = try NSRegularExpression(pattern: regex, options: options)
    let range: NSRange = NSMakeRange(0, text.characters.count)
    regex.stringByReplacingMatchesInString(text, options: .Anchored, range: range, withTemplate: replacement)
    return text
    } catch let error as NSError {
    print("invalid regex: \(error.localizedDescription)")
    return ""
    }
    /*
    let matches = match(str,pattern)
    let range: NSRange = NSMakeRange(0, str.characters.count)
    
    return
    
    return ""
    */
    }
    
    
    */
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
    
    */
    
}