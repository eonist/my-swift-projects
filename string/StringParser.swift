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
        return string[string.endIndex - 1]
    }
    /**
	 * Returns an array comprised of two strings derived from splitting @param string at @param index
	 * splitAt("Hello, playground",5)//["hello"," playground"]
	 */
	class func function splitAt(str:String, index:int):Array {
		return [string.substring(0,index),string.substring(index,string.length)];
		let a:String = str.substringWithRange(Range<String.Index>(start:0 , end:index )) //"llo, playgroun",str.startIndex.advancedBy(2),str.endIndex.advancedBy(-1)
		let b:String = str.substringWithRange(Range<String.Index>(start:index , end:str.endIndex )) //"llo, playgroun",str.startIndex.advancedBy(2),str.endIndex.advancedBy(-1)
		let retVal:Array = [a,b]
		return retVal
	}
	/**
	 * 
	 */
	class func boolean(string:String):Bool{
		return string == "true";
	}
}
    //resolve path extension
