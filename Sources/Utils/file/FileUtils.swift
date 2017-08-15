import Cocoa
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
	static func openFiles(_ filePaths:[String]){
		filePaths.forEach{ openFile($0)}
	}
    /**
     * showFileInFinder("~/dev/Element") -> shows the file or folder in finder
     */
    static func showFileInFinder(_ filePath:String){
        let expandedFilePath:String = filePath.tildePath
        NSWorkspace.shared.selectFile(nil, inFileViewerRootedAtPath: expandedFilePath)
    }
}
