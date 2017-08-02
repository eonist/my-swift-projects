import Foundation

enum RegExpPattern {
    /**
     * NOTE: Used in the svg path parameter parser for instance
     * NOTE: swift doesn't do conditionals in regex like this: \-?\d*?(\.?)((?1)\d+?)  so the bellow code was made to do the same thing
     * NOTE: you may need to add more
     */
    static let digitAssertPattern:String = {
        //let g1:String = "(?=\\s|^)"/*must be preceeded by a space char or the begining*/
        let g2:String = "\\-*\\d+?"/*optional minus sign followed by one or more digits*/
        let g3:String = "(?=\\.\\d|\\s|,|\\-|$)"/*\\- was added recently, it may cause bugs*/   /*Must be followed by a dot with a digit or space, comma or end*/
        let g4:String = "((?<=\\d)\\.(?=\\d))*"/*zero or one dot char that must be preceeded with a digit and subseeded with a digit*/
        let g5:String = "((?<=\\d\\.)\\d+?)*"/*zero or more digits that must be preceeded with a digit and a char*/
        //let g6:String = "(?=$)"/*followed by an end or */
        let pattern:String = /*g1 +*/ g2 + g3 + g4 + g5 /*+ g6*/
        return pattern
    }()
    /**
     * Returns an URL regular expression pattern
     */
    static func urlPattern() -> String {
        let patternString:String =  "\\b"+//the border between a word character and a non word charactre
									patternString + "("//Group1 start
										patternString + "(" //Group2 staret
											patternString + "https?" //http or https (? makes the sMatches the previouse expression if it exists)
											patternString + "|" //or
											patternString + "telenet" 
											patternString + "|" //or
											patternString + "gopher" 
											patternString + "|" //or
											patternString + "file" 
											patternString + "|" //or
											patternString + "wais" 
											patternString + "|" //or
											patternString + "ftp" 
										patternString + ")" //Group2 end
										patternString + "\\:"//Subseeded by ":"
										patternString + "[\\w\\/\\#~:.\\?+=&%@!\\-]+?"  //subseeded by one of the characters and must Match 1 or more times, but as few times as possible (Lazy)
									patternString + ")"//Group1 end
									patternString + "(" //Group3 Start
										patternString + "?="
										patternString + "[\\.\\:\\?\\-]*"		//for possible punct char,  match 0 or more occurrences of the preceding item (Greedy quantifier)
										patternString + "(" //Start of group4
											patternString + "?:[^\\w/\\#~:.?+=&%@!\\-]"//Invalid characters, Non-capturing group - Groups subpattern, but do not capture subMatch (does not consume the subseeding pattern)
											patternString + "|" //or
											patternString + "$" // end of string
										patternString + ")"//Group4 end			
									patternString + ")"//Group3 end
		return patternString
    }
}
