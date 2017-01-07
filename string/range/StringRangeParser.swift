class StringRangeParser {
    /**
     * Returns a Range of where the PARAM: b is located in PARAM: a
     */
    static func rangeOf(a:String,_ b:String)->Range<String.Index>?{/*<--New: add optional return */
        return a.rangeOfString(b)
    }
    /**
     * Returns a Range instance for PARAM: str from PARAM: start to PARAM: end
     */
    static func stringRange(str:String,_ start:Int,_ end:Int)->Range<String.Index>{
        return strRange(str,start,end-start)
    }
    /**
     * Returns a Range instance for PARAM: str from PARAM: i to PARAM: i + PARAM: len
     */
    static func strRange(str:String,_ i:Int,_ len:Int)->Range<String.Index>{
        let startIndex = str.startIndex.advancedBy(i)
        let endIndex = str.startIndex.advancedBy(i + len)
        return startIndex...endIndex//longhand -> Range(start: startIndex,end: endIndex)
    }
}