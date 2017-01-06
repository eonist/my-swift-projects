import Foundation

class DateModifier {
    /**
     * EXAMPLE: NSDate().offsetByDays(-3)//an NSDate instance that is 3 days ago
     */
    static func offsetByDays(date:NSDate, _ days:Int)->NSDate{
        let newDate:NSDate = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Day, value: days, toDate: date, options: NSCalendarOptions.MatchStrictly)!
        return newDate
    }
}