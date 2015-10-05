class FileModifier{
	/**
	 * 
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