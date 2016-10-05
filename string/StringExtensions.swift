import Foundation
/**
 * Convenince extensions for often used string methods
 */
extension String {
    var tildePath:String /*{get*/{return NSString(string: self).stringByExpandingTildeInPath}/*}*///Convenince
    /**
     * EXAMPLE: "this is cool".split(" ")//output: ["this","is","cool"]
     */
    func split(delimiter:String)->Array<String>{//convenience
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
    var double:Double{return Double(self)!}
    /**
     * CAUTION: if you do "0xFF0000FF".uint it will give the wrong value, use UInt(Double("")!) instead for cases like that
     */
    var uint:UInt{return UInt(Float(self)!)}
    var int:Int{return Int(Float(self)!)}
    
    func encode()->String?{//convenience
        return StringParser.encode(self)
    }
    func decode()->String?{//convenience
        return StringParser.decode(self)
    }
    func subStr(i:Int,_ len:Int)->String{//convenience
        return StringParser.subStr(self, i, len)
    }
    func subString(beginning:Int,_ end:Int)->String{//convenience
        return StringParser.subString(self,beginning,end)
    }
    func indexOf(b:String)->Int{//convenience
        return StringParser.indexOf(self, b)
    }
    var bool:Bool {return StringParser.boolean(self)}
    /**
     * EXAMPLE: "<p>text</p>".xml//Output: xml
     */
    var xml:XML {return XML(self)}//Convenince
    var url:NSURL {return FilePathParser.path(self)}//Convenince
}
extension NSString{
    var string:String {return String(self)}/*Convenience*/
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