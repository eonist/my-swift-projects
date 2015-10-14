class RangeParser {
    /**
     *
     */
    class func stringRange(str:String,_ start:Int,_ end:Int)->Range{
        let startIndex = str.startIndex.advancedBy(start)
        let endIndex = str.startIndex.advancedBy(end)
        return Range(startIndex,endIndex)
    }
}