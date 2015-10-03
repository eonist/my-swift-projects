class FileUtils{
	/*
	 * NOTE: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSWorkspace_Class/index.html#//apple_ref/occ/instm/NSWorkspace/openURL:
	 * Example: openFile((path to desktop as text) & "del.txt")
	 */
	class func openFile(filePath:String){
		//log file_path
		NSWorkspace.openFile(filePath)
	}
	/*
	 * @param: file_paths should be a list of "hsf" or "alias hsf" paths
	 */
	class func openFiles(file_paths:Array){
		for (filePath in filePaths){
			openFile(filePath)
		}	
	}
}