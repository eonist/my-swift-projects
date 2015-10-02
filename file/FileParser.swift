/*
 * Returns content as a string for filePath
 */
func string(filePath:String)->String{
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
func resourcePath(){
	return NSBundle.mainBundle().resourcePath
}
