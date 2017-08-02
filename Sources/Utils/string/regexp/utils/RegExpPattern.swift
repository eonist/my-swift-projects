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
    static let urlPattern:String = {
        var str:String = ""
            str += "\\b"//the border between a word character and a non word charactre
                str += "("//Group1 start
                    str += "(" //Group2 staret
                        str += "https?" //http or https (? makes the sMatches the previouse expression if it exists)
                        str += "|" //or
                        str += "telenet" 
                        str += "|" //or
                        str += "gopher" 
                        str += "|" //or
                        str += "file" 
                        str += "|" //or
                        str += "wais" 
                        str += "|" //or
                        str += "ftp" 
                    str += ")" //Group2 end
                    str += "\\:"//Subseeded by ":"
                    str += "[\\w\\/\\#~:.\\?+=&%@!\\-]+?"  //subseeded by one of the characters and must Match 1 or more times, but as few times as possible (Lazy)
                str += ")"//Group1 end
                str += "(" //Group3 Start
                    str += "?="
                    str += "[\\.\\:\\?\\-]*"		//for possible punct char,  match 0 or more occurrences of the preceding item (Greedy quantifier)
                    str += "(" //Start of group4
                        str += "?:[^\\w/\\#~:.?+=&%@!\\-]"//Invalid characters, Non-capturing group - Groups subpattern, but do not capture subMatch (does not consume the subseeding pattern)
                        str += "|" //or
                        str += "$" // end of string
                    str += ")"//Group4 end			
                str += ")"//Group3 end
		return str
    }()
}
