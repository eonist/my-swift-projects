import Foundation

class DateModifier {
    /**
     * EXAMPLE: NSDate().offsetByDays(-3)//an NSDate instance that is 3 days ago
     */
    static func offsetByDays(_ date:Date, _ days:Int)->Date{
        //swift 3 update. may work, may not work. its not including: Calendar.Options.matchStrictly
        let newDate:Date = Calendar.current.date(byAdding: .day, value: days, to: date)!//let newDate:Date = NSCalendar.current.dateByAddingUnit(NSCalendar.Unit.Day, value: days, toDate: date, options: Calendar.Options.matchStrictly)!
        return newDate
    }
}
