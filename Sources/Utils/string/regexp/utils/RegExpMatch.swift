import Foundation

class RegExpMatch {
    private static var datePattern:String = "\\d{1,2}[-\\/]\\d{1,2}[-\\/]\\d{2,4}"
    /**Dates (Correctly formated )*/
    static func dates() {
        let str:String = "4/8/03, 10-6-2004, 2/2/2, 01-01-01"
        print(RegExp.match(str,datePattern))/*4/8/03,10-6-2004,01-01-01*/
    }
}


/*
 Add from legacy:
 
 startsWithAp,
 endsWithEs,
 startOfString,
 endOfString,
 startsHasAndEndsWith,
 lowerCaseWords,
 hexadecimal,
 emails,
 dates,
 btag,
 btags,
 htag,
 xmlOpening,
 isEmptyAfterHtml,
 comments,
 ip,
 validIp,
 year,
 repeatingWords,
 wordWrappedWith,
 optionalEnd;*/
