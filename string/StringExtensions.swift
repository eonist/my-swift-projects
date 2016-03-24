import Foundation
/**
 * Convenince extensions for often used string methods
 */
extension String {
    var tildePath:String /*{get*/{return NSString(string: self).stringByExpandingTildeInPath}/*}*///Convenince
    /**
     * EXAMPLE: "this is cool".split(" ")//output: ["this","is","cool"]
     */
    func split(delimiter:String)->Array<String>{
        return StringParser.split(self, delimiter)
    }
    func match(pattern: String!, _ options: NSRegularExpressionOptions = NSRegularExpressionOptions.CaseInsensitive) -> [String]{//Convenince
        return RegExp.match(self, pattern, options)
    }
    func matches(pattern: String!, _ options: NSRegularExpressionOptions = NSRegularExpressionOptions.CaseInsensitive) -> [NSTextCheckingResult] {//Convenince
        return RegExp.matches(self,pattern,options)
    }
    func test(pattern:String)->Bool{//Convenince
        return RegExp.test(self, pattern)
    }
    func replace(pattern:String,_ replacement:String)->String{//Convenince
        return RegExp.replace(self,pattern, replacement)
    }
    var count:Int{return self.characters.count}//Convenince
    var cgFloat:CGFloat{return CGFloat(Double(self)!)}//TODO:you should also do the same for the Any type
    func encode()->String?{
        return StringParser.encode(self)
    }
    func decode()->String?{
        return StringParser.decode(self)
    }
    func subStr(i:Int,_ len:Int)->String{
        return StringParser.subStr(self, i, len)
    }
    func subString(beginning:Int,_ end:Int)->String{
        return StringParser.subString(self,beginning,end)
    }
    var bool:Bool {return StringParser.boolean(self)}
    /**
     * EXAMPLE: "<p>text</p>".xml//Output: xml
     */
    var xml:NSXMLElement {return NSXMLElement(self)}
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