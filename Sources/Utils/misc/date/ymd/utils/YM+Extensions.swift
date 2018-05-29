import Foundation

extension YearMonth{
    /**
     * Returns: 2016'12
     */
    static func yearMonthKey(year:Int,month:Int)->Int{
        let monthStr:String = StringParser.pad(value: month, padCount: 2, padStr: "0")
        let key:Int = (year.string + monthStr).int!
        return key
    }
}
extension YearMonth{
    /**
     * Year
     * IMPORTANT: ⚠️️ must be in this format: 2016'12
     */
    static func year(ym:Int) -> Int{
        let year = ym.string.subString(0, ym.string.count - 2).int!
        return year
    }
    /**
     * Month
     * IMPORTANT: ⚠️️ must be in this format: 2016'12
     */
    static func month(ym:Int) -> Int{
        return ym.string.subString(ym.string.count - 2, ym.string.count).int!
    }
}

