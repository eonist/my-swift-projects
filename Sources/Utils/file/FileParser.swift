import Cocoa
class FileParser{
	/**
	 * Returns string content from a file at file location "path"
     * PARAM path is the file path to the file
     * NOTE: remember to expand the path with the .tilde call, if its a tilde path
     * TODO:  What format is the path?
     * let path = "//Users/<path>/someFile.xml"
     * var err: NSError?
     * let content = String.stringWithContentsOfFile(path, encoding: NSUTF8StringEncoding, error: &err)
     * EXAMPLE: FileParser.content("~/Desktop/temp.txt".tildePath)//
     */
	static func content(_ path:String)->String?{
        do {
            let content = try String(contentsOfFile: path, encoding: String.Encoding.utf8) as String//encoding: NSUTF8StringEncoding
            return content
        } catch {
            Swift.print("Could not load: " + "\(path)")// contents could not be loaded
            return nil
        }
	}
    /**
     * resourceContent("example","txt")
     */
    static func resourceContent(_ fileName:String, _ fileExtension:String)->String?{
        if let filepath = Bundle.main.path(forResource: fileName, ofType:fileExtension ) {
            return content(filepath)
        } else {
            // example.txt not found!
            return ""
        }
    }
    /**
     * NOTE: make sure the file exists with: FileAsserter.exists("some path here")
     */
    static func modificationDate(_ filePath:String)->NSDate{
        let fileURL:NSURL = NSURL(fileURLWithPath:filePath)
        let attributes = try! fileURL.resourceValues(forKeys: [URLResourceKey.contentModificationDateKey, URLResourceKey.nameKey])
        let modificationDate = attributes[URLResourceKey.contentModificationDateKey] as! NSDate
        return modificationDate
    }
    /**
     * Returns paths of content in a dir
     */
    static func contentOfDir(_ path:String)->[String]?{
        let fileManager = FileManager.default
        do {
            let files = try fileManager.contentsOfDirectory(atPath: path)//"."
            //print(files)
            return files
        }catch let error as NSError {
            print("Error: \(error)")
            return nil
        }
    }
    /**
     * Returns temporary directory path
     */
    static var tempPath:String{
        let path = NSTemporaryDirectory() as String
        return path
    }
    /**
     * Returns the current directory path
     */
    static var curDir:String{
        let fileManager = FileManager.default
        let path = fileManager.currentDirectoryPath
        return path
    }
}
extension FileParser{
    /**
     * Returns an xml instance comprised of the string content at location PARAM: path
     * EXAMPLE: xml("~/Desktop/assets/xml/table.xml".tildePath)//Output: XML instance
     * IMPORTANT: Remember to expand the "path" with the tildePath call before you call xml(path)
     */
    static func xml(_ path:String)->XML {
        let content = FileParser.content(path)
        //Swift.print("content: " + "\(content)")
        let xmlDoc:XMLDoc = try! XMLDoc(xmlString: content!, options: 0)
        let rootElement:XML = xmlDoc.rootElement()!
        return rootElement
    }
	private static func modalExample(){
		/*open modal panel*/
		let myFileDialog:NSOpenPanel = NSOpenPanel()
		myFileDialog.runModal()

		/*Get the path to the file chosen in the NSOpenPanel*/
		let thePath = myFileDialog.url?.path

		/*Make sure that a path was chosen*/
		if (thePath != nil) {
			let theContent = FileParser.content(thePath!)
			Swift.print("theContent: " + "\(theContent)")
		}	
	}
}
