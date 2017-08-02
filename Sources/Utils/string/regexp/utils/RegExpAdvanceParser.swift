import Foundation

class RegExpAdvanceParser {
    /**
     * Computes and returns words that has the characters @param string followed by one or more characters in @param followedByOneOrMore
     * @example:
     * wordsThatStartAndFollowWithOneOrMany("target tarzan mortar tarrif", "ta", "r"))// target,tarzan,tarrif
     */
    static func wordsThatStartAndFollowWithOneOrMany(_ input:String, _start:String, oneOrMany:String) -> [String] {
        let pattern:String = "\\b" + start + oneOrMany + "+?\\.*?\\b"
        return input.match(pattern)
    }
}
