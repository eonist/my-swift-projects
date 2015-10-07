class StringParser{
	/*
	 * return array for every line in a string 
	 */
	class func paragraphs(string:String){
		split(string,"\n")
	}
	/**
	 * NOTE: use "\n" to retrive paragraphs
	 */
	class func split(string:String,_ delimiter:String)->Array{
		return unmMergedPaths.componentsSeparatedByString(delimiter)
	}
	class func firstWord(string:String)->String {
       return string.componentsSeparatedByString(" ")[0]
   }
   class lastChar(string:String)->String {
        return string[string.length()-1]
    }
    class func pop()->Element? {
        let last = self.last
        if let last = last {
            self.removeLast()
            return last
        }
        return nil
    }
    mutating func splice(startIndex:UInt,deleteCount:UInt, values:[Element])->Array {
        var returnArray = self
        returnArray.removeRange(Range<Int>(start:Int(startIndex),end:Int(startIndex + deleteCount)))
        returnArray.insertContentsOf(values, at: Int(startIndex))
        return returnArray
    }
    mutating func splice(startIndex:UInt,deleteCount:UInt, values:Element)->Array {
        return splice(startIndex, deleteCount: deleteCount, values: [values])
    }
}
    //resolve path extension
}