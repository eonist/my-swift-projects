import Foundation

class CommitDataUtils {
    /**
     * Returns a ComitData instance that is populated with auther, date, subject, body
     * EXAMPLE: GitLogParser.commitData("Hash:4caecd \n Author:Eonist \n Date:2015-12-03 16:59:09 +0100 \n Subject:'abc' \n Body:'123'")//Output: a CommitData instance
     * NOTE: the log data is formated using --pretty=format
     */
    static func convert(raw input:String) -> CommitData{
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
        let hash = firstPart.subString((CommitData.DataType.hash + ":").count, firstPart.count)
        let author = secondPart.subString((CommitData.DataType.author + ":").count, secondPart.count)
        let date = thirdPart.subString((CommitData.DataType.date + ":").count, thirdPart.count)
        let subject = fourthPart.subString((CommitData.DataType.subject + ":").count, fourthPart.count)
        let body = fifthPart.subString((CommitData.DataType.body + ":").count, fifthPart.count)
        return CommitData(hash:hash,author:author,date:date,subject:subject,body:body)
    }
    
    /**
     * Describe
     */
    static func describe(_ commitData:CommitData){
        Swift.print("commitData.hash: " + "\(commitData.hash)")
        Swift.print("commitData.author: " + "\(commitData.author)")
        Swift.print("commitData.date: " + "\(commitData.date)")
        Swift.print("commitData.subject: " + "\(commitData.subject)")
        Swift.print("commitData.body: " + "\(commitData.body)")
    }
}
