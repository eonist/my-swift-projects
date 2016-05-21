import Foundation
class FilePathParser {//TODO:rename to FilePathParser
    /**
     * Returns the path to where you can save your app's files. Here it is:
     */
    class func appDocPath()->String{
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        return paths[0]
    }
    /**
     * EXAMPLE: path("file:///Users/Me/Desktop/Doc.txt")/NSURL obj
     */
    class func path(stringPath:String)->NSURL{
        let url = NSURL(string: stringPath)
        return url!
    }
    /**
     * EXAMPLE: path(NSURL("file:///Users/Me/Desktop/Doc.txt"))//Users/Me/Desktop/Doc.txt
     */
    class func path(url:NSURL)->String{
        let url = url.path
        return url!
    }
    /**
     * EXAMPLE: stringPath(path("file:///Users/Me/Desktop/Doc.txt"))//"file:///Users/Me/Desktop/Doc.txt"
     */
    class func stringPath(path:NSURL)->String{
        return path.absoluteString
    }
    /**
     * NOTE: you can also do: NSString(string: self).stringByExpandingTildeInPath
     */
    class func userHomePath()->String{
        return NSHomeDirectory()
    }
    /**
     * fileName
     * NOTE: To remove the extension add: .URLByDeletingPathExtension! to the fold
     * EXAMPLE: FilePathParser.fileName(fileURL)
     */
    class func fileName(fileURL:NSURL)->String{
        return fileURL.absoluteURL.lastPathComponent!
    }
    /**
     * directory
     * EXAMPLE: FilePathParser.directory(fileURL)
     */
    class func directory(fileURL:NSURL)->String{
        return fileURL.absoluteURL.URLByDeletingLastPathComponent!.absoluteString
    }
}