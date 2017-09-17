import Foundation
/**
 * NOTE: the drawback of making it hashable is that its harder to debug the key
 */
typealias YMD = YearMonthDay
struct YearMonthDay/*:Hashable*/ {
    let year:Int,month:Int,day:Int
//    var hashValue:Int {//⚠️️  it could be that you need to do padding on the month and day here.
//        return "(\(year),\(month),\(day))".hashValue
//    }
//    static func == (lhs:YearMonthDay, rhs:YearMonthDay) -> Bool {
//        return lhs.year == rhs.year && lhs.month == rhs.month && lhs.day == rhs.day
//    }
}
//Accessors
extension YearMonthDay{
    var date:Date? {return Date.createDate(self.year, self.month, self.day)}
    var int:Int {return YMD.yearMonthDayKey(ymd: self)}
}

extension YearMonthDay{
    /**
     * Returns: 2016'12'24
     */
    static func yearMonthDayKey(year:Int,month:Int,day:Int) -> Int{
        let yearMonthKey:Int = YM.yearMonthKey(year: year, month: month)
        let dayStr:String = StringParser.pad(value: day, padCount: 2, padStr: "0")
        let key:Int = (yearMonthKey.string + dayStr).int
        return key
    }
    static func yearMonthDayKey(ymd:YMD) -> Int{//convenience
        return yearMonthDayKey(year: ymd.year, month: ymd.month, day: ymd.day)
    }
}
//Utils
extension YearMonthDay{
    static func ymd(ymd:Int) -> YMD{
        return .init(year:YMD.year(ymd:ymd),month:YMD.month(ymd:ymd),day:YMD.day(ymd:ymd))
    }
    /**
     * Year
     */
    static func year(ymd:Int) -> Int{
        return ymd.string.subStr(0, ymd.string.count - 4).int
    }
    /**
     * Month
     */
    static func month(ymd:Int) -> Int{
        return ymd.string.subString(ymd.string.count - 4, ymd.string.count-2).int
    }
    /**
     * Day
     */
    static func day(ymd:Int) -> Int{
        return ymd.string.subString(ymd.string.count - 2, ymd.string.count).int
    }
}
