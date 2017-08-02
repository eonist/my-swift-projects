import Foundation

class RegExpAdvanceParser {
    enum Pattern{
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
    /**
     * Computes and returns words that has the characters @param string followed by one or more characters in @param followedByOneOrMore
     * @example:
     * wordsThatStartAndFollowWithOneOrMany("target tarzan mortar tarrif", "ta", "r"))// target,tarzan,tarrif
     */
    static func wordsThatStartAndFollowWithOneOrMany(_ input:String, start:String, oneOrMany:String) -> [String] {
        let pattern:String = "\\b" + start + oneOrMany + "+?\\.*?\\b"
        return input.match(pattern)
    }
    /**
     * Returns all words that has @param a or @param b
     * @example:
     * wordsWithOrWith("red is rad", "re", "ad")//Output: red,rad
     */
    static func wordsWithOrWith(_ input:String, a:String, b:String)-> [String] {
        let patternString:String = "\\b\\w*?("+a+"|"+b+")\\w*\\b";
        return input.match(patternString);
    }
    /**
     * Computes and returns an Array with the first string that starts with @param startingWith and subseeds with 2 occurences of eigther  @param subseedingWith1 or @param subseedingWith2
     * @example:
     * wordPrecededFollowedOrFollowedSubseed("mississippi", "i", "s", "p", 2))//Outputs: iss
     * @Note:To match the whole word you need to add more regular expression, but that is out of the scope of this method
     */
    static func wordPrecededFollowedOrFollowedSubseed(_ input:String, startingWith:String, subseedingWith1:String, subseedingWith2:String,nOccurencesOfPresedingString:String)-> [NSTextCheckingResult] {
        print("startingWith: " + startingWith);
        print("subseedingWith1: " + subseedingWith1);
        print("subseedingWith2: " + subseedingWith2);
        print("nOccurencesOfPresedingString: " + nOccurencesOfPresedingString);
        let pattern = "i(?:s|p){2}";// ?: removes the s | p character from the exec parsing
        return input.matches(pattern)
    }
    /**
     * Computes and returns all words that has a digit that are seperated by @param seperator and equal what is on eigther side of the @param seperator character(s)
     * @example
     * equalDigits("1 = 1, 2 = 3, 4 = 4, 4 = 2", " = ");//Output: 1 = 1, 4 = 4
     * @Note This only suports the exact seperator , to make it more dynamic more regExp code needs to be added, But this is out of this methods scope
     */
    static func equalDigit(_ input:String, seperator:String) -> [String] {
        let pattern:String = "(\\d)" + seperator + "\\1";
        return input.match(pattern)
    }
    /**
     * Computes and returns all words that has a double digit that are seperated by @param seperator and equal what is on eigther side of the @param seperator character(s)
     * @example
     * equalDigits("10 = 10, 2 = 30, 4 = 4, 4 = 2");//Output: 10 = 10
     */
    static func equalDigits(_ input:String, seperator:String)-> [String] {
        let pattern:String = "(\\d{2})" + seperator + "\\1";
        return input.match(pattern)
    }
    /**
     * Computes and returns words that has two digits mirroring each other seperated by @param seperator
     * @example
     * mirroringDigits("12 = 21, 12 = 12"," = "));//Output: 12 = 21
     */
    static func mirroringDigits(_ input:String, seperator:String)-> [String] {
        let pattern:String = "(\\d)(\\d)" + seperator + "\\2\\1";
        return input.match(pattern)
    }
    /**
     * Computes and returns an combined itterative and Associative array from @param input
     * @example:
     * var functionElements:* = functionElements("public func example()->Void")
     * functionElements.functionName;//Output: example
     * functionElements[0];//Output: public func example():void
     * functionElements[1];//Output: public
     */
    static func functionElements(_ input:String)-> [(modifier:String,functionName:String,returnType:String)] {
        let pattern = "([a-z]+) func ([a-zA-Z]+)\\(\\)->([a-zA-Z]+)"//modifier,functionName,returnType
        return input.matches(pattern).map{
            let modifier = $0.value(input, 1)/*capturing group 1*/
            let functionName = $0.value(input, 2)/*capturing group 2*/
            let returnType = $0.value(input, 3)/*capturing group 3*/
            return (modifier,functionName,returnType)
        }
    }
    /**
     * Returns every file name (excluding file type) from @param input
     * @example:
     * fileNames("bananna.exe, informatics.bat is so cool try alure.pdf")//Output: bananna,informatics,alure
     */
    static func fileNames(_ input:String)-> [String] {
        let pattern = "[a-zA-Z]+(?=\\.[a-z]+)"
        return input.match(pattern)
    }
    /**
     * Returns a file name
     * @example fileName("/some/path/file2.pdf");//output: file2
     */
    static func fileName(_ input:String) -> [String] {
        let pattern = "[a-zA-Z0-9]+(?=\\.[a-z]+)"
        return input.match(pattern)
    }
    /**
     * Computes and retuns files except files with the fie type @param fileTypeException from @param input.
     * @example:
     * filesExcept("copy the program.exe and files. the run.bat, and doc the document.txt.","txt")//Output:program.exe,run.bat
     * @Note: (?!\\."+exception+") with: (?!\\."+exception1+"|?!\\."+expetion2)// Results in ability to have more expetions
     */
    static func filesExcept(_ input:String, fileTypeException:String)-> [String] {
        let patternString:String = "[a-z]+(?!\\."+fileTypeException+")\\.([a-z]+)"
        return input.match(patternString)
    }
    /**
     * Computes and returns the last charcter(s) after @param last
     * @param last: the last instance of a character or characters
     * @example:
     * RegExpAdvanceParser.charactersAfterLast("lib.icon.HomeIcon","\\.")//Output: HomeIcon
     */
    static func charactersAfterLast(_ input:String, last:String) -> [String] {
        let patternString:String = "\\b(?<=" + last + ")[A-z]+$"//literalPattern: /\b(?<=\.)[A-z]+$/g
        return input.match(patternString)
    }
    /**
     * Computes and returns the character(s) before the @param last
     * @param last: the last instance of a character or characters
     * @example:
     * RegExpAdvanceParser.charactersAfterLast("lib.icon.HomeIcon","\\.")//Output: lib.icon
     */
    static func charactersBeforeLast(_ input:String, last:String) -> [String] {
        let patternString:String = "\\.+?(?=" + last + "[A-z]+$)"//literalPattern: /.+?(?=\.[A-z]+$)/g
        return input.match(patternString)
    }
    /**
     * Matches all <IMG> tags and <IMG> enclosed between <A> tags and if so it includes the <A> tag in the match
     */
    static func imgLink() {
        //locate all <IMG> tags in your text; in addition, if any <IMG> tags are links (enclosed between <A> and </A> tags), 
        //you need to match the complete link tags as well.
        //The syntax for this type of condition is (?(backreference)true). 
        //The ? starts the condition, the backreference is specified within parentheses, 
        //and the expression to be evaluated only if the backreference is present immediately follows.
        var str:String = "<!-- Nav bar --> "
                            str += "<TD>"
                            str += "<A HREF=/home><IMG SRC=/images/home.gif></A>"
                            str += "<IMG SRC=/images/spacer.gif>"
                            str += "<A HREF=/search><IMG SRC=/images/search.gif></A>"
                            str += "<IMG SRC=/images/spacer.gif>"
                            str += "<A HREF=/help><IMG SRC=/images/help.gif></A>"
                            str += "</TD>"
        var pattern:String = ""
            pattern += "(" //Group1 start
                pattern += "<" //"<"
                pattern += "[Aa]" //Subseed by A or a
                pattern += "\\s+" //Subseeded by any whitespace
                pattern += "[^>]+" //1 or more "^" is at the start of the string
                pattern += ">" //Subseeded with ">"
                pattern += "\\s*" //Subseeded 0 or more of whitespace
            pattern += ")" //Group1 end
            pattern += "?" //MAtches the previouse group if it exists
            pattern += "<" //Subseeded with "<"
            pattern += "[Ii]" //Subseeded I or i
            pattern += "[Mm]" //Subseeded M or m
            pattern += "[Gg]" //Subseeded G or g
            pattern += "\\s+" //Subseeded 1 or more whitespace
            pattern += "[^>]+" //1 or more "^" is at the start of the string
            pattern += ">" //Subseeded with ">"
            pattern += "(" //Group2 start
                pattern += "?(\\1)" //Checks if the first group exists
                pattern += "\\s*" //Subseeded by 0 or more whitespace
                pattern += "<" //Subsseded by "<"
                pattern += "\\/" //Subsseded by "/"
                pattern += "[Aa]" //Subseed by A or a
                pattern += ">" //Subseeded with ">"
            pattern += ")"//Group2 end
        
        str.match(pattern).forEach {
            print($0)
        }
        //Output <A HREF=/home><IMG SRC=/images/home.gif></A>,<IMG SRC=/images/spacer.gif>,<A HREF=/search><IMG SRC=/images/search.gif></A>,<IMG SRC=/images/spacer.gif>,<A HREF=/help><IMG SRC=/images/help.gif></A>
    }
}
