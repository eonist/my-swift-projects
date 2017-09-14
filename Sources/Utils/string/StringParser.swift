import Cocoa
class StringParser{
    enum Pattern{
        static let digit:String = "^(\\-?\\d*?\\.?\\d*?)(px|$)"//\-?\d*?(\.?)((?1)\d+?(?=px)
        static let path:String = "^.*?\\/(?=\\w*?\\.\\w*?$)"
        static let fileName:String = "^.*?\\/(\\w*?\\.\\w*?$)"
        static let colorHex:String = "(?<=^#)(?:[a-fA-F0-9]{3}){1,2}|(?<!^#)(?:[a-fA-F0-9]{3}){1,2}$"
    }
    /**
     * Returns encode text (escaped)
     * Caution: encode does not handle the double quote char very well
     * Note: this could also be done by creating a a method that does all the character trickery involved in unescaping/escaping text, but this method leverages the php language to do all this for us
     * Example: encode("<image location:files/img/image.jpg")--%3Cimage+location%3Afiles%2Fimg%2Fimage.jpg
     * EXAMPLE: "testing this stuff.121".encode//testing%20this%20stuff.121
     */
    static func encode(_ str:String)->String?{
        return str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
    /**
     * Returns dencode text (unescaped)
     * NOTE: this could also be done by creating a method that does all the character trickery involved in unescaping/escaping text, but this method leverages the php language to do all this for us
     * CAUTION: if your string has the % sign. Then a suggestion is to encode it first
     * Example: decode(%3Cimage+location%3Afiles%2Fimg%2Fimage.jpg)--<image location:files/img/image.jpg
     * EXAMPLE: "testing%20this%20stuff.121".decode//testing this stuff.121
     */
    static func decode(_ str:String)->String?{
        return str.removingPercentEncoding//swift 3 upgrade was -> stringByRemovingPercentEncoding
    }
    /**
     * Returns an array for every line in a string
     */
    static func paragraphs(_ string:String)->[String]{
        var result = split(string,"\n")
        result.removeLast()/*if the string is empty it still returns a result as [""] and if the string is not empty it returns plus one empty string. so we pop the last one of the array*/
        return result
    }
	/**
     * Returns an Array of words derived from PARAM str by splitting it at every PARAM delimiter
     * EXAMPLE: components("Berlin, Paris, New York, San Francisco")//Returns an array with the following values:  ["Berlin", " Paris", " New York", " San Francisco"]
	 * NOTE: use "\n" to retrive paragraphs
     * NOTE: The opposit of this method is StringModifier.combine(array," ")
     */
	static func split(_ string:String,_ delimiter:String)->[String]{
		return string.components(separatedBy:delimiter)
	}
	static func firstWord(_ string:String)->String {
       return string.components(separatedBy: " ")[0]
    }
    /**
     * Returns the last char
     */
   static func lastChar(_ string:String)->String {
        //let lastCharIndex:Int = string.characters.count - 1
        //print(lastCharIndex)
        return String(describing: string.characters.last)//swift 3 upgrade -> was: String()
    }
    /**
	 * substring("Hello from Paris, Texas!!!", 11,15); // output: Pari
	 */
    static func subString(_ str:String,_ beginning:Int,_ end:Int)->String{
        let range = str.stringRange(str, beginning, end:end)
        let retVal = str[range.start..<range.end]//swift 4 upgrade, was: return str.substring(with:range)
        return String(retVal)
    }
    /**
     * substr("Hello from Paris, Texas!!!",11,15); // output: Paris, Texas!!!
     */
    static func subStr(_ str:String, _ beginning:Int,_ len:Int)->String{
        let range = str.stringRange(str, beginning, len:len)
        let retVal = str[range.start..<range.end]//swift 4 upgrade, was: return str.substring(with:range)
        return String(retVal)
    }
    /**
     * Returns an array comprised of two strings that is the result of splitting the @param str
     * EXAMPLE: splitAt("Hello, playground",5)//["hello"," playground"]
     * NOTE: it may be faster to do it with this: str.substringWithRange(Range(start:str.startIndex , end:str.startIndex.advancedBy(index) ))   and str.substringWithRange(Range(start:str.startIndex.advancedBy(index) , end:str.endIndex ))
     */
	static func splitAt(_ str:String, _ index:Int)->[String] {
		let a:String = subStr(str,0,index)
		let b:String = subStr(str,index,str.characters.count)
		return [a,b]
	}
    
    /**
     * Returns the index of the first match of PARAM: b in PARAM: a
     * New: if the PARAM: b isnt present in PARAM a then return -1 indicating the string was not found
     */
    static func indexOf(_ a:String,_ b:String)->Int{
        guard let range:Range<String.Index> = StringRangeParser.rangeOf(a,b) else {return -1}
        return a.distance(from:a.startIndex,to:range.lowerBound)
    }
    /**
     * Returns str sans the first char
     * NOTE: does not modify the original string
     */
    static func sansPrefix(_ str:String)->String{
        return String(str.characters.dropFirst())
    }
    /**
     * Returns str sans the last char
     * NOTE: does not modify the original string
     */
    static func sansSuffix(_ str:String)->String{
        return String(str.characters.dropLast())
    }
    /**
     * NOTE: only works with Character (make one that supports longer strings later)
     */
    static func trim(_ str:String,_ left:Character,_ right:Character)->String{
        var str = str
        str = trimLeft(str,right)
        str = trimRight(str,right)
        return str
    }
    /**
     * New
     */
    static func trimLeft(_ str:String,_ left:Character)->String{
        var str = str
        if str.characters.first == left {str = String(str.characters.dropFirst())}
        return str
    }
    /**
     * New
     * TODO: ⚠️️ Create trimRight for str as well
     */
    static func trimRight(_ str:String,_ right:Character)->String{
        var str = str
        if str.characters.last == right {str = String(str.characters.dropLast())}
        return str
    }
    /**
     * Convenience
     * EXAMPLE:  "32\n".trim("\n").int//32
     */
    static func trim(_ str:String,_ leftAndRight:Character)->String{
        return trim(str, leftAndRight, leftAndRight)
    }
    /**
     * Returns the percentage as a CGFloat
     */
    static func percentage(_ value:String)->CGFloat{
        return value.match(".*?(?=%)")[0].cgFloat
    }
    
    /**
     * Returns a digit as a Number or a String type (suffix are removed from the return value)
     * RETURN: a Numberor a String type
     * PARAM: string can be 10, 20px, -20px, 0.2px, -.2, 20%, 0.2
     * NOTE: if the digit has a trailing % character it is returned as a String
     * TODO: ⚠️️ This could probably be simpler if you just added a none capturing group and used regexp.match
     */
    static func digit(_ string:String)->CGFloat{
        let matches = RegExp.matches(string, Pattern.digit)
        let match:NSTextCheckingResult = matches[0]
        let value:String = RegExp.value(string, match, 1)
        return value.cgFloat
    }
    static func boolean(_ string:String) -> Bool {
        return string == "true"
    }
    /**
     * NOTE: Supports 5 hex color formats: #FF0000,0xFF0000, FF0000, F00,(red,purple,pink and other web colors)
     * Returns an rgb value
     * TODO: //green, blue, orange etc// :TODO: support for all of w3c color types
     * TODO: move this to a method named webColor?
     */
    static func color(_ hexColor:String) -> UInt{
        if(hexColor.test(Pattern.colorHex)){/*asserts if the color is in the correct hex format*/
            //⚠️️⚠️️⚠️️⚠️️TODO: use native firstMatch instead of the bellow line, its way faster⚠️️⚠️️⚠️️⚠️️
            var hex:String = RegExp.match(hexColor, Pattern.colorHex)[0]
            if hex.characters.count == 3 {
                hex = String([hex.characters.first!,hex.characters.first!,hex.characters[hex.index(hex.startIndex,offsetBy:1)],hex.characters[hex.index(hex.startIndex,offsetBy:1)],hex.characters.last!,hex.characters.last!])//upgraded to swift 3
            }/*Convert shorthand hex to hex*/
            return ("0x"+hex).uint
        }else{
            return ColorTypes.color(hexColor)
        }
    }
    /**
     * Returns NSColor for variouse literal color formats 
     */
    static func nsColor(_ hexColor:String)->NSColor{
        return StringParser.color(hexColor).color
    }
    /**
     * Returns a file path, excluding the file name and file-suffix
     * PARAM: input: usually formated like: /Users/James/Downloads/PanelView.png
     * RETURN: a string formatted like: /Users/James/Downloads/
     * EXAMPLE: path(Users/User/Desktop/main.css);//Users/User/Desktop/
     * NOTE: you can also do this another way:
     * var match : Array = input.split(".");
     * var path:String = String(match[0]).substring(0, String(match[0]).lastIndexOf("/"));
     * NOTE: ⚠️️ There is also a native way if you look through NSURL
     */
    static func path(_ url:String)->String {
        return url.match(Pattern.path)[0]
    }
    /**
     * NOTE: There is also a native way if you look through NSURL
     */
    static func fileName(_ url:String)->String {
        return url.match(Pattern.fileName)[1]
    }
    /**
     * Works with \n and \r
     */
    static func lineCount(_ str:String)->Int{
        let newLineSet = NSCharacterSet.newlines
        let arr = str.components(separatedBy:newLineSet)
        let count = arr.count
        return count
    }
    /**
     * Returns the cooresponding String.Index for PARAM: index:Int
     * Example: "🚀ship".idx(1)//the String.Index between 🚀 and ship
     */
    static func idx(_ str:String,_ index:Int) -> String.Index {
        return str.index(str.startIndex, offsetBy: index)/*Upgraded to swift 3-> was: startIndex.advancedBy*/
    }
    /**
     * Basically enables you to convert a string to any kind of Array of char in any kind of type
     * EXAMPLE: "001".array({$0.int}) -> [0,0,1]
     */
    static func array<T>(_ str:String, _ cast:(_ char:Character)->T)->[T]{
        let arr:[T] = str.characters.map{cast($0)}
        return arr
    }
    /**
     * Counts how many times a string appears in a string
     */
    static func occurrences(){
        //impliment this
    }
    /**
     * EXAMPLE: pad(value:6,padCount:3,padStr:"0")//"006"
     */
    static func pad(value:Int,padCount:Int,padStr:String) -> String{
        var padding:String {return padStr * (padCount - value.string.count)}
        return value.string.count < padCount ? padding + value.string : value.string
    }
}
