import Foundation
class FileModifier{
	/**
	 * PARAM: fromURL: "/path/to/old"
	 * PARAM: toURL: "/path/to/new"
	 * TODO: additional catch clauses:
     * catch NSCocoaError.FileNoSuchFileError {print("Error: no such file exists")
     * catch NSCocoaError.FileReadUnsupportedSchemeError {print("Error: unsupported scheme (should be 'file://')")}
	 */
	static func move(_
        fromURL:String,_ toURL:String){
		let fileManager = FileManager.default
        let fromURL:URL = URL(fileURLWithPath: fromURL)
        let toURL:URL = URL(fileURLWithPath: toURL)
		do {
		    try fileManager.moveItem(at: fromURL, to: toURL)
		} catch let error as NSError {
		    print("Error: \(error.domain)")
		}
	}
    /**
     * Copies a file to another location
     */
    static func copy(_ fromURL:String,_ toURL:String){
        let fileManager = FileManager.default
        let fromURL:URL = URL(fileURLWithPath: fromURL)
        let toURL:URL = URL(fileURLWithPath: toURL)
        do {
            try fileManager.copyItem(at: fromURL, to: toURL)
        }
        catch let error as NSError {
            print("Error: \(error)")
        }
    }
    /**
     * EXAMPLE: FileModifier.write("~/Desktop/del.txt".tildePath, "test")//returns true or false depending on if something was written or not
     * NOTE: this method over-writes data to files that already exists as well
     * NOTE: this method creates a new file if non exists before
     */
    static func write(_ path:String,_ content:String)->Bool{
        Swift.print("FileModifier.write")
        do {
            try content.write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
            return true
        } catch {
            print("failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding")
        }
        return false
    }
    static func createDir(_ path:String){
        
//        
//        let documentsPath1 = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
//        let logsPath = documentsPath1.appendingPathComponent("data")
//        print(logsPath!)
        do {
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            NSLog("Unable to create directory \(error.debugDescription)")
        }
    }
    /**
     * Deletes a file at PARAM: path
     */
    static func delete(_ path:String){
        let fileManager = FileManager.default
        do {
            try fileManager.removeItem(atPath:path)
        }
        catch let error as NSError {
            print("Error: \(error)")
        }
    }
    /**
     * Renames a file
     */
    static func rename(_ fromURL:String,_ toURL:String){
        let fileManager = FileManager.default
        do {
            try fileManager.moveItem(atPath: fromURL, toPath: toURL)
        }catch let error as NSError {
            print("Error: \(error)")
        }
    }
    /**
     * Creates a folder at PARAM path
     */
    static func createFolder(_ path:String){
        let fileManager = FileManager.default
        do {
            try fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }catch let error as NSError {
            print("Error: \(error)")
        }
    }
    /**
     * Append text to file
     */
    static func append(_ path:String,_ text:String ){
        append(path, text, text.lengthOfBytes(using: String.Encoding.utf8))
    }
    /**
     * Append text to file at index
     */
    static func append(_ path:String,_ text:String, _ index:Int){
        let os:OutputStream = OutputStream(toFileAtPath: path, append: true)!
        os.open()
        os.write(text, maxLength: index)
        os.close()
    }
}
