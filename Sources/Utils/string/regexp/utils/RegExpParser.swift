import Foundation

public class RegExpParser{
    enum Pattern{
        /**
         * Must be in the format: 12-30-1968 (mm-dd-yyyy)
         * NOTE: works with: "12-30-1968" and "12/30/1968" syntax
         */
        static let usDate:String = "(\\d\\d)[-\\/](\\d\\d)[-\\/](\\d\\d(?:\\d\\d)?)"//g
        static let contentBetweenTitleTags:String = "(?<=<[tT][iI][tT][lL][eE]>).*(?=<\\/[tT][iI][tT][lL][eE]>)"
        static let usPrices = "(?<=\\$)[0-9.]+"
        static let nonUsPrices = "\\b(?<!\\$)\\d+\\b"
        static let emails = "(?:\\w|[_.\\-])+@(?:(?:\\w|-)+\\.)+\\w{2,4}"
        static let words = "\\b\\w+\\b"
        static let rgbHexaDecimals = "(?<=#)[0-9A-Fa-f]{6}"
    }
    
    /**
     * Returns an array of computer date formated dates from PARAM: usDate
     * EXAMPLE:
     * computerDate("12-30-1968")//Output 1968/12/30
     * computerDate("12/30/1968")//Output 1968/12/30
     * NOTE: also supports dubble digit years by the way of the (\d\d)? subPattern
     * NOTE: this could be made more advance by including the posibilities for single digit months and days, but that is out of the scope of this example
     */
    static func computerDate(_ usDate:String)->String {
        let pattern:String = Pattern.usDate
        var output:String = ""
        usDate.matches(pattern).forEach {
            let month:String = $0.value(usDate, 1)
            let day:String = $0.value(usDate, 2)
            let year:String = $0.value(usDate, 3)
            output = year + "/" + month + "/" + day
        }
        return output
    }
    /**
     * Computes and returns an array comprised of url protocol(s) from @param input
     * @param input: a string comprised of url(s)
     * @example:"http://www.forta.com/\n " +"https://mail.forta.com/\n " +"ftp://ftp.forta.com/\n";//http, https, ftp
     * @Note: More url patterns in RegExpDescriber.url
     * @Note also see RegExpParser.htmlLinks
     */
    static func urlProtocol(_ input:String) -> Array<String> {
        return input.match(".+(?=:)")
    }
    /**
     * Computes and returns the content between two title tags from @param input
     * contentBetweenTitleTags("<HEAD> <TITLE>John Forta's Homepage</TITLE> </HEAD>");//John Forta's Homepage
     * @Note: For more html parsing see RegExpMatcher and RegExpModifier
     */
    static func contentBetweenTitleTags(_ input:String) -> [String] {
        return input.match(Pattern.contentBetweenTitleTags)
    }
    /**
     * Computes and returns an array comprised of dollar price amounts (excluding "$" character) from @param input
     * @example:
     * 	var text:String =  "ABC01: $23.45 " +
     *						"HGG42: $5.31 " +
     *						"CFMX1: $899.00 " +
     *						"XTC99: $69.96 " +
     *						"Total items found: 4";
     *	usPrices(text);//Output: 23.45,5.31,899.00,69.96
     */
    static func usPrices(_ input:String)-> [String] {
        return input.match(Pattern.usPrices)
    }
    /**
     * Computes and retruns an array comprised of digits not preceeded by the "$" character from @param input
     * @example:
     * nonUsPrices("<I paid $30 for 100 apples, 50 oranges, and 60 pears. I saved $5 on this order.");//100,50,60
     */
    static func nonUsPrices (_ input:String) -> [String] {
        return input.match(Pattern.nonUsPrices);
    }
    /**
     * Computes and returns lowercase words between @param rangeStart and @param rangeEnd
     * @example:
     */
    static func lowerCaseWordsWithinRange(_ input:String, rangeStart:String, rangeEnd:String)-> [String] {
        let patternString:String = "\\b[a-z]{" + rangeStart + "," + rangeEnd + "}\\b"
        return input.match(patternString)
    }
    /**
     * Computes and returns an array with lowercase words from @param input
     * @example:
     * getLowerCaseWordsInString("Test this out"))//this, out
     * getLowerCaseWordsInString("test this 123"))//test, this
     * getLowerCaseWordsInString("test this").length)//2
     */
    static func lowerCaseWords(_ input:String)-> [String] {
        let pattern:String = "\\b[a-z]+\\b"//Adding i-flag here would omitt the lowercase rule
        return input.match(pattern)
    }
    /**
     * Computes and returns an array with lowercaseWords from @param input
     */
    static func lowerCaseWordsWithExecution(_ input:String)-> [String] {
        let pattern:String = "\\b[a-z]+\\b"
        return RegExp.matches(input, pattern).map {
            Swift.print("match.numberOfRanges: " + "\($0.numberOfRanges)")/*The first item is the entire match*/
            let word:String = $0.value(input, 1)/*capturing group 1*/
            return word
        }//Outputs: name: green, value: 00FF00...and so on
    }
    /**
     * Returns all email instances in a string
     * @example
     * emails("emails: user@domain.com, user@server.com");// user@domain.com, user@server.com
     * Tip:// simpler: \\w+@\\w+\\.\\w+
     */
    static func emails(_ input:String)-> [String] {
        let pattern:String = Pattern.emails
        return input.match(pattern)
    }
    /**
     * Returns all words in a string
     * @example:
     * words("The German people.")//Outputs: The, German, people
     */
    static func words(_ input:String)-> [String] {
        return input.match(Pattern.words)/*alternativ pattern: /[a-z]+ig/;*/
    }
    /**
     * Returns all words startingWith @param firstCharacter subseeds with any of the characters passed through @param subseedingCharacters and ends with the character @param endCharacter
     * @param startingCharacter:
     * @param anySubseedingCharacters:
     * @param endingCharacter:
     * @example
     * wordsThatStartSubseedAndEndWith("but bat samba bit nothing bet","b","aeiou","t")//Output: but,bat,bit,bet
     */
    static func wordsThatStartSubseedAndEndWith(_ input:String, startingCharacter:String, anySubseedingCharacters:String, endingCharacter:String)-> [String] {
        let patternString:String = "\\b"+startingCharacter + "[" + anySubseedingCharacters + "]" + endingCharacter+"\\b";
        return input.match(patternString);
    }
    /**
     * Returns all sentences after \n ("newline break") from @param input
     * @Note: alternative pattern: /.+/s
     */
    static func sentences(_ input:String)-> [String] {
        let pattern = "^[A-z .,]"//alternative: /.+/s;//Uses the s-flag which  is:  dot matches newline
        return input.match(pattern)
    }
    /**
     * Computes and returns each word with a hexadecimal rgb value from @param input
     * @example:
     * rgbHexaDecimals("<BODY BGCOLOR=#336633 TEXT=#FFFFFF MARGINWIDTH=0 MARGINHEIGHT=0 TOPMARGIN=0 LEFTMARGIN=0>");//output: 336633,FFFFFF
     */
    static func rgbHexaDecimals(_ input:String)-> [String] {
        return input.match(Pattern.rgbHexaDecimals)
    }
    /**
     * Computes and returns each html link from @param url
     * @param input: a string that contains an URL
     * @example:
     * htmlLinks("this website does searches: http://www.google.com");//http://www.google.com
     */
    static func htmlLinks(_ input:String) -> [String] {
        let pattern = RegExpAdvanceParser.Pattern.urlPattern
        return input.match(pattern)
    }
    /**
     * Computes and returnes the index of the first word that starts with @param startingWith from @param input
     * @example:
     * indexOfWordStartingWith("Something happened last winter","la");//19
     */
    static func indexOfWordStartingWith(_ input:String, startingWith:String) -> Int? {
        let pattern = "\\b" + startingWith + "[a-z]"
        return input.search(pattern)
    }
    /**
     * Computes and returns U.S. ZIP codes. These may be five-digit ZIP codes formatted as 12345 or ZIP+4 codes formatted as 12345-6789. (The hyphen is used only if the additional four digits are present.)
     * @example:
     * usZipCodes("11111 22222 33333- 44444-4444");
     */
    static func usZipCodes(input:String)-> [String] {
        var pattern:String = ""
            pattern += "\\d{5}" //5 digits
            pattern += "(" //Group1 start
            pattern += "?" //if the subseeding condition is met
            pattern += "(" //Group2 start
            pattern += "?=-" //Math "-" if it exists (but not consume)
            pattern += ")" //Group2 end
            pattern += "-" //Subseeded by "-" (if group2 condition is met)
            pattern += "\\d{4}" //Subseeded by 4 digits (if group2 condition is met)
        pattern += ")"//Group1 end
        return input.match(pattern)
    }
    /**
     * Computes and retuns an array comprised of objects containing a name and a value from @param input
     * @param input a string containing css properties
     * @example cssProoperties("color:blue;thickness:2;font:Helvetica;");//[{name:color,value:blue},{name:thickness,value:2},{name:font,value:helvetica}]
     */
    static func cssProperties(_ input:String)-> [(name:String,value:String)] {
        let pattern = "(\\w*?)\\:(.*?)\\;"//assigns the name and value to an object (Associative) // :TODO: (the dot in the end part could possibly be replaced by [.^\;] test this)
        return input.matches(pattern).map {//Loops through the pattern
            let name = $0.value(input, 1)/*capturing group 1*/
            let value = $0.value(input, 2)/*capturing group 2*/
            return (name:name,value:value)
        }
    }
}

