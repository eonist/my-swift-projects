import foundation
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
     * Example: reverse("hello")//"olleh"
	 */		
	class func reverse(str:String)->String{
        /*
        //Nice to have: you may need similar code in the future
        var revStr = ""
        for _ in str.characters {//loop n times
            revStr.append(str.characters.last!)
            str = String(str.characters.dropLast())
        }
        return revStr
        */
        return String(str.characters.reverse())//new in swift 2
	}
	/**
	 * 
	 */
	class func capitalize(string:String)->String{
		return string.capitalizedString
	}
    /*
     * Returns a lowercase string
     */
    class func lowerCase(string:String)->String{
       return string.lowercaseString
    }
    /*
     * Returns an uppercase string
     */
    class func upperCase(string:String)->String{
        return string.uppercaseString
    }
    /*
     * Returns @param string with the first character capitalizesed, 
     * NOTE: Can also be done through replaceRange: string.replaceRange(string.startIndex...string.startIndex, with: String(string[string.startIndex]).capitalizedString) //we use replaceRange in combination with the .capitalizedString method // string[string.start.index] returns a Character instance. then we cast this as a string
     */
    class func capFirstChar(str:String)->String{
        let firstChar:Character = CharacterParser.charAt(str, 0)
        let theRest:String = StringParser.subString(str,1,str.characters.count)
        return String(firstChar) + theRest
    }
    /*
     * Returns a new string from @param str with a new @param char inserted at @param index
     */
    class func insertCharAt(var str:String, _ char:Character,_ index:Int)->String{
        let strIndex = str.startIndex.advancedBy(index)
        str.insert(char, atIndex: strIndex)
        return str
    }
    /**
     * Returns @param a with the content of @param b inserted at @param i
     * NOTE: Can also be done through replaceRange: string.replaceRange(string.startIndex...string.startIndex, with: String(string[string.startIndex]).capitalizedString) //we use replaceRange in combination with the .capitalizedString method // string[string.start.index] returns a Character instance. then we cast this as a string
     * NOTE: Does not alter the original strings
     */
    class func insertAt(var a:String,_ b:String,_ i:Int)->String{
        let index = a.startIndex.advancedBy(i)
        a.insertContentsOf(b.characters, at: index)
        return a
    }
    /**
     * Returns a new string that has that has a section of its text replaced with @param b, the section is from @param start to @param end
     * @Example: replaceRange("Finland", 2,3,"NLA")//fiNLAnd
     */
    class func replaceRange(var str:String,_ replacement:String,_ start:Int, _ end:Int)->String{
        let range:Range<String.Index> = StringParser.stringRange(str, start, end)
        str.replaceRange(range, with: replacement)
    }
    /**
     * Directly replaces a with b, and b with a
     * NOTE: Modifies the original a and b strings
     */
    class func swap(inout a: String, inout _ b: String){
        ObjectModifier.swapObjects(&a, &b)
    }
    /**
     * Example: "    Let's trim the whitespace    "
     */
    class func trimWhiteSpace(str:String){
        str.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
}