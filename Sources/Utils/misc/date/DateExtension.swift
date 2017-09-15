import Foundation

extension Date{
    /**
     * TODO: ⚠️️ Use explicit params
     */
    static func createDate(_ year:Int? = nil,_ month:Int? = nil,_ day:Int? = nil,_ hour:Int? = nil,_ minute:Int? = nil,_ second:Int? = nil)->Date?{/*Convenience*/
        return DateParser.createDate(year, month, day, hour, minute, second)
    }
    var numOfDaysInMonth:Int{/*Convenience*/
        return DateParser.numOfDaysInMonth(self)
    }
    var dayName:String? {/*Convenience*/
        return DateParser.dayName(self)
    }
    var shortDayName:String{/*Convenience*/
        return DateParser.shortDayName(self)
    }
    var monthName:String? {/*Convenience*/
        return DateParser.monthName(self)
    }
    var shortMonthName:String{/*Convenience*/
        return DateParser.shortMonthName(self)
    }
    var shortDate:String{/*Convenience*/
        return DateParser.shortDate(self)
    }
    var simpleDate:String{/*Convenience*/
        return DateParser.simpleDate(self)
    }
    func offsetByDays(_ days:Int)->Date{/*Convenience*/
        return DateModifier.offsetByDays(self,days)
    }
    func offsetByMonths(_ months:Int)->Date{/*Convenience*/
        return DateModifier.offsetByMonths(self, months)
    }
    func offsetByYears(_ years:Int)->Date{/*Convenience*/
        return DateModifier.offsetByYears(self, years)
    }
    func numOfDays(_ until:Date)->Int{/*Convenience*/
        return DateParser.numOfDays(self, until)
    }
    func numOfMonths(_ until:Date)->Int{/*Convenience*/
        return DateParser.numOfMonths(self, until)
    }
    func numOfYears(_ until:Date)->Int{/*Convenience*/
        return DateParser.numOfYears(self, until)
    }
    var day:Int {return Calendar.current.component(.day, from:self)}
    var month:Int {return Calendar.current.component(.month, from:self)}
    var year:Int {return Calendar.current.component(.year, from:self)}
    
    /**
     * let date = NSDate(); sleep(3); date.secsSinceStart//3.0
     */
    var secsSinceStart:Double{return abs(self.timeIntervalSinceNow)}
}
