import Foundation

class DateModifier {
    /**
     * Returns a Date instance for a date and dayOffset
     * EXAMPLE: NSDate().offsetByDays(-3)//an NSDate instance that is 3 days ago
     */
    static func offsetByDays(_ date:Date, _ days:Int)->Date{
        //swift 3 update. may work, may not work. its not including: Calendar.Options.matchStrictly
        let calendar = Calendar.current
        let newDate:Date = calendar.date(byAdding: .day, value: days, to: date)!//let newDate:Date = NSCalendar.current.dateByAddingUnit(NSCalendar.Unit.Day, value: days, toDate: date, options: Calendar.Options.matchStrictly)!
        return newDate
    }
    static func offsetByMonths(_ date:Date, _ months:Int)->Date{
        let calendar = Calendar.current
        let newDate:Date = calendar.date(byAdding: .month, value: months, to: date)!
        return newDate
    }
    static func offsetByYears(_ date:Date, _ years:Int)->Date{
        let calendar = Calendar.current
        let newDate:Date = calendar.date(byAdding: .year, value: years, to: date)!
        return newDate
    }
}
