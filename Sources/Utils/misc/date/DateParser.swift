import Foundation

class DateParser {
    /**
     * Returns relative time like: 2y, 11m, 3w, 4h, 2d, 5m,  3sec (aka: time ago)
     * NOTE: the approche bellow is Naive. There are more elegant ways of doing this. But this offers more customization in the future
     * EXAMPLE: DateParser.relativeTime(NSDate(),today.offsetByDays(-3))//Output: [(3,"d")]
     */
    static func relativeTime(_ a:Date,_ b:Date) -> [(value:Int,type:String)]{
        let calendar:Calendar = Calendar.current
        let aComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: a)
        let bComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: b)
        let yearsAgo:Int = aComponents.year! - bComponents.year!//cur year - year = 0
        let monthsAgo:Int = aComponents.month! - bComponents.month!//cur month - month = 0
        let daysAgo:Int = aComponents.day! - bComponents.day!//cur day - day = 0
        var weeksAgo:Int = 0
        if(daysAgo >= 7){
            weeksAgo = daysAgo / 7
        }
        let hoursAgo:Int = aComponents.hour! - bComponents.hour!//cur hour - hour = 0
        let minutesAgo:Int = aComponents.minute! - bComponents.minute!//cur min - min = 0
        let secondsAgo:Int = aComponents.second! - bComponents.second!//cur sec - sec = 4
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
     * NOTE: The purpouse of this method is to provide an easy way to sort dates (as this format is as sortable as it gets)
     * TRIVIA: The name of this time format: ODBC canonical (some argue it's the ISO 8601 format)
     * TRIVIA: The name descendingDate is a name that describes what the format does. It is not the official name (alt: chronologically descending)
     */
    static func descendingDate(_ date:Date) -> String{
        let formatter:DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyyMMddHHmmss"
        let dateStr:String = formatter.string(from: date)
        //Swift.print("dateTimePrefix: " + "\(dateTimePrefix)")
        return dateStr
    }
}