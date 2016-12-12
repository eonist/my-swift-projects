import Foundation

class GitLogParser {
    /**
     * Returns an NSDate instance for a date that is derived from a commit log item with pretty format and %ci
     * PARAM: date: "2015-12-03 16:59:09 +0100"
     * EXAMPLE: GitLogParser.date("2015-12-03 16:59:09 +0100").shortDate//Output: "03/12/2016"
     */
    static func date(date:String)->NSDate{
        let dateParts:[String] = date.split(" ")
        let yearMonthDayParts:[String] = dateParts[0].split("-")
        Swift.print("yearMonthDayParts: " + "\(yearMonthDayParts)")
        let year:String = yearMonthDayParts[0]
        
        
        let month:String = yearMonthDayParts[1]
        let day:String = yearMonthDayParts[2]
        Swift.print("year.int: " + "\(year.int)")
        Swift.print("month.int: " + "\(month.int)")
        Swift.print("day.int: " + "\(day.int)")
        let hourMinSecParts:[String] = dateParts[1].split(":")
        Swift.print("hourMinSecParts: " + "\(hourMinSecParts)")
        let hour:String = hourMinSecParts[0]
        let min:String = hourMinSecParts[1]
        let sec:String = hourMinSecParts[2]
        //let timeZone:String = dateParts[2]
        let date:NSDate = NSDate.createDate(year.int, month.int, day.int, hour.int, min.int, sec.int)!
        return date
    }
    /**
     * EXAMPLE: parts("Author:Eonist \n Date:2015-12-03 16:59:09 +0100 \n Subject:'abc' \n Body:'123'")//Output:
     */

    typealias commitParts = (Int) -> String
    
    static func parts(testString:String) -> (author:String,date:String,subject:String,body:String){
        let firstIdx:Int = testString.indexOf("\n")
        Swift.print("firstIdx: " + "\(firstIdx)")
        let firstPart:String = testString.subString(0,firstIdx)
        Swift.print("firstPart: " + "\(firstPart)")
        //Swift.print("firstPart: " + "\(firstPart)")
        
        let secondIdx:Int = firstIdx+1 + testString.subString(firstIdx+1,testString.count).indexOf("\n")
        Swift.print("secondIdx: " + "\(secondIdx)")
        
        let secondPart:String = testString.subString(firstIdx+1,secondIdx)
        Swift.print("secondPart: " + "\(secondPart)")
        
        let thirdIdx:Int = secondIdx+1 + testString.subString(secondIdx+1,testString.count).indexOf("\n")
        Swift.print("thirdIdx: " + "\(thirdIdx)")
        
        let thirdPart:String = testString.subString(secondIdx+1,thirdIdx)
        Swift.print("thirdPart: " + "\(thirdPart)")
        
        let fourthPart:String = testString.subString(thirdIdx+1,testString.count)
        Swift.print("fourthPart: " + "\(fourthPart)")
        
        var commitData = (author:firstPart,date:secondPart,subject:thirdPart,body:fourthPart)
        commitData.author = commitData.author.subString("Author:".count, commitData.author.count)
        commitData.date = commitData.date.subString("Date:".count, commitData.date.count)
        commitData.subject = commitData.subject.subString("Subject:".count, commitData.subject.count)
        commitData.body = commitData.body.subString("Body:".count, commitData.body.count)
        Swift.print("commitData.author: " + "\(commitData.author)")
        Swift.print("commitData.date: " + "\(commitData.date)")
        Swift.print("commitData.subject: " + "\(commitData.subject)")
        Swift.print("commitData.body: " + "\(commitData.body)")
    }
}
