import Foundation

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
//        Swift.print("yearMonthKey: " + "\(yearMonthKey)")
        let dayStr:String = StringParser.pad(value: day, padCount: 2, padStr: "0")
//        Swift.print("dayStr: " + "\(dayStr)")
        let key:Int = (yearMonthKey.string + dayStr).int
        return key
    }
    static func yearMonthDayKey(ymd:YMD) -> Int{//convenience
//        Swift.print("ymd.year: " + "\(ymd.year)")
//        Swift.print("ymd.month: " + "\(ymd.month)")
//        Swift.print("ymd.day: " + "\(ymd.day)")
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
     * IMPORTANT: ⚠️️ must be in this format: 2016'12'24
     */
    static func year(ymd:Int) -> Int{
        let year = ymd.string.subString(0, ymd.string.count - 4).int
        //        Swift.print("ymd.string: " + "\(ymd.string)")
        //        Swift.print("year: " + "\(year)")
        return year
    }
    /**
     * Month
     * IMPORTANT: ⚠️️ must be in this format: 2016'12'24
     */
    static func month(ymd:Int) -> Int{
        return ymd.string.subString(ymd.string.count - 4, ymd.string.count-2).int
    }
    /**
     * Day
     * IMPORTANT: ⚠️️ must be in this format: 2016'12'24
     */
    static func day(ymd:Int) -> Int{
        return ymd.string.subString(ymd.string.count - 2, ymd.string.count).int
    }
}

