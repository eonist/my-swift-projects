class CharacterParser {
    /**
     * Returns the char after @param index
     */
    class func successorAt(str:String,index:Int)->Character{
        let strIndex = str.startIndex.advancedBy(index)
        return str.characters[strIndex.successor()]
    }
    /**
     * Returns the char before @param index
     */
    func predecessorAt(str:String,index:Int)->Character{
        let strIndex = str.startIndex.advancedBy(index)
        return str.characters[strIndex.predecessor()]
    }
    /**
     * Returns the first occurence of @param char
     */
    func indexOf(char:Character)->Int{
        /*
        let text = "abc"
        let index2 = text.startIndex.advancedBy(2) //will call succ 2 times
        let lastChar: Character = text[index2] //now we can index!
        let lastChar = text.characters[index2] //will do the same
        
        let range: Range<String.Index> = text.rangeOfString("b")!
        let index: Int = text.startIndex.distanceTo(range.startIndex) //will call successor/predecessor several times until the indices match
        */
        let string = "Hello.World"
        let needle: Character = "."
        if let idx = string.characters.indexOf(needle) {
            let pos = string.startIndex.distanceTo(idx)
            print("Found \(needle) at position \(pos)")
        }
        else {
            print("Not found")
        }
        
        
    }
}