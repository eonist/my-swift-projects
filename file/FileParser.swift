class FileParser{
	/*
	 * Returns string content from a file at file location "filePath"
     * PARAM filePath is the file path to the file
     * Todo: What format is the filePath?
	 */
	class func string(filePath:String)->String{
		var err: NSError?
		let content = String.stringWithContentsOfFile(path, encoding: NSUTF8StringEncoding, error: &err)
		if (err == nil){
			return content
		}else{
			return nil
		}
	}
	/**
	 * Returns the project resource folder
	 * NOTE: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSBundle_Class/
	 */
	class func resourcePath()->String{
		return NSBundle.mainBundle().resourcePath
	}
}