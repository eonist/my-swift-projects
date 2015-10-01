class FileUtils{
	/*
	 * NOTE: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSWorkspace_Class/index.html#//apple_ref/occ/instm/NSWorkspace/openURL:
	 * Example: openFile((path to desktop as text) & "del.txt")
	 */
	func openFile(filePath){
		//log file_path
		NSWorkspace.openFile(filePath)
	}
	/*
	 * @param: file_paths should be a list of "hsf" or "alias hsf" paths
	 */
	func openFiles(file_paths){
		for (filePath in filePaths){
			openFile(filePath)
		}	
	}
}