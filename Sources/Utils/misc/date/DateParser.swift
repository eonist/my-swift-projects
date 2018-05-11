import Foundation

class DateParser {
    /**
     * Returns relative time like: 2y, 11m, 3w, 4h, 2d, 5m,  3sec (aka: time ago)
     * NOTE: the approche bellow is Naive. There are more elegant ways of doing this. But this offers more customization in the future (It has been upgraded, may need additional testing)
     * EXAMPLE: try? DateParser.relativeTime(from:NSDate(),to:today.offsetByDays(-3))//Output: [(3,"d")] // "\(String(relativeTime.value) + relativeTime.type.rawValue.full)" 3day
     */
    static func relativeTime(from:Date,to:Date)  -> [(value:Int,type:DateType)]{
        let yearsAgo:Int = numOfYears(from, to)
        let monthsAgo:Int = numOfMonths(from, to)
        let daysAgo:Int = numOfDays(from, to)
        let hoursAgo:Int = numOfHours(from,to)
        let minutesAgo:Int = numOfMinutes(from, to)
        let secondsAgo:Int = numOfSeconds(from, to)
        let weeksAgo:Int = {
            return daysAgo >= 7 ? daysAgo / 7 : 0
        }()
        let timeUnits:[(value:Int,type:DateType)] = {
            return [(yearsAgo,DateType.y),(monthsAgo,DateType.M),(weeksAgo,DateType.w),(daysAgo,DateType.d),(hoursAgo,DateType.h),(minutesAgo,DateType.m),(secondsAgo,DateType.s)]
        }()
        return timeUnits.filter(){
            $0.value > 0
        }
    }
    /**
     * Returns a date formated like: 201612035959 aka YYYYMMDDHHMMSS
     * NOTE: The purpouse of this method is to provide an easy way to sort dates (as this format is as sortable as it gets)
     * TRIVIA: The name of this time format: ODBC canonical (some argue it's the ISO 8601 format)
     * TRIVIA: The name descendingDate is a name that describes what the format does. It is not the official name (alt: chronologically descending)
     * NOTE: the reverse is: let formatter = DateFormatter();formatter.dateFormat = "yyyyMMddhhmmss";let dateStr:String =  sortedSections[section];let date = formatter.date(from: dateStr)
     */
    static func descendingDate(_ date:Date) -> String{
        let formatter:DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyyMMddHHmmss"
        let dateStr:String = formatter.string(from: date)
        //Swift.print("dateTimePrefix: " + "\(dateTimePrefix)")
        return dateStr
    }
    /**
     * Returns a date instance for time components like: 2016,11,03,15,49,59
     * IMPORTANT: ⚠️️⚠️️⚠️️ if you pass 0 in any of the arguments the returned date is all wrong, use nil and make sure your var is not 0
     * TODO: ⚠️️ should throw
     */
    static func createDate(_ year:Int? = nil,_ month:Int? = nil,_ day:Int? = nil,_ hour:Int? = nil,_ minute:Int? = nil,_ second:Int? = nil)->Date?{
        if year == 0 || month == 0 || day == 0 {//this may not apply to hour,min,sec so these arent tested
            fatalError("can't be 0")
        }
        let calendar = Calendar.current
        var components = DateComponents()
        if year != nil {components.year = year!}//⚠️️ use if let
        if month != nil {components.month = month!}
        if day != nil {components.day = day!}
        if hour != nil {components.hour = hour!}
        if minute != nil {components.minute = minute!}
        if second != nil {components.second = second!}
        return calendar.date(from: components)
    }
    /**
     * NOTE: there are also other date styles aviable: MediumStyle, FullStyle, NoStyle, ShortStyle, LongStyle, "EEEE"
     * NOTE: some date style examples: convertedDate: Thursday, 8 December 2016 convertedDate: 8 Dec 2016 convertedDate: 08/12/2016 convertedDate: Thursday
     * EXAMPLE: NSDate().shortDate// outputs: 08/12/2016
     * TODO: move into DateParser
     */
    static func shortDate(_ date:Date) -> String{//TODO: move the content bellow into DateParser
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateStyle = .short//swift 3 -> was: dateFormatter.style.short
        let convertedDate = dateFormatter.string(from:date)
        //Swift.print("convertedDate: " + "\(convertedDate)")
        return convertedDate
    }
    /**
     * TODO: This can be done with a formater. Replace it with this in the future
     */
    static func simpleDate(_ date:Date) -> String{
        let year:String = date.year.string
        let month:String = date.month.string
        let day:String = date.day.string
        return "\(year)/\(month)/\(day)"
    }
    static func monthName(_ date:Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: date)
    }
    /**
     * Returns m,t,w,t,f,s,s for date
     */
    static func shortDayName(_ date:Date)->String{
        return date.dayName != nil ? String(date.dayName!.string.first!) : ""
    }
    /**
     * Jan,Feb,Mar etc
     */
    static func shortMonthName(_ date:Date)->String{
        return date.monthName != nil ? String(date.monthName!.subStr(0, 3)) : ""
    }
    static func dayName(_ date:Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
    }
    /**
     * NOTE: there is also days.location,days.length,range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: self)
     */
    static func numOfDaysInMonth(_ date:Date)->Int?{
        let cal = Calendar.current
        guard let days = cal.range(of: .day, in: .month, for: date) else {return nil}
        let length:Int = days.upperBound - days.lowerBound
        return length
    }
    
    /**
     * Seconds
     */
    static func numOfSeconds(_ from:Date,_ to:Date) -> Int{
        let num:Int? = Calendar.current.dateComponents([.second], from: from, to: to).second
        return num ?? 0
    }
    /**
     * Minutes
     */
    static func numOfMinutes(_ from:Date,_ to:Date) -> Int{
        let num:Int? = Calendar.current.dateComponents([.minute], from: from, to: to).minute
        return num ?? 0
    }
    /**
     * Hours
     */
    static func numOfHours(_ from:Date,_ to:Date) -> Int{
        let num:Int? = Calendar.current.dateComponents([.hour], from: from, to: to).hour
        return num ?? 0
    }
    static func numOfDays(_ from:Date,_ to:Date) -> Int{
        let num:Int? = Calendar.current.dateComponents([.day], from: from, to: to).day
        return num ?? 0
    }
    /**
     * Returns number of months between two dates
     */
    static func numOfMonths(_ from:Date,_ to:Date) -> Int{
        let num:Int? = Calendar.current.dateComponents([.month], from: from, to: to).month
        return num ?? 0
    }
    /**
     * EXAMPLE:
     * let from:Date = DateParser.createDate(2011)!
     * let until:Date = from.offsetByMonths(25)
     * from.numOfYears(until)//2
     */
    static func numOfYears(_ from:Date,_ to:Date) -> Int{
        let num:Int? = Calendar.current.dateComponents([.year], from: from, to: to).year
        return num ?? 0
    }
    /**
     * EXAMPLE: date("2018-05-01T18:38:43.162Z", format:"yyyy-MM-dd'T'HH:mm:ss.SSSz") //2018-05-01 18:38:43 +0000
     * Format-example: 2018-05-01T18:38:43.162Z (ISO 8601) (standard json)
     * Format: 2018-05-01T18:38:43.162Z -> "Y-MM-dd'T'HH:mm:ssZ"
     * Z - indicates that the time value is the time in Greenwich, England, or UTC time.
     */
    static func date(_ dateStr:String, format:String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let date = formatter.date(from:dateStr)
        return date
    }
}

extension DateParser {
    /**
     * Used in the relativeDate method
     */
    enum DateError : Error {
        case error(String)
    }
    /**
     * Used in the relativeDate method
     */
    enum DateType:String{
        case y = "y"
        case M = "M"
        case w = "w"
        case d = "d"
        case h = "h"
        case m = "m"
        case s = "s"
        var full:String {
            switch self {
            case .y:
                return "year"
            case .M:
                return "month"
            case .w:
                return "week"
            case .d:
                return "day"
            case .h:
                return "hour"
            case .m:
                return "minute"
            case .s:
                return "second"
            }
        }
        /**
         * Minutes, Hours, Seconds etc
         */
        func rich(value:Int) -> String{
            let isPlural:Bool = value > 1
            return isPlural ? self.full + "s" : self.full
        }
    }
}
