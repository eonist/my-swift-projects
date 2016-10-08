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
            // contents could not be loaded
            return nil
        }
	}
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