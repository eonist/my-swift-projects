import Foundation

class FilePathModifier {
    /**
     * New
     */
    static func normalize(url:String) -> String{
        let normalizedURL:String = {
            if FilePathAsserter.isAbsolute(path: url) {
                return url
            }else {
                return ""
            }
        }()
        return normalizedURL
    }
}
