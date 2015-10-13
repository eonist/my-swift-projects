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
	class func firstWord(string:String)->String {
       return string.componentsSeparatedByString(" ")[0]
   }
   class func lastChar(string:String)->String {
        let lastCharIndex:Int = string.characters.count - 1
        print(lastCharIndex)
        return String(string.characters.last)
    }
    /**
	 * Returns an array comprised of two strings derived from splitting @param string at @param index
	 * splitAt("Hello, playground",5)//["hello"," playground"]
	 */
    class func range(str:String,start:Int,len:Int)->String{
        let start = str.startIndex
        let end = str.startIndex.advancedBy(len)
        let range:Range = Range(start:start,end:end)
        return str.substringWithRange(range)
    }
    /*
     * Returns an array of string items by splitting a text at every delimiter
     */
	class func splitAt(str:String, index:Int)->Array<String> {
		//return [string.substring(0,index),string.substring(index,string.length)];
		let a:String = str.substringWithRange(Range(start:str.startIndex , end:str.startIndex.advancedBy(index) )) //"llo, playgroun",str.startIndex.advancedBy(2),str.endIndex.advancedBy(-1)
		let b:String = str.substringWithRange(Range(start:str.startIndex.advancedBy(index) , end:str.endIndex )) //"llo, playgroun",str.startIndex.advancedBy(2),str.endIndex.advancedBy(-1)
		return [a,b]
	}
}
    //resolve path extension
