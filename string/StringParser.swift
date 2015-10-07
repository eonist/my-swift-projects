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
	class func frstWord()->String {
       return self.componentsSeparatedByString(" ")[0]
   }
    //resolve path extension
}