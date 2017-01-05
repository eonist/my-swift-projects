import Cocoa
class FileAsserter{
    /**
     * EXAMPLE: FileAsserter.exists("~/Desktop/del.txt".tildePath)//true or false (remember to expand the tildePath)
     */
    static func exists(path: String) -> Bool {
        return NSFileManager().fileExistsAtPath(path)
    }
}