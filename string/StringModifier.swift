class StringModifier{
	/**
	 * 
	 */
	class func wrapWith(string:String,wrapper:String)->String{
	   return wrapper + string + wrapper
	}
	/**
	 * returns a reversed strin
	 * NOTE: does not modify the original string
	 */		
	class func reverse(string:String)->String{
		return string.sort( { (s1: String, s2: String) -> Bool in return s1 > s2 } )//closure expression syntax
	}
} 
