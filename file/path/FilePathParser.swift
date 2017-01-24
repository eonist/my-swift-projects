import Foundation
class FilePathParser {
    /**
     * Returns the path to where you can save your app's files. Here it is:
     */
    static func appDocPath()->String{
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        return paths[0]
    }
    /**
     * EXAMPLE: path("file:///Users/Me/Desktop/Doc.txt")/NSURL obj
     */
    static func path(_ stringPath:String)->URL{
        let url = URL(string: stringPath)
        return url!
    }
    /**
     * EXAMPLE: path(NSURL("file:///Users/Me/Desktop/Doc.txt"))//Users/Me/Desktop/Doc.txt
     */
    static func path(_ url:URL)->String{
        let url = url.path
        return url
    }
    /**
     * EXAMPLE: stringPath(path("file:///Users/Me/Desktop/Doc.txt"))//"file:///Users/Me/Desktop/Doc.txt"
     */
    static func stringPath(_ path:URL)->String{
        return path.absoluteString
    }
    /**
     * NOTE: you can also do: NSString(string: self).stringByExpandingTildeInPath
     */
    static func userHomePath()->String{
        return NSHomeDirectory()
    }
    /**
     * fileName
     * EXAMPLE: FilePathParser.fileName(fileURL)
     * NOTE: you can also use: 
     * let attributes = try! NSURL(fileURLWithPath:"~/Desktop/temp.xml".tildePath).resourceValuesForKeys([NSURLContentModificationDateKey, NSURLNameKey])
     * let filename = attributes[NSURLNameKey] as! String
     */
    static func fileName(_ fileURL:URL, _ withExtension:Bool = true)->String{
        return withExtension ? fileURL.absoluteURL.lastPathComponent : fileURL.absoluteURL.deletingPathExtension().lastPathComponent//was-> absoluteURL.URLByDeletingPathExtension before swift 3 upgrade
    }
    /**
     * directory
     * EXAMPLE: FilePathParser.directory(fileURL)
     */
    static func directory(_ fileURL:URL)->String{
        return fileURL.absoluteURL.deletingPathExtension().absoluteString
    }
    /**
     * Returns the project resource folder
     * NOTE: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSBundle_Class/
     */
    static func resourcePath()->String{
        return Bundle.main.resourcePath!
    }
    /**
     * fileExtension("~/Desktop/temp.xml".tildePath)//xml
     */
    static func fileExtension(filePath:String) -> String{
        return NSString(string:filePath).pathExtension
    }
}
extension FilePathParser{
    /**
     * Convenience
     */
    static func fileName(fileURL:String, _ withExtension:Bool = true) -> String{
        return fileName(path(fileURL), withExtension)
    }
}
