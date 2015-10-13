import Foundation

class CharacterParser {
    /**
     *
     */
    class func successor(str:String)->Character{
        return str.characters[str.startIndex.successor()]
    }
    /**
     *
     */
    func predecessor()->Character{
        return str.characters[str.startIndex.successor()]
    }
}