import Foundation
class StringParser{
    /**
     * Returns encode text (escaped)
     * Caution: encode does not handle the double quote char very well
     * Note: this could also be done by creating a a method that does all the character trickery involved in unescaping/escaping text, but this method leverages the php language to do all this for us
     * Example: encode("<image location:files/img/image.jpg")--%3Cimage+location%3Afiles%2Fimg%2Fimage.jpg
     * EXAMPLE: "testing this stuff.121".encode//testing%20this%20stuff.121
     */
    class func encode(str:String)->String?{
        return str.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLPathAllowedCharacterSet())
    }
    /**
     * Returns dencode text (unescaped)
     * Note this could also be done by creating a a method that does all the character trickery involved in unescaping/escaping text, but this method leverages the php language to do all this for us
     * Example: decode(%3Cimage+location%3Afiles%2Fimg%2Fimage.jpg)--<image location:files/img/image.jpg
     * EXAMPLE: "testing%20this%20stuff.121".decode//testing this stuff.121
     */
    class func decode(str:String)->String?{
        return str.stringByRemovingPercentEncoding
    }
    /*
     * Returns an array for every line in a string
     */
    class func paragraphs(string:String)->Array<String>{
        var result = split(string,"\n")
        result.removeLast()//if the string is empty it still returns a result as [""] and if the string is not empty it returns plus one empty string. so we pop the last one of the array
        return result
    }
	/**
     * Returns an Array of words derived from @param str by splitting it at every @param delimiter
     * EXAMPLE: components("Berlin, Paris, New York, San Francisco")//Returns an array with the following values:  ["Berlin", " Paris", " New York", " San Francisco"]
	 * NOTE: use "\n" to retrive paragraphs
     * NOTE: the opposit of this method is StringModifier.combine(array," ")
     */
	class func split(string:String,_ delimiter:String)->Array<String>{
		return string.componentsSeparatedByString(delimiter)
	}
    /*
     *
     */
	class func firstWord(string:String)->String {
       return string.componentsSeparatedByString(" ")[0]
    }
    /*
     * Returns the
     */
   class func lastChar(string:String)->String {
        let lastCharIndex:Int = string.characters.count - 1
        print(lastCharIndex)
        return String(string.characters.last)
    }
    /**
	 * substring("Hello from Paris, Texas!!!", 11,15); // output: Pari
	 */
    class func subString(str:String,_ beginning:Int,_ end:Int)->String{
        let startIndex = str.startIndex.advancedBy(beginning)
        let endIndex = str.startIndex.advancedBy(end/*-beginning*/)//<--this was a bug
        let range:Range = Range(start:startIndex,end:endIndex)
        return str.substringWithRange(range)
    }
    /**
     * substr("Hello from Paris, Texas!!!",11,15); // output: Paris, Texas!!!
     */
    class func subStr(str:String, _ beginning:Int,_ len:Int)->String{
        let startIndex = str.startIndex.advancedBy(beginning)
        let endIndex = str.startIndex.advancedBy(beginning+len)
        let range:Range = Range(start:startIndex,end:endIndex)
        return str.substringWithRange(range)
    }
    /*
     * Returns an array comprised of two strings that is the result of splitting the @param str
     * splitAt("Hello, playground",5)//["hello"," playground"]
     * NOTE: it may be faster to do it with this: str.substringWithRange(Range(start:str.startIndex , end:str.startIndex.advancedBy(index) ))   and str.substringWithRange(Range(start:str.startIndex.advancedBy(index) , end:str.endIndex ))
     */
	class func splitAt(str:String, _ index:Int)->Array<String> {
		let a:String =  subStr(str,0,index)
		let b:String =  subStr(str,index,str.characters.count)
		return [a,b]
	}
    /*
     * Counts how many times a string appears in a string
     */
    class func occurrences(){
        //impliment this
    }
    /**
     * Returns the index of the first match of @param b in @param a
     */
    class func indexOf(a:String,_ b:String)->Int{
        let range:Range<String.Index> = StringRangeParser.rangeOf(a,b)
        return a.startIndex.distanceTo(range.startIndex)
    }
    /**
     * Returns str sans the first char
     * @Note does not modify the original string
     */
    class func sansPrefix(str:String)->String{
        return String(str.characters.dropFirst())
    }
    /**
     * Returns str sans the last char
     * @Note does not modify the original string
     */
    class func sansSuffix(str:String)->String{
        return String(str.characters.dropLast())
    }
    /**
     * Returns the percentage as a CGFloat
     */
    class func percentage(value:String)->CGFloat{
        return CGFloat(Double(value.match(".*?(?=%)")[0])!)
    }
    /**
     * Returns a digit as a Number or a String type (suffix are removed from the return value)
     * @param string can be 10, 20px, -20px, 0.2px, -.2, 20%, 0.2
     * @return a Numberor a String type
     * @Note if the digit has a trailing % character it is returned as a String
     * TODO: this could probably be simpler if you just added a none capturing group and used regexp.match
     */
    class func digit(string:String)->CGFloat{
        //Swift.print("string: " + string)
        let pattern:String = "^(\\-?\\d*?\\.?\\d*?)(px|$)"// :TODO: possible rewrite: \-?\d*?(\.?)((?1)\d+?(?=px) or alike
        let matches = RegExp.matches(string, pattern)
        let match:NSTextCheckingResult = matches[0]
        let value:String = RegExp.value(string, match, 1)
        //Swift.print("match.numberOfRanges: " + "\(match.numberOfRanges)")
        //Swift.print("value: " + value)
        return CGFloat(Double(value)!)
    }
    /**
     *
     */
    class func boolean(string:String) -> Bool {
        return string == "true";
    }
    /**
     * NOTE: Supports 5 hex color formats: #FF0000,0xFF0000, FF0000, F00,red
     * Returns an rgb value
     */
    class func color(hexColor:String) -> UInt{
        //Swift.print("StringParser.hexColor: " + "\(hexColor)")
        let colorHexPattern:String = "(?<=^#)(?:[a-fA-F0-9]{3}){1,2}|(?<!^#)(?:[a-fA-F0-9]{3}){1,2}$";
        if(RegExp.test(hexColor,colorHexPattern)){//asserts if the color is in the correct hex format
            var hex:String = RegExp.match(hexColor, colorHexPattern)[0]
            if hex.characters.count == 3 { hex = String([hex.characters.first!,hex.characters.first!,hex.characters[hex.startIndex.advancedBy(1)],hex.characters[hex.startIndex.advancedBy(1)],hex.characters.last!,hex.characters.last!]) } //convert shorthand hex to hex
            //Swift.print("StringParser.hexColor() hex: " + "\(hex)")
            return UInt(Float("0x"+hex)!)//<- added the 0x recently
        }else{
            let uintColor:UInt = ColorTypes.color(hexColor)
            //Swift.print("uintColor: " + "\(uintColor)")
            return uintColor;//green, blue, orange etc// :TODO: support for all of w3c color types// :TODO: move this to a method named webColor?
        }
    }
    /**
     * Returns a file path, excluding the file name and file-suffix
     * @param input: usually formated like: /Users/James/Downloads/PanelView.png
     * @return a string formatted like: /Users/James/Downloads/
     * @Example path(file://Users/User/Desktop/main.css);//file://Users/User/Desktop/
     * @Note you can also do this another way:
     * var match : Array = input.split(".");
     * var path:String = String(match[0]).substring(0, String(match[0]).lastIndexOf("/"));
     */
    class func path(url:String)->String {
        return url.match("^.*?\\/(?=\\w*?\\.\\w*?$)")[0]
    }
    /**
     *
     */
    class func fileName(url:String)->String {
        return url.match("^.*?\\/(\\w*?\\.\\w*?$)")[1]
    }
}