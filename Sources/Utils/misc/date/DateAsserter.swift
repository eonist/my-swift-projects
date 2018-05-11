import Foundation

class DateAsserter {
    /**
     * DateAsserter.isDate("17/01/12")//true
     */
    static func isDate(dateStr:String) -> Bool{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy/mm/dd"
        let date:Date? = dateFormatter.date(from: dateStr)
        let isValideDate:Bool = date != nil
        return isValideDate
    }
    static func assertHour(_ a:Date,with b:Date) -> Bool{
        //        Swift.print("a.year:  \(a.year)")
        //        Swift.print("b.year:  \(b.year)")
        //        Swift.print("a.month:  \(a.month)")
        //        Swift.print("b.month:  \(b.month)")
        //        Swift.print("a.day:  \(a.day)")
        //        Swift.print("b.day:  \(b.day)")
        //        Swift.print("a.hour:  \(a.hour)")
        //        Swift.print("b.hour:  \(b.hour)")
        return a.year == b.year && a.month == b.month && a.day == b.day && a.hour == b.hour
    }
    static func assertDay(_ a:Date,with b:Date) -> Bool{
        return a.year == b.year && a.month == b.month && a.day == b.day
    }
}
