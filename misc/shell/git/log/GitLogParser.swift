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
}
