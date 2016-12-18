import Foundation
class FileModifier{
	/**
	 * fromURL: "/path/to/old"
	 * toURL: "/path/to/new"
	 * Todo: additional catch clauses:
     * catch NSCocoaError.FileNoSuchFileError {print("Error: no such file exists")
     * catch NSCocoaError.FileReadUnsupportedSchemeError {print("Error: unsupported scheme (should be 'file://')")}
	 */
	static func move(fromURL:String,toURL:String){
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
     *
     */
    class func copy(){
        // Create a FileManager instance
        
        let fileManager = NSFileManager.defaultManager()
        
        // Copy 'hello.swift' to 'subfolder/hello.swift'
        
        do {
            try fileManager.copyItemAtPath("hello.swift", toPath: "subfolder/hello.swift")
        }
        catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
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