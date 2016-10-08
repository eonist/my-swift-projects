import Foundation
class FileUtils{
	/*
	 * NOTE: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSWorkspace_Class/index.html#//apple_ref/occ/instm/NSWorkspace/openURL:
	 * Example: openFile((path to desktop as text) & "del.txt")
     * TODO: what format is the filePath in?
	 */
	class func openFile(filePath:String){
        fatalError("out of order")
		//log file_path
		//NSWorkspace.openFile(filePath)
	}
	/*
	 * PARAM: filePaths is an array of file paths
	 */
	class func openFiles(filePaths:Array<String>){
		for filePath in filePaths{
			openFile(filePath)
		}	
	}
}