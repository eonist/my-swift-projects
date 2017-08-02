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
    static func wordPrecededFollowedOrFollowedSubseed(_ input:String, startingWith:String, subseedingWith1:String, subseedingWith2:String,nOccurencesOfPresedingString:String)-> [String] {
        print("startingWith: " + startingWith);
        print("subseedingWith1: " + subseedingWith1);
        print("subseedingWith2: " + subseedingWith2);
        print("nOccurencesOfPresedingString: " + nOccurencesOfPresedingString);
        let pattern = "i(?:s|p){2}";// ?: removes the s | p character from the exec parsing
        return input.matches(pattern)
    }
}
