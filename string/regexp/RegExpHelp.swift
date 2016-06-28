import Foundation

/*
NOTE: example use of associative capturing groups: (this doesnt highlight repeating captuing groups, so make an example for this as well)

let theString:NSString = "07-12-2014"
let thePattern = "(\\d{2})\\-(\\d{2})\\-(\\d{4}|\\d{2})"
let options:NSRegularExpressionOptions = NSRegularExpressionOptions.CaseInsensitive


enum DateGroupsSequence:Int{
case kDayGroup = 1, kMonthGroup, kYearGroup
}
let matches = RegExpParser.matches(theString as String, thePattern)
for match:NSTextCheckingResult in matches {

theString.substringWithRange(match.rangeAtIndex(0))
let day = theString.substringWithRange(match.rangeAtIndex(DateGroupsSequence.kDayGroup.rawValue))

let month = theString.substringWithRange(match.rangeAtIndex(DateGroupsSequence.kMonthGroup.rawValue))
let year = theString.substringWithRange(match.rangeAtIndex(DateGroupsSequence.kYearGroup.rawValue))
print("Day: "+day+", Month: "+month+", Year: "+year)
}


*/