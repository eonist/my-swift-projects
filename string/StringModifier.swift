class StringModifier{
	/**
	 * 
	 */
	class func wrapWith(string:String,wrapper:String)->String{
	   return wrapper + string + wrapper
	}
	jd2	
	class func reverse(string:String){
		string.sort( { (s1: String, s2: String) -> Bool in return s1 > s2 } )//closure expression syntax
	}
} 
