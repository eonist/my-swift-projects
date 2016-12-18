import Foundation
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
	static func content(path:String)->String?{
        do {
            let content = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding) as String//encoding: NSUTF8StringEncoding
            return content
        } catch {
            Swift.print("Could not load: " + "\(path)")// contents could not be loaded
            return nil
        }
	}
    /**
     * resourceContent("example","txt")
     */
    static func resourceContent(fileName:String, _ fileExtension:String)->String?{
        if let filepath = NSBundle.mainBundle().pathForResource(fileName, ofType:fileExtension ) {
            return content(filepath)
        } else {
            // example.txt not found!
            return ""
        }
    }
    /**
     * NOTE: make sure the file exists with: FileAsserter.exists("some path here")
     */
    static func modificationDate(filePath:String)->NSDate{
        let fileURL:NSURL = NSURL(fileURLWithPath:filePath)
        let attributes = try! fileURL.resourceValuesForKeys([NSURLContentModificationDateKey, NSURLNameKey])
        let modificationDate = attributes[NSURLContentModificationDateKey] as! NSDate
        return modificationDate
    }
    /**
     * Returns paths of content in a dir
     */
    static func contentOfDir()->[String]?{
        let fileManager = NSFileManager.defaultManager()
        do {
            let files = try fileManager.contentsOfDirectoryAtPath(".")
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
    class func tempPath()->String{
        let path = NSTemporaryDirectory() as String
        return path
    }
}
extension FileParser{
    /**
     * Returns an xml instance comprised of the string content at location @param path
     * EXAMPLE: xml("~/Desktop/assets/xml/table.xml".tildePath)//Output: XML instance
     * IMPORTANT: Remember to expand the "path" with the tildePath call
     */
    static func xml(path:String)->XML {
        let content = FileParser.content(path)
        //Swift.print("content: " + "\(content)")
        let xmlDoc:XMLDoc = try! XMLDoc(XMLString: content!, options: 0)
        let rootElement:XML = xmlDoc.rootElement()!
        return rootElement
    }
}
/*
/*open modal panel*/
let myFileDialog: NSOpenPanel = NSOpenPanel()
myFileDialog.runModal()

// Get the path to the file chosen in the NSOpenPanel
let thePath = myFileDialog.URL?.path

// Make sure that a path was chosen
if (thePath != nil) {
let theContent = FileParser.content(thePath!)
Swift.print("theContent: " + "\(theContent)")
}
*/