class FileModifier{
	/**
	 * fromURL: "/path/to/old"
	 * toURL: "/path/to/new"
	 * additional catch clauses: catch NSCocoaError.FileNoSuchFileError {
    											print("Error: no such file exists")
											} catch NSCocoaError.FileReadUnsupportedSchemeError {
											    print("Error: unsupported scheme (should be 'file://')")
											}

	 */
	func move(fromURL:String,toURL:String){
		let fileManager = NSFileManager.defaultManager()
		let fromURL = NSURL(fileURLWithPath: "/path/to/old")
		let toURL = NSURL(fileURLWithPath: "/path/to/new")
		do {
		    try fileManager.moveItemAtURL(fromURL, toURL: toURL)
		} catch let error as NSError {
		    print("Error: \(error.domain)")
		}
	}
}