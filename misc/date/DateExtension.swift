import Foundation

extension NSDate {
    /**
     * beta
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
    var shortNameDayOfWeek:String?{
        return String(dayName?.characters.first)
    }
    
    var monthName: String? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.stringFromDate(self)
    }
}
