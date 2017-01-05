import Foundation
class FilePathParser {
    /**
     * Returns the path to where you can save your app's files. Here it is:
     */
    static func appDocPath()->String{
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        return paths[0]
    }
    /**
     * EXAMPLE: path("file:///Users/Me/Desktop/Doc.txt")/NSURL obj
     */
    static func path(stringPath:String)->NSURL{
        let url = NSURL(string: stringPath)
        return url!
    }
    /**
     * EXAMPLE: path(NSURL("file:///Users/Me/Desktop/Doc.txt"))//Users/Me/Desktop/Doc.txt
     */
    static func path(url:NSURL)->String{
        let url = url.path
        return url!
    }
    /**
     * EXAMPLE: stringPath(path("file:///Users/Me/Desktop/Doc.txt"))//"file:///Users/Me/Desktop/Doc.txt"
     */
    static func stringPath(path:NSURL)->String{
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
    static func fileName(fileURL:NSURL, _ withExtension:Bool = true)->String{
        return withExtension ? fileURL.absoluteURL.lastPathComponent! : fileURL.absoluteURL.URLByDeletingPathExtension!.lastPathComponent!
    }
    /**
     * directory
     * EXAMPLE: FilePathParser.directory(fileURL)
     */
    static func directory(fileURL:NSURL)->String{
        return fileURL.absoluteURL.URLByDeletingLastPathComponent!.absoluteString
    }
    /**
     * Returns the project resource folder
     * NOTE: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSBundle_Class/
     */
    static func resourcePath()->String{
        return NSBundle.mainBundle().resourcePath!
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