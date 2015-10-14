class RangeParser {
    /**
     *
     */
    class func stringRange(str:String,_ start:Int,_ end:Int)->Range<String.Index>{
        let startIndex = str.startIndex.advancedBy(start)
        let endIndex = str.startIndex.advancedBy(end)
        return Range(startIndex,end: endIndex)
    }
    /**
     *
     */
    class func strRange(i:Int,len:Int){
        
    }
}