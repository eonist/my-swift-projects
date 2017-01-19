class StringRangeParser {
    /**
     * Returns a Range of where the PARAM: b is located in PARAM: a
     */
    static func rangeOf(_ a:String,_ b:String)->Range<String.Index>?{/*<--New: add optional return */
        return a.range(of: b)//upgraded to swift 3
    }
    /**
     * Returns a Range instance for PARAM: str from PARAM: start to PARAM: end
     */
    static func stringRange(_ str:String,_ start:Int,_ end:Int)->Range<String.Index>{
        return strRange(str,start,end-start)
    }
    /**
     * Returns a Range instance for PARAM: str from PARAM: i to PARAM: i + PARAM: len
     */
    static func strRange(_ str:String,_ i:Int,_ len:Int)->Range<String.Index>{
        let startIndex:String.Index = str.idx(i)
        let endIndex:String.Index = str.idx(i + len/* + 1*/)//+1 because swift 3 upgrade doesn't allow ... ranges
        let range = startIndex..<endIndex//swift 3 upgrade was-> startIndex...endIndex
        return range/*longhand -> Range(start: startIndex,end: endIndex)*/
    }
}
