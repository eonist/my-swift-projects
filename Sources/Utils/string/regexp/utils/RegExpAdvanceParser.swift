import Foundation

class RegExpAdvanceParser {
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
     * var functionElements:* = functionElements("public function example():void")
     * functionElements.functionName;//Output: example
     * functionElements[0];//Output: public function example():void
     * functionElements[1];//Output: public
     */
    static func functionElements(_ input:String)-> [String] {
        var pattern:RegExp = /(?P<modifier>[a-z]+) function (?P<functionName>[a-zA-Z]+)\(\):(?P<returnType>[a-zA-Z]+)/g;
        return pattern.exec(input);
    }
}
