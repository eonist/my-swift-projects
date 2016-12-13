import Foundation

class DateParser {
    /**
     * Returns relative time like: 2y, 11m, 3w, 4h, 2d, 5m,  3sec (aka: time ago)
     * NOTE: the approche bellow is Naive. There are more elegant ways of doing this. But this offers more customization in the future.
     * EXAMPLE: DateParser.relativeTime(NSDate(),today.offsetByDays(-3))//Output: [(3,"d")]
     */
    static func relativeTime(a:NSDate,_ b:NSDate) -> [(value:Int,type:String)]{
        let calendar = NSCalendar.currentCalendar()
        let aComponents = calendar.components([.Year, .Month, .Day, .Hour, .Minute, .Second], fromDate: a)
        let bComponents = calendar.components([.Year, .Month, .Day, .Hour, .Minute, .Second], fromDate: b)
        let yearsAgo:Int = aComponents.year - bComponents.year//cur year - year = 0
        let monthsAgo:Int = aComponents.month - bComponents.month//cur month - month = 0
        let daysAgo:Int = aComponents.day - bComponents.day//cur day - day = 0
        var weeksAgo:Int = 0
        if(daysAgo >= 7){
            weeksAgo = daysAgo / 7
        }
        let hoursAgo:Int = aComponents.hour - bComponents.hour//cur hour - hour = 0
        let minutesAgo:Int = aComponents.minute - bComponents.minute//cur min - min = 0
        let secondsAgo:Int = aComponents.second - bComponents.second//cur sec - sec = 4
        //result: 4s ago
        let timeUnits:[(value:Int,type:String)] = [(yearsAgo,"y"),(monthsAgo,"M"),(weeksAgo,"w"),(daysAgo,"d"),(hoursAgo,"h"),(minutesAgo,"m"),(secondsAgo,"s")]
        var relativeTime:[(value:Int,type:String)] = []
        timeUnits.forEach{
            if($0.value > 0){relativeTime.append($0)}
        }
        return relativeTime
    }
    /**
     * Returns a date formated like: 201612035959 aka YYYYMMDDHHMMSS
     * NOTE: ODBC canonical
     */
    static func decendingDate(date:NSDate) -> String{
        let formatter:NSDateFormatter = NSDateFormatter()
        formatter.dateFormat = "yyyyMMddHHmmss"
        let dateStr:String = formatter.stringFromDate(NSDate())
        //Swift.print("dateTimePrefix: " + "\(dateTimePrefix)")
        return dateStr
    }
}
