import Cocoa

class FileAsserter{
    /**
     * EXAMPLE: FileAsserter.exists("~/Desktop/del.txt".tildePath)//true or false (remember to expand the tildePath)
     */
    static func exists(_ path:String) -> Bool {
        return FileManager().fileExists(atPath: path)
    }
    /**
     * New
     */
    static func hasContent(_ filePath:String) -> Bool{
        if let content:[String] = FileParser.contentOfDir(filePath){
            return !content.isEmpty
        }else {
            return false
        }
    }
}
