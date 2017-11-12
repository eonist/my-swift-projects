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
}
