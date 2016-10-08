import Cocoa
class FileAsserter{
    /**
     * EXAMPLE: FileAsserter.exists("~/Desktop/del.txt".tildePath)//true or false (remember to expand the tildePath)
     */
    class func exists(path: String) -> Bool {
        return NSFileManager().fileExistsAtPath(path)
    }
}