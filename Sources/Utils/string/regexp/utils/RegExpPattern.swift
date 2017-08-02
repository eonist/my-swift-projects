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
									"("+//Group1 start
										"(" +//Group2 staret
											"https?" +//http or https (? makes the sMatches the previouse expression if it exists)
											"|" +//or
											"telenet" +
											"|" +//or
											"gopher" +
											"|" +//or
											"file" +
											"|" +//or
											"wais" +
											"|" +//or
											"ftp" +
										")" +//Group2 end
										"\\:"+//Subseeded by ":"
										"[\\w\\/\\#~:.\\?+=&%@!\\-]+?" + //subseeded by one of the characters and must Match 1 or more times, but as few times as possible (Lazy)
									")"+//Group1 end
									"(" +//Group3 Start
										"?="+
										"[\\.\\:\\?\\-]*"+		//for possible punct char,  match 0 or more occurrences of the preceding item (Greedy quantifier)
										"(" +//Start of group4
											"?:[^\\w/\\#~:.?+=&%@!\\-]"+//Invalid characters, Non-capturing group - Groups subpattern, but do not capture subMatch (does not consume the subseeding pattern)
											"|" +//or
											"$" +// end of string
										")"+//Group4 end			
									")"//Group3 end
		return patternString
    }
}
