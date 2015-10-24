/*
Loading Data from Files and URLs
You can also load data from a URL or from a file location on disk. If the file is one of the resources built into your project, you first need to work out where on disk it’s being stored; once you have that, you can load its contents into memory.
To get the location of a built-in file, you first use the NSBundle class to determine where a given file is being stored on disk. Once you’ve done that, you construct an NSData object by providing it either a URL or a file path:
*/
// Loading from URL
if let fileURL = NSBundle.mainBundle()
    .URLForResource("SomeFile", withExtension: "txt") {
    let loadedDataFromURL = NSData(contentsOfURL:fileURL)
}

// Loading from a file
if let filePath = NSBundle.mainBundle()
    .pathForResource("SomeFile", ofType: "txt") {
    let loadedDataFromPath = NSData(contentsOfFile:filePath)
}