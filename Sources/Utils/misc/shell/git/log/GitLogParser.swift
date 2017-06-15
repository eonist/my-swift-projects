import Foundation

class GitLogParser {
    static var debugCounter:Int = 0
    /**
     * Returns a ComitData instance that is populated with auther, date, subject, body
     * EXAMPLE: GitLogParser.commitData("Hash:4caecd \n Author:Eonist \n Date:2015-12-03 16:59:09 +0100 \n Subject:'abc' \n Body:'123'")//Output: a CommitData instance
     * NOTE: the log data is formated using --pretty=format
     */
    static func commitData(_ input:String) -> CommitData{
        //Swift.print("input: " + "\(input)")
        let firstIdx:Int = input.indexOf("\n")
        //Swift.print("firstIdx: " + "\(firstIdx)")
        let firstPart:String = input.subString(0,firstIdx)
        //Swift.print("firstPart: " + "\(firstPart)")
        let secondIdx:Int = firstIdx+1 + input.subString(firstIdx+1,input.count).indexOf("\n")
        //Swift.print("secondIdx: " + "\(secondIdx)")
        let secondPart:String = input.subString(firstIdx+1,secondIdx)
        //Swift.print("secondPart: " + "\(secondPart)")
        let thirdIdx:Int = secondIdx+1 + input.subString(secondIdx+1,input.count).indexOf("\n")
        //Swift.print("thirdIdx: " + "\(thirdIdx)")
        let thirdPart:String = input.subString(secondIdx+1,thirdIdx)
        //Swift.print("thirdPart: " + "\(thirdPart)")
        let fourthIdx:Int = thirdIdx+1 + input.subString(thirdIdx+1,input.count).indexOf("\n")
        //Swift.print("fourthIdx: " + "\(fourthIdx)")
        let fourthPart:String = input.subString(thirdIdx+1,fourthIdx)
        //Swift.print("fourthPart: " + "\(fourthPart)")
        let fifthPart:String = input.subString(fourthIdx+1,input.count)
        //Swift.print("fifthPart: " + "\(fifthPart)")
        
        let hash = firstPart.subString("Hash:".count, firstPart.count)
        let author = secondPart.subString("Author:".count, secondPart.count)
        let date = thirdPart.subString("Date:".count, thirdPart.count)
        let subject = fourthPart.subString("Subject:".count, fourthPart.count)
        let body = fifthPart.subString("Body:".count, fifthPart.count)
        let commitData:CommitData = CommitData(hash:hash,author:author,date:date,subject:subject,body:body)
        /*
        Swift.print("commitData.hash: " + "\(commitData.hash)")
        Swift.print("commitData.author: " + "\(commitData.author)")
        Swift.print("commitData.date: " + "\(commitData.date)")
        Swift.print("commitData.subject: " + "\(commitData.subject)")
        Swift.print("commitData.body: " + "\(commitData.body)")
        */
        return commitData
    }
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
        var str = str//swift 3
        //Swift.print("preProcess")
        //remove the ' char from the beginng and end
        //strip linebreaks from the beginning and end of bodyStr
        //if(str.count > 5) {str = str.subString(3, str.count-2)}
        str = trim(str)
        return str
    }
    /**
     * NOTE: trims away astray characters from left and right of the body
     */
    static func trim(_ str:String)->String{
        var retVal:String = ""
        let pattern = "^(?:'?\n*\r*)(.*?)(?:\n*\r*'?)$"//"(?:^'?\n*)(.*?)(?:(\n+?'?$)|('$)|$)"
        let options:NSRegularExpression.Options = [.caseInsensitive, .dotMatchesLineSeparators]//we need the S-flag (.DotMatches....) to allow for capturing line-breaks with >.*?<
        str.matches(pattern,options).forEach{//its not pretty but it works
            if($0.numberOfRanges > 1){
                let body:String = $0.value(str, 1)/*capturing group 1*/
                //Swift.print(">"+body+"<")
                retVal = body
            }else{
                Swift.print(str)
                fatalError("woops something is wrong")
            }
        }
        return retVal
    }
    /**
     * Compacts the body string
     */
    static func compact(_ str:String) -> String{
        //Swift.print("compact")
        let parts = str.split("\n")//split at linebreaks
        //Swift.print("parts.count: " + "\(parts.count)")
        let firstPart = parts[0]
        //Swift.print("firstPart.count: " + "\(firstPart.count)")
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
