import Foundation
class FileModifier{
	/**
	 * fromURL: "/path/to/old"
	 * toURL: "/path/to/new"
	 * Todo: additional catch clauses:
     * catch NSCocoaError.FileNoSuchFileError {print("Error: no such file exists")
     * catch NSCocoaError.FileReadUnsupportedSchemeError {print("Error: unsupported scheme (should be 'file://')")}
	 */
	static func move(fromURL:String,_ toURL:String){
		let fileManager = NSFileManager.defaultManager()
		let fromURL = NSURL(fileURLWithPath: fromURL)
		let toURL = NSURL(fileURLWithPath: toURL)
		do {
		    try fileManager.moveItemAtURL(fromURL, toURL: toURL)
		} catch let error as NSError {
		    print("Error: \(error.domain)")
		}
	}
    /**
     *
     */
    class func copy(fromURL:String,_ toURL:String){
        let fileManager = NSFileManager.defaultManager()
        let fromURL = NSURL(fileURLWithPath: fromURL)
        let toURL = NSURL(fileURLWithPath: toURL)
        do {
            try fileManager.copyItemAtURL(fromURL, toURL: toURL)
        }
        catch let error as NSError {
            print("Error: \(error)")
        }
    }
    /**
     * EXAMPLE: FileModifier.write("~/Desktop/del.txt".tildePath, "test")//returns true or false depending on if something was written or not
     * NOTE: this method over-writes data to files that already exists aswell 
     */
    static func write(path:String,_ content:String)->Bool{
        do {
            try content.writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding)
            return true
        } catch {
            print("failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding")
        }
        return false
    }
    /**
     * Deletes a file at PARAM: path
     */
    class func delete(path:String){
        let fileManager = NSFileManager.defaultManager()
        do {
            try fileManager.removeItemAtPath(path)
        }
        catch let error as NSError {
            print("Error: \(error)")
        }
    }
    /**
     *
     */
    static func rename(){
        let fileManager = NSFileManager.defaultManager()
        do {
            try fileManager.moveItemAtPath("hello.swift", toPath: "goodbye.swift")
        }catch let error as NSError {
            print("Error: \(error)")
        }
    }
    /**
     * Creates a folder at PARAM path
     */
    class func createFolder(path:String){
        let fileManager = NSFileManager.defaultManager()
        do {
            try fileManager.createDirectoryAtPath(path, withIntermediateDirectories: true, attributes: nil)
        }catch let error as NSError {
            print("Error: \(error)")
        }
    }
    /**
     * Append text to file
     */
    static func append(path:String,_ text:String ){
        append(path, text, text.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
    }
    /**
     * Append text to file at index
     */
    static func append(path:String,_ text:String, _ index:Int){
        let os:NSOutputStream = NSOutputStream(toFileAtPath: path, append: true)!
        os.open()
        os.write(text, maxLength: index)
        os.close()
    }
}