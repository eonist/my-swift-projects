import Foundation
class FileModifier{
	/**
	 * fromURL: "/path/to/old"
	 * toURL: "/path/to/new"
	 * Todo: additional catch clauses:
     * catch NSCocoaError.FileNoSuchFileError {print("Error: no such file exists")
     * catch NSCocoaError.FileReadUnsupportedSchemeError {print("Error: unsupported scheme (should be 'file://')")}
	 */
	class func move(fromURL:String,toURL:String){
		let fileManager = NSFileManager.defaultManager()
		let fromURL = NSURL(fileURLWithPath: "/path/to/old")
		let toURL = NSURL(fileURLWithPath: "/path/to/new")
		do {
		    try fileManager.moveItemAtURL(fromURL, toURL: toURL)
		} catch let error as NSError {
		    print("Error: \(error.domain)")
		}
	}
    /**
     * let str = "Super long string here"
     */
    class func write(path:String,content:String)->Bool{
        let theURL:NSURL = NSURL(fileURLWithPath: FilePathParser.appDocPath())
        let filename = theURL.URLByAppendingPathComponent("output.txt")
        do {
            try content.writeToFile(String(filename), atomically: true, encoding: NSUTF8StringEncoding)
            return true
        } catch {
            // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
        }
        return false
    }
}