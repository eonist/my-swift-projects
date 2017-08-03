import Foundation
/**
 * There is also tildify which makes file paths user agnostic (~ instad of hardocded user)
 */
class FilePathModifier {
    /**
     * EXAMPLE: FilePathModifier.normalize("/Users/John/Desktop/temp/../test.txt".tildePath)///Users/John/Desktop/test.txt
     */
    static func normalize(_ urlStr:String) -> String{
        let url:URL = FilePathParser.path(urlStr)
        let normalizedURL:URL = url.standardized
        return FilePathParser.path(normalizedURL)
    }
    /**
     * PARAM: baseURL: must be absolute: "Users/John/Desktop/temp" 
     * RETURN: asolute paths aka: Users/John/... (use path.tildify to make them user agnostic)
     * EXAMPLE: Swift.print(expand("/Users/John/Desktop/temp"))///Users/John/Desktop/temp
     * EXAMPLE: Swift.print(expand("~/Desktop/test.txt"))///Users/John/Desktop/test.txt
     * EXAMPLE: Swift.print(expand("/temp/colors/star.svg",baseURL:"/Users/John/Desktop"))///Users/John/Desktop/temp/colors/star.svg
     * EXAMPLE: Swift.print(expand("star.svg",baseURL:"/Users/John/Desktop"))///Users/John/Desktop/star.svg
     * IMPORTANT: ⚠️️ Tilde paths can't have backlash syntax like ../../ etc
     */
    static func expand(_ filePath:String, baseURL:String = "") -> String{
        if FilePathAsserter.isTildePath(filePath) {
            return filePath.tildePath
        }else if FilePathAsserter.isBacklash(filePath) {//isRelative
//            Swift.print("isBacklash: \(baseURL + filePath)")
            let baseURL = baseURL.hasSuffix("/") ? baseURL : baseURL + "/"
            return FilePathModifier.normalize(baseURL + filePath)//returns absolute path
        }else if FileAsserter.exists(filePath){//absolute path that exists
            return filePath
        }else if FilePathAsserter.isAbsolute(filePath){//absolute but doesn't exists
            return baseURL + filePath
        }else{//must be just I.E: "star.svg"
            let baseURL = baseURL.hasSuffix("/") ? baseURL : baseURL + "/"
            return baseURL + filePath
        }
    }
}
