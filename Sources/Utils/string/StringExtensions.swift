import Cocoa
/**
 * Convenince extensions for often used string methods
 */
extension String {
    //init(_ value:Any) doesnt work as String("hello".reversed()) must go through 
    init(_ value:CGFloat){self.init(describing:value)}/*Brings back simple String casting which was removed in swift 3*/
    init(_ value:Int){self.init(describing:value)}/*Brings back simple String casting which was removed in swift 3*/
    init(_ value:Bool){ self.init(describing:value)}/*Brings back simple String casting which was removed in swift 3*/
    
    var tildePath:String /*{get*/{return NSString(string: self).expandingTildeInPath}/*}*//*Convenince*/
    /**
     * EXAMPLE: "this is cool".split(" ")//output: ["this","is","cool"]
     */
    func split(_ delimiter:String)->[String]{/*Convenince*/
        return StringParser.split(self, delimiter)
    }
    func match(_ pattern: String!, _ options: NSRegularExpression.Options = NSRegularExpression.Options.caseInsensitive) -> [String]{//Convenince
        return RegExp.match(self, pattern, options)
    }
    func matches(_ pattern: String!, _ options: NSRegularExpression.Options = NSRegularExpression.Options.caseInsensitive) -> [NSTextCheckingResult] {//Convenince
        return RegExp.matches(self,pattern,options)
    }
    func test(_ pattern:String)->Bool{/*Convenince*/
        return RegExp.test(self, pattern)
    }
    func replace(_ pattern:String,_ replacement:String)->String{/*Convenince*/
        return RegExp.replace(self,pattern, replacement)
    }
    var count:Int{return self.characters.count}/*Convenince*/
    var cgFloat:CGFloat{return CGFloat(Double(self)!)}//TODO:you should also do the same for the Any type
    var double:Double{return Double(self)!}
    /**
     * CAUTION: if you do "0xFF0000FF".uint it will give the wrong value, use UInt(Double("")!) instead for cases like that
     */
    var uint:UInt{return UInt(Float(self)!)}
    var int:Int{return Int(self)!}
    
    func encode()->String?{/*Convenince*/
        return StringParser.encode(self)
    }
    func decode()->String?{/*Convenince*/
        return StringParser.decode(self)
    }
    func subStr(_ i:Int,_ len:Int)->String{/*Convenince*/
        return StringParser.subStr(self, i, len)
    }
    func subString(_ beginning:Int,_ end:Int)->String{/*Convenince*/
        return StringParser.subString(self,beginning,end)
    }
    func indexOf(_ b:String)->Int{/*Convenince*/
        return StringParser.indexOf(self, b)
    }
    func trim(_ leftAndRight:Character)->String{/*Convenince*/
        return StringParser.trim(self, leftAndRight)
    }
    func insertCharsAt(_ charsAndIndicies:[(char:Character,index:Int)])->String{
        return StringModifier.insertCharsAt(self, charsAndIndicies)
    }
    func idx(_ index:Int) -> String.Index{
        return StringParser.idx(self, index)
    }
    var bool:Bool {return StringParser.boolean(self)}
    /**
     * EXAMPLE: "<p>text</p>".xml//Output: xml
     */
    var xml:XML {return XML(self)}/*Convenince*/
    var url:URL {return FilePathParser.path(self)}/*Convenince*/
    var lineCount:Int{return StringParser.lineCount(self)}
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
    for _ in 0 ..< right{
        result += left
    }
    return result
}
