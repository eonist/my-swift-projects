import Foundation

public class RegExpModifier{
    enum Pattern {
        static let removeComments = "\\/\\*.*?\\*\\/"
        static let removeWrappingWhitespace = "[^\\s]+?(?<=\\b)(.|\\n)*?(?=$|\\s*?$)"
        static let replaceEmail = "((?:\\w|[_.\\-])+)@(?:((?:\\w|-)+)\\.)+\\w{2,4}+"
        static let obscureEmail = "(?:\\w|[_.\\-])+@(?:(?:\\w|-)+\\.)+\\w{2,4}"
    }
    /**
     * PARAM: input: a Css String such as "P{color:#00FF00;}"
     * RETURN: a Comment free css string
     */
    static func removeComments(_ input:String)->String {
        return input.replace(Pattern.removeComments, "")
    }
    /**
     * Returns the PARAM: input without whitespace on the left and right side
     * NOTE: writing this function is not easy, check proto website for inspiration
     * NOTE: StringModifier.trimWhiteSpace can also be used. could be faster
     * // :TODO: possible rewrite inspiration: test6.match(/(?<=<[tT][iI][tT][lL][eE]>).*(?=<\/[tT][iI][tT][lL][eE]>)/g))
     * CAUTION: Does not work well with strings that are empty, this is a problem in the current regExp code
     */
    static func removeWrappingWhitespace(_ input:String)->String {
        // :TODO: ⚠️️ the bellow is wrong , it can be (?<=^|\s)(-|\n)(?=$|\s)  // you dont need to test if there is multiple whitespaces just 1
        return RegExp.match(input, Pattern.removeWrappingWhitespace)[0]
    }
    /**
     * Returns @param input without space characters on the left and right side of it self
     * @Note supports only single spaces.
     * @Note the space character in unicode: \040
     * @example: "test ", "   test" , "  test  " or "test"//test
     */
    static func removeWrappingSpaces(input:String) -> String {
        return input.match("[^\040].*?(?=\040|$)")[0]
    }
    /**
     * Returns the first instance of an email replaced with @param replacementEmail from @param input
     * @example :
     * replaceEmail("The following was posted by user@domain.com.", "<email>@<domain>.com")//The following was posted by <email>@<domain>.com.
     */
    static func replaceEmail(_ input:String, replacementEmail:String) -> String {
        return input.replace(Pattern.replaceEmail, replacementEmail);
    }
    /**
     * Returns the an obscured email of first instance of an email in the @param input
     * @example:
     * obscureEmail("The following was posted by user@domain.com.")// The following was posted by user AT domain DOT com
     */
    static func obscureEmail(input:String) -> String {
        let matches = input.matches(Pattern.obscureEmail)
        let obscuredEmail:String = matches.reduce("") {
            let match:String = $0.1.value(input, 1)
            return replacer(match)
        }
        func replacer(_ match:String) -> String {
            var string:String = match.replace("@", " AT ")
            string = string.replace("\\./g", " DOT ")
            return string;
        }
        return obscuredEmail
    }
    /**
     * Returns words with single quotation marks from the @param input
     * @param input: words with dubble quotationmarks
     * replaces all quotion (quotation mark followed by word followed by quotation mark) into curly quotes
     *
     */
    static func singleQuotation(input:String) -> String {
        return input.replace("([^\"]*)", "\'$1\'")
    }
}

/*
Add these from legacy:

replace,
replacePunctuation,
emailLink,
conformUsTeleNr,
replaceUrl,
replaceEmail,
obscureEmail,
singleQuotation,
removeWrappingWhitespace,
removeWrappingSpaces,
singularWhitespace,
replaceContentBetweenHTags;

*/
