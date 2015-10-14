import Foundation
class FileParser{
	/*
	 * Returns string content from a file at file location "filePath"
     * PARAM filePath is the file path to the file
     * Todo: What format is the filePath?
	 */
	class func string(path:String)->String?{
        do {
            let content = try String(contentsOfFile: filepath, encoding: NSUTF8StringEncoding) as String//encoding: NSUTF8StringEncoding
            return content
        } catch {
            // contents could not be loaded
            return nil
        }
        
	}
	/**
	 * Returns the project resource folder
	 * NOTE: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSBundle_Class/
	 */
    class func resourcePath()->String{
		return NSBundle.mainBundle().resourcePath!
	}
    /**
     * resourceString("example","txt")
     */
    class func resourceString(fileName:String, _ fileExtension:String)->String?{
        if let filepath = NSBundle.mainBundle().pathForResource(fileName, ofType:fileExtension ) {
            do {
                let content = try String(contentsOfFile: filepath, usedEncoding: nil) as String//encoding: NSUTF8StringEncoding
                return content
            } catch {
                // contents could not be loaded
                return nil
            }
        } else {
            // example.txt not found!
        }
    }
}