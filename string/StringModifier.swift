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
	 * NOTE: shorter version of this method: 		return string.sort( { (s1: String, s2: String) -> Bool in return s1 > s2 } )//closure expression syntax
	 * NOTE: even shorter string.sort( { s1, s2 in return s1 > s2 } )//infered version of the bellow: 
	 * NOTE: even shorter: string.sort( { s1, s2 in s1 > s2 } )//the return statement is omitted as it is implicit
	 * NOTE: even shorter: string.sort( { $0 > $1 } )//shorthand argument names, the in is omitted since the expression is made up entirly of its body
	 * NOTE: even shorther string.sort(>)//operator function
	 * NOTE: keep the long version around so that its easier to understand
	 */		
	class func reverse(string:String)->String{
		func backwards(s1: String, _ s2: String) -> Bool {
		    return s1 > s2
		}
		let reversed:String = ""//needs work -> = string.characters.sort(backwards)
		return reversed
	}
	/**
	 * 
	 */
	func capitalize(string:String)->String{
		return string.capitalizedString
	}
    /*
     *
     */
    func lowerCase(string:String)->String{
       return string.lowercaseString
    }
} 