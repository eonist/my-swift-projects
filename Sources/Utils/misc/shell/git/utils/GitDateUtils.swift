import Foundation

class GitDateUtils {
    /**
     * Formats chronological date to git time-> "2016-11-12 00:00:00"
     * NOTE: YYYYMMDDHHmmss -> YYYY-MM-DD HH:mm:ss
     * Alternative name: chronologicalTime2GitTime
     * EXAMPLE: gitTime("2016"+"11"+"21"+"20"+"59"+"59")//Output: 2016-11-21 20:59:59
     */
    static func gitTime(_ chronoTime:String)->String{
        let gitTime = chronoTime.insertCharsAt([("-",4),("-",6),(" ",8),(":",10),(":",12)])
        return gitTime
    }
    /**
     * Date -> GitDate
     */
    static func gitTime(_ date:Date)->String{
        let chronoTime:String = DateParser.descendingDate(date)
        let gitTime:String = GitDateUtils.gitTime(chronoTime)
        return gitTime
    }
    /**
     * Returns an NSDate instance for a date that is derived from a commit log item with pretty format and %ci (%cd yields 2017-08-31)
     * PARAM: date: "2015-12-03 16:59:09 +0100"
     * EXAMPLE: GitLogParser.date("2015-12-03 16:59:09 +0100").shortDate//Output: "03/12/2016"
     */
    static func date(_ date:String)->Date{
        let dateParts:[String] = date.split(" ")
        let yearMonthDayParts:[String] = dateParts[0].split("-")
        //Swift.print("yearMonthDayParts: " + "\(yearMonthDayParts)")
        let year:String = yearMonthDayParts[0]
        let month:String = yearMonthDayParts[1]
        let day:String = yearMonthDayParts[2]
        //Swift.print("year.int: " + "\(year.int)")
        //Swift.print("month.int: " + "\(month.int)")
        //Swift.print("day.int: " + "\(day.int)")
        let hourMinSecParts:[String] = dateParts[1].split(":")
        //Swift.print("hourMinSecParts: " + "\(hourMinSecParts)")
        let hour:String = hourMinSecParts[0]
        let min:String = hourMinSecParts[1]
        let sec:String = hourMinSecParts[2]
        //let timeZone:String = dateParts[2]
        let date:Date = Date.createDate(year.int, month.int, day.int, hour.int, min.int, sec.int)!
        return date
    }
}
