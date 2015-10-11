class FileUtils{
	/*
	 * NOTE: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSWorkspace_Class/index.html#//apple_ref/occ/instm/NSWorkspace/openURL:
	 * Example: openFile((path to desktop as text) & "del.txt")
     * TODO: what 
	 */
	class func openFile(filePath:String){
		//log file_path
		NSWorkspace.openFile(filePath)
	}
	/*
	 * PARAM: filePaths is an array of file paths
	 */
	class func openFiles(filePaths:Array){
		for filePath in filePaths{
			openFile(filePath)
		}	
	}
}