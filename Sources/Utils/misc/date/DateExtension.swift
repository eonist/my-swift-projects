import Foundation

extension Date {
    /**
     * Returns a date instance for time components like: 2016,11,03,15,49,59
     */
    static func createDate(_ year:Int? = nil,_ month:Int? = nil,_ day:Int? = nil,_ hour:Int? = nil,_ minute:Int? = nil,_ second:Int? = nil)->Date?{
        return DateParser.createDate(year, month, day, hour, minute, second)
    }
    /**
     * beta
     * TODO: move into DateParser
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
    /**
     * TODO: move into DateParser
     */
    var dayName:String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
    /**
     * TODO: move into DateParser
     */
    var shortDayName:String{
        return dayName != nil ? String(dayName!.characters.first!) : ""
    }
    /**
     * TODO: move into DateParser
     */
    var monthName:String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    var shortDate:String{/*Convenience*/
        return DateParser.shortDate(self)
    }
    /**
     * NSDate().offsetByDays(-3)//an NSDate instance that is 3 days ago
     */
    func offsetByDays(_ days:Int)->Date{
        return DateModifier.offsetByDays(self,days)
    }
}
