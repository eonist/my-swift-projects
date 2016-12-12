import Foundation

extension NSDate {
    /**
     * Returns a date instance for time components like: 2016,11,03,15,49,59
     */
    static func createDate(year:Int? = nil,_ month:Int? = nil,_ day:Int? = nil,_ hour:Int? = nil,_ minute:Int? = nil,_ second:Int? = nil)->NSDate?{
        let calendar = NSCalendar.currentCalendar()
        let components = NSDateComponents()
        if(year != nil){components.year = year!}
        if(month != nil){components.month = month!}
        if(day != nil){components.day = day!}
        if(hour != nil){components.hour = hour!}
        if(second != nil){components.second = second!}
        return calendar.dateFromComponents(components)
    }
    /**
     * beta
     */
    var numOfDaysInMonth : Int{
        //parts to NSDate:
        let cal = NSCalendar.currentCalendar()
        let days:NSRange = cal.rangeOfUnit(NSCalendarUnit.Day, inUnit: NSCalendarUnit.Month, forDate: self)
        //Swift.print("days: " + "\(days)")
        //Swift.print("days.location: " + "\(days.location)")
        //Swift.print("days.length: " + "\(days.length)")
        return days.length
    }
    
    /**
     *
     */
    var dayName:String? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.stringFromDate(self)
    }
    /**
     *
     */
    var shortDayName:String{
        return dayName != nil ? String(dayName!.characters.first!) : ""
    }
    
    var monthName: String? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.stringFromDate(self)
    }
    /**
     * NOTE: there are also other date styles aviable: MediumStyle, FullStyle, NoStyle, ShortStyle, LongStyle, "EEEE"
     * NOTE: some date style examples: convertedDate: Thursday, 8 December 2016 convertedDate: 8 Dec 2016 convertedDate: 08/12/2016 convertedDate: Thursday
     * EXAMPLE: NSDate().shortDate// outputs: 08/12/2016
     */
    var shortDate:String{
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale.currentLocale()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        let convertedDate = dateFormatter.stringFromDate(self)
        //Swift.print("convertedDate: " + "\(convertedDate)")
        return convertedDate
    }
    /**
     * 2y, 11m, 3w, 4h, 2d, 5m,  3sec
     */
    func relativeTime(a:NSDate,_ b:NSDate)->[Int]{
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
        let timeUnits:[Int] = [yearsAgo,monthsAgo,weeksAgo,daysAgo,hoursAgo,minutesAgo,secondsAgo]
        let relativeTime:[Int] = []
        timeUnits.forEach{
            if($0 > 0){
                relativeTime.append($0)
            }
        }
        return relativeTime
    }
}
