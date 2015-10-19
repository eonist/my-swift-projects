import Foundation

public class RegExpAsserter{
    /**
     * Asserts if a match exists
     * NOTE: NSRegularExpression. https://developer.apple.com/library/mac/documentation/Foundation/Reference/NSRegularExpression_Class/index.html
     * NOTE: for simple implimentations:  str.rangeOfString(pattern, options: .RegularExpressionSearch) != nil
     * EXAMPLE: RegExpAsserter.test("hello world","o.*o")//true
     */
    public class func test(str:String,_ pattern:String)->Bool{
        //or do something like this: return RegExpParser.match(pattern,options).count > 0
        return str.rangeOfString(pattern, options: .RegularExpressionSearch) != nil
    }
}