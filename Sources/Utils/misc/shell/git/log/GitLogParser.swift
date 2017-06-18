import Foundation
/**
 * TODO: ⚠️️ You can probably move this method into the folder where GitSync.swift is
 */
class GitLogParser {
    static var debugCounter:Int = 0
    /**
     * Compacts the bodyStr aka the commit description
     */
    static func compactBody(_ bodyStr:String) -> String{
        //if(debugCounter == 0){Swift.print("🦄 bodyStr: >\(bodyStr)<")}
        let preprocessedBody = Utils.preProcess(bodyStr)
        //if(debugCounter == 0){Swift.print("🦄 preprocessedBody: >\(preprocessedBody)<")}
        let compactBody:String = Utils.compact(preprocessedBody)
        //if(debugCounter == 0){Swift.print("🦄 compactBody: >" + "\(compactBody)<")}
        debugCounter = 1
        return compactBody
    }
}
private class Utils{
    /**
     * PreProcess the body string
     */
    static func preProcess(_ str:String)->String{
        //remove the ' char from the beginng and end
        //strip linebreaks from the beginning and end of bodyStr
        //if(str.count > 5) {str = str.subString(3, str.count-2)}
        return trim(str)
    }
    static var trimPattern:String = "^(?:'?\n*\r*)(.*?)(?:\n*\r*'?)$"//"(?:^'?\n*)(.*?)(?:(\n+?'?$)|('$)|$)"
    /**
     * NOTE: trims away astray characters from left and right of the body
     */
    static func trim(_ str:String)->String{
        let options:NSRegularExpression.Options = [.caseInsensitive, .dotMatchesLineSeparators]//we need the S-flag (.DotMatches....) to allow for capturing line-breaks with >.*?<
        for match in str.matches(trimPattern,options){//its not pretty but it works
            if(match.numberOfRanges > 1){
                return match.value(str, 1)/*capturing group 1*/
            }
        }
        fatalError("woops something is wrong")
    }
    /**
     * Compacts the body string
     */
    static func compact(_ str:String) -> String{
        let parts:[String] = str.split("\n")//split at linebreaks
        guard let firstPart:String = parts.first else{fatalError("first not avilable")}
        if(firstPart.count > 100){/*the first string is longer than allowed*/
            let a:String = firstPart.subStr(0, 100)
            var b:String = firstPart.subString(100, firstPart.count)
            b = b.count > 100 ? b.subStr(0, 100) + "..." : b
            return a + "\n" + b
        }else{/*First part is within allowed length*/
            var secondPart:String = ""
            if(parts.count > 1){
                secondPart = parts[1]
                secondPart = secondPart.count > 100 ? secondPart.subStr(0, 100) + "..." : secondPart
            }
            return firstPart + "\n" + secondPart
        }
    }
}
