class StringParser{
	/*
	 * return array for every line in a string 
	 */
	class func paragraphs(string:String){
		split(string,"\n")
	}
	/**
	 * NOTE: use "\n" to retrive paragraphs
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
     *
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
    func subStr(str:String, _ beginning:Int,_ len:Int)->String{
        let startIndex = str.startIndex.advancedBy(beginning)
        let endIndex = str.startIndex.advancedBy(beginning+len)
        let range:Range = Range(start:startIndex,end:endIndex)
        return str.substringWithRange(range)
    }
    /*
     * Returns an array comprised of two strings that is the result of splitting the @param str
     * splitAt("Hello, playground",5)//["hello"," playground"]
     */
	class func splitAt(str:String, _ index:Int)->Array<String> {
		//return [string.substring(0,index),string.substring(index,string.length)];
		let a:String = str.substringWithRange(Range(start:str.startIndex , end:str.startIndex.advancedBy(index) )) //"llo, playgroun",str.startIndex.advancedBy(2),str.endIndex.advancedBy(-1)
		let b:String = str.substringWithRange(Range(start:str.startIndex.advancedBy(index) , end:str.endIndex )) //"llo, playgroun",str.startIndex.advancedBy(2),str.endIndex.advancedBy(-1)
		return [a,b]
	}
    /*
     * Counts how many times a string appears in a string
     */
    class func occurrences(){
        //impliment this
    }
    /**
     *
     */
    class func indexOf(a:String,_ b:String)->Int{
        let range:Range<String.Index> = StringParser.rangeOf(a,b)
        return a.startIndex.distanceTo(range.startIndex)
    }
    /**
     * Returns a Range of where the @param b is located in @param a
     */
    class func rangeOf(a:String,_ b:String)->Range<String.Index>{
        return a.rangeOfString(b)!
    }
}
