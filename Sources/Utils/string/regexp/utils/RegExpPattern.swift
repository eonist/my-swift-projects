import Foundation

enum RegExpPattern {
    /**
     * NOTE: Used in the svg path parameter parser for instance
     * NOTE: swift doesn't do conditionals in regex like this: \-?\d*?(\.?)((?1)\d+?)  so the bellow code was made to do the same thing
     * NOTE: you may need to add more
     */
    static let digitAssertPattern:String = {
        //let g1:String = "(?=\\s|^)"/*must be preceeded by a space char or the begining*/
        let g2:String = "\\-*\\d+?"/*optional minus sign followed by one or more digits*/
        let g3:String = "(?=\\.\\d|\\s|,|\\-|$)"/*\\- was added recently, it may cause bugs*/   /*Must be followed by a dot with a digit or space, comma or end*/
        let g4:String = "((?<=\\d)\\.(?=\\d))*"/*zero or one dot char that must be preceeded with a digit and subseeded with a digit*/
        let g5:String = "((?<=\\d\\.)\\d+?)*"/*zero or more digits that must be preceeded with a digit and a char*/
        //let g6:String = "(?=$)"/*followed by an end or */
        let pattern:String = /*g1 +*/ g2 + g3 + g4 + g5 /*+ g6*/
        return pattern
    }()

}
