import Foundation

extension CommitData{
    static var hash:String = "Hash"
    static var author:String = "Author"
    static var date:String = "Date"
    static var subject:String = "Subject"
    static var body:String = "Body"
    /**
     * Returns a ComitData instance that is populated with auther, date, subject, body
     * EXAMPLE: GitLogParser.commitData("Hash:4caecd \n Author:Eonist \n Date:2015-12-03 16:59:09 +0100 \n Subject:'abc' \n Body:'123'")//Output: a CommitData instance
     * NOTE: the log data is formated using --pretty=format
     */
    static func conform(_ input:String) -> CommitData{
        /*Divide*/
        let firstIdx:Int = input.indexOf("\n")
        let firstPart:String = input.subString(0,firstIdx)
        let secondIdx:Int = firstIdx+1 + input.subString(firstIdx+1,input.count).indexOf("\n")
        let secondPart:String = input.subString(firstIdx+1,secondIdx)
        let thirdIdx:Int = secondIdx+1 + input.subString(secondIdx+1,input.count).indexOf("\n")
        let thirdPart:String = input.subString(secondIdx+1,thirdIdx)
        let fourthIdx:Int = thirdIdx+1 + input.subString(thirdIdx+1,input.count).indexOf("\n")
        let fourthPart:String = input.subString(thirdIdx+1,fourthIdx)
        let fifthPart:String = input.subString(fourthIdx+1,input.count)
        /*Strip*/
        let hash = firstPart.subString((CommitData.hash + ":").count, firstPart.count)
        let author = secondPart.subString((CommitData.hash + ":").count, secondPart.count)
        let date = thirdPart.subString((CommitData.date + ":").count, thirdPart.count)
        let subject = fourthPart.subString((CommitData.subject + ":").count, fourthPart.count)
        let body = fifthPart.subString((CommitData.body + ":").count, fifthPart.count)
        let commitData:CommitData = CommitData(hash:hash,author:author,date:date,subject:subject,body:body)
        return commitData
    }
}