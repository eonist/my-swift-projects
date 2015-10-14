class RangeParser {
    /**
     *
     */
    class func stringRange(str:String,_ start:Int,_ end:Int)->Range<String.Index>{
        return RangeParser.strRange(str,start,end-start)
    }
    /**
     *
     */
    class func strRange(str:String,_ i:Int,_ len:Int)->Range<String.Index>{
        let startIndex = str.startIndex.advancedBy(i)
        let endIndex = str.startIndex.advancedBy(i + len)
        return Range(start: startIndex,end: endIndex)
    }
}