import Foundation

public class RegExpParser{
    enum Pattern{
        /**
         * Must be in the format: 12-30-1968 (mm-dd-yyyy)
         * NOTE: works with: "12-30-1968" and "12/30/1968" syntax
         */
        static let usDate:String = "(\\d\\d)[-\\/](\\d\\d)[-\\/](\\d\\d(?:\\d\\d)?)"//g
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
    static func urlProtocol(input:String) -> Array<String> {
        return input.match(".+(?=:)")
    }
}
/*
	Add these from legacy:
	match,
	associatedMatch,
	urlProtocol,
	contentBetweenTitleTags,
	usPrices,
	nonUsPrices,
	lowerCaseWordsWithinRange,
	lowerCaseWords,
	lowerCaseWordsWithExecution,
	emails,
	words,
	wordsThatStartSubseedAndEndWith,
	sentences,
	rgbHexaDecimals,
	computerDate,
	htmlLinks,
	indexOfWordStartingWith,
	split,
	usZipCodes,
	cssProperties;/*Great example off associative and array use*/
	*/
