import Foundation

typealias YM = YearMonth
struct YearMonth {let year:Int,month:Int}

extension YearMonth{
    /**
     * Returns: 2016'12
     */
    static func yearMonthKey(year:Int,month:Int)->Int{
        let monthStr:String = StringParser.pad(value: month, padCount: 2, padStr: "0")
        let key:Int = (year.string + monthStr).int
        return key
    }
}
