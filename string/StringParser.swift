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
	class func split(string:String,_ delimiter:String)->Array{
		return unmMergedPaths.componentsSeparatedByString(delimiter)
	}
	class func firstWord(string:String)->String {
       return string.componentsSeparatedByString(" ")[0]
   }
   class lastChar(string:String)->String {
        return string[string.length()-1]
    }
    //resolve path extension
}