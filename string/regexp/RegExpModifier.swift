import Foundation

public class RegExpModifier{
    /**
     * @param input: a Css String such as "P{color:#00FF00;}"
     * @return a Comment free css string
     */
    class func removeComments(string:String)->String {
        let pattern:String = "\\/\\*.*?\\*\\/";
        let output:String = RegExp.replace(string,pattern, "")
        //print(input.match(regExpPattern));
        return output;
    }
    /**
    * Returns the @param input without whitespace on the left and right side
    * @Note: writing this function is not easy, check proto website for inspiration
    * // :TODO: possible rewrite inspiration: test6.match(/(?<=<[tT][iI][tT][lL][eE]>).*(?=<\/[tT][iI][tT][lL][eE]>)/g))
    */
    class func removeWrappingWhitespace(input:String)->String {
        // :TODO: the bellow is wrong , it can be (?<=^|\s)(-|\n)(?=$|\s)  // you dont need to test if there is multiple whitespaces just 1
        let pattern:String = "[^\\s]+?(?<=\\b)(.|\\n)*?(?=$|\\s*?$)"
        return RegExp.match(input, pattern)[0];
    }
}