import Foundation
class FileUtils{
	/**
	 * NOTE: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSWorkspace_Class/index.html#//apple_ref/occ/instm/NSWorkspace/openURL:
     * TODO: what format is the filePath in?
	 * EXAMPLE: openFile((path to desktop as text) & "del.txt")
	 */
	static func openFile(_ filePath:String){
        fatalError("out of order")
		//log file_path
		//NSWorkspace.openFile(filePath)
	}
	/**
	 * PARAM: filePaths is an array of file paths
	 */
	static func openFiles(_ filePaths:Array<String>){
		for filePath in filePaths{
			openFile(filePath)
		}	
	}
}
