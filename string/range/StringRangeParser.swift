class StringRangeParser {
    /**
     * Returns a Range of where the @param b is located in @param a
     */
    class func rangeOf(a:String,_ b:String)->Range<String.Index>?{/*<--New: add optional return */
        return a.rangeOfString(b)
    }
    /**
     * Returns a Range instance for @param str from @param start to @param end
     */
    class func stringRange(str:String,_ start:Int,_ end:Int)->Range<String.Index>{
        return strRange(str,start,end-start)
    }
    /**
     * Returns a Range instance for @param str from @param i to @param i + @param len
     */
    class func strRange(str:String,_ i:Int,_ len:Int)->Range<String.Index>{
        let startIndex = str.startIndex.advancedBy(i)
        let endIndex = str.startIndex.advancedBy(i + len)
        return startIndex...endIndex//longhand -> Range(start: startIndex,end: endIndex)
    }
}