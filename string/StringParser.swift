import Foundation
class StringParser{
    /*
     * Returns an array for every line in a string
     */
    class func paragraphs(string:String)->Array<String>{
        return split(string,"\n")
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
        let endIndex = str.startIndex.advancedBy(end-beginning)
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
    class func color(hexColor:String, _ alpha: Float = 1.0) -> UInt{
        //Swift.print("hexColor: " + "\(hexColor)")
        let colorHexPattern:String = "(?<=^#)(?:[a-fA-F0-9]{3}){1,2}|(?<!^#)(?:[a-fA-F0-9]{3}){1,2}$";
        if(RegExp.test(hexColor,colorHexPattern)){//asserts if the color is in the correct hex format
            var hex:String = RegExp.match(hexColor, colorHexPattern)[0]
            if hex.characters.count == 3 { hex = String([hex.characters.first!,hex.characters.first!,hex.characters[hex.startIndex.advancedBy(1)],hex.characters[hex.startIndex.advancedBy(1)],hex.characters.last!,hex.characters.last!]) } //convert shorthand hex to hex
            Swift.print("hex: " + "\(hex)")
            return UInt(Float("0x"+hex)!)//<- added the 0x recently
        }else{
            let uintColor:UInt = ColorTypes.color(hexColor)
            //Swift.print("uintColor: " + "\(uintColor)")
            return uintColor;//green, blue, orange etc// :TODO: support for all of w3c color types// :TODO: move this to a method named webColor?
        }
    }
}
