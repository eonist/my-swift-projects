import Foundation

class FilePathModifier {
    /**
     * EXAMPLE: FilePathModifier.normalize("/Users/John/Desktop/temp/../test.txt".tildePath)///Users/John/Desktop/test.txt
     */
    static func normalize(_ urlStr:String) -> String{
        let url:URL = FilePathParser.path(urlStr)
        let normalizedURL:URL = url.standardized
        return FilePathParser.path(normalizedURL)
    }
}
