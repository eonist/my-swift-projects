import Cocoa
class FileAsserter{
    class func exists (path: String) -> Bool {
        return NSFileManager().fileExistsAtPath(path)
    }
}