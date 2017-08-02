import Foundation

public class RegExpModifier{
    enum Pattern {
        static let removeComments = "\\/\\*.*?\\*\\/"
        static let removeWrappingWhitespace = "[^\\s]+?(?<=\\b)(.|\\n)*?(?=$|\\s*?$)"
        static let replaceEmail = "((?:\\w|[_.\\-])+)@(?:((?:\\w|-)+)\\.)+\\w{2,4}+"
    }
    /**
     * PARAM: input: a Css String such as "P{color:#00FF00;}"
     * RETURN: a Comment free css string
     */
    static func removeComments(_ string:String)->String {
        let output:String = RegExp.replace(string,Pattern.removeComments, "")
        return output
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
