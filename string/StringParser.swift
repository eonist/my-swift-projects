class StringParser{
	/*
	 * return array for every line in a string 
	 */
	func paragraphs(string:String){
		split(string,"\n")
	}
	/**
	 * NOTE: use "\n" to retrive paragraphs
	 */
	func split(string:String,delimiter:String)->Array{
		return unmMergedPaths.componentsSeparatedByString(delimiter)
	}
}