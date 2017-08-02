import Foundation

class FilePathAsserter {
    /**
     * Tests if a path is absolute /User/John/ or relative : ../../ or styles/design/
     */
    static func isAbsolute(_ path:String, pathSeperator:String = "/") -> Bool{
        return path.hasPrefix(pathSeperator)
    }
    static func isBacklash(_ path:String) -> Bool{//the name is not great, improve later
        return path.hasPrefix("../")
    }
    /**
     * New, naive approche
     */
    static func isFilePath(_ path:String,pathSeperator:String = "/") -> Bool{
        return path.hasPrefix(pathSeperator) || path.hasPrefix(".."+pathSeperator)
    }
    /**
     *
     */
    static func isTildePath(_ path:String) -> Bool{
        return path.hasPrefix("~")
    }
}
