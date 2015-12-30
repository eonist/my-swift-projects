import Foundation

/**
 * Convenince extensions for often used string methods
 */
extension String {
    /**
     * Convenince
     */
    var tildePath:String {get{return NSString(string: self).stringByExpandingTildeInPath}}
    /**
     * EXAMPLE: "this is cool".split(" ")//output: ["this","is","cool"]
     */
    func split(delimiter:String)->Array<String>{
        return StringParser.split(self, delimiter)
    }
    /**
     * Convenince
     */
    func match(pattern: String!, _ options: NSRegularExpressionOptions = NSRegularExpressionOptions.CaseInsensitive) -> [String]{
        return RegExp.match(self, pattern, options)
    }
    /**
     * Convenince
     */
    func matches(pattern: String!, _ options: NSRegularExpressionOptions = NSRegularExpressionOptions.CaseInsensitive) -> [NSTextCheckingResult] {
        return RegExp.matches(self,pattern,options)
    }
    /**
     * Convenince
     */
    func test(pattern:String)->Bool{
        return RegExp.test(self, pattern)
    }
    /**
     * Convenince
     */
    func replace(pattern:String,_ replacement:String)->String{
        return RegExp.replace(self,pattern, replacement)
    }
    /**
     * Convenince
     */
    var count:Int{return self.characters.count}
}
/**
 * Multiplies a string
 * EXAMPLE: "hello" * 3 //hellohellohello
 */
public func * (left: String, right: Int) -> String {
    var result:String = ""
    for var i = 0; i < right; ++i{
        result += left
    }
    return result
}