class FileParser{
	/*
	 * Returns content as a string for filePath
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