/*
 * EXAMPLE: let string = "🇩🇪€4€9"
 * let matches = matchesForRegexInText("[0-9]", text: string)
 * print(matches)
 * // [4, 9]
 * NOTE: NSRegularExpression. https://developer.apple.com/library/mac/documentation/Foundation/Reference/NSRegularExpression_Class/index.html
 */
func match(regex: String!, text: String!) -> [String] {
    do {
        let regex = try NSRegularExpression(pattern: regex, options: [])
        let nsString = text as NSString
        let results = regex.matchesInString(text,options: [], range: NSMakeRange(0, nsString.length))
        return results.map { nsString.substringWithRange($0.range)}
    } catch let error as NSError {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}


