import Foundation

extension Date {
    /**
     * Returns a date instance for time components like: 2016,11,03,15,49,59
     */
    static func createDate(_ year:Int? = nil,_ month:Int? = nil,_ day:Int? = nil,_ hour:Int? = nil,_ minute:Int? = nil,_ second:Int? = nil)->Date?{
        let calendar = Calendar.current
        var components = DateComponents()
        if(year != nil){components.year = year!}
        if(month != nil){components.month = month!}
        if(day != nil){components.day = day!}
        if(hour != nil){components.hour = hour!}
        if(minute != nil){components.minute = minute!}
        if(second != nil){components.second = second!}
        return calendar.date(from: components)
    }
    /**
     * beta
     */
    var numOfDaysInMonth:Int{
        //parts to NSDate:
        let cal = Calendar.current
        //range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: self)
        let days = cal.range(of: .day, in: .month, for: self)
        //Swift.print("days: " + "\(days)")
        //Swift.print("days.location: " + "\(days.location)")
        //Swift.print("days.length: " + "\(days.length)")
        return days!.length//swift 3 issue<-fix the RangeExtensions.swift and this will work
    }
    var dayName:String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
    var shortDayName:String{
        return dayName != nil ? String(dayName!.characters.first!) : ""
    }
    var monthName:String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    /**
     * NOTE: there are also other date styles aviable: MediumStyle, FullStyle, NoStyle, ShortStyle, LongStyle, "EEEE"
     * NOTE: some date style examples: convertedDate: Thursday, 8 December 2016 convertedDate: 8 Dec 2016 convertedDate: 08/12/2016 convertedDate: Thursday
     * EXAMPLE: NSDate().shortDate// outputs: 08/12/2016
     */
    var shortDate:String{//TODO: move the content bellow into DateParser
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateStyle = .short//swift 3 -> was: dateFormatter.style.short
        let convertedDate = dateFormatter.string(from: self)
        //Swift.print("convertedDate: " + "\(convertedDate)")
        return convertedDate
    }
    /**
     * NSDate().offsetByDays(-3)//an NSDate instance that is 3 days ago
     */
    func offsetByDays(_ days:Int)->Date{
        return DateModifier.offsetByDays(self,days)
    }
}
