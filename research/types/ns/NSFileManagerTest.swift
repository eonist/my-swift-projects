import Foundation

//Excerpt From: Apple Inc. “Using Swift with Cocoa and Objective-C (Swift 2 Prerelease).” iBooks.
//Example: (from the book)
/*
NSFileManager *fileManager = [NSFileManager defaultManager];
NSURL *URL = [NSURL fileURLWithPath:@"/path/to/file"];
NSError *error = nil;
BOOL success = [fileManager removeItemAtURL:URL error:&error];
if (!success && error){
NSLog(@"Error: %@", error.domain);
}
*/

func test(){
    let fileManager = NSFileManager.defaultManager()
    let URL = NSURL.fileURLWithPath("path/to/file")
    do {
        try fileManager.removeItemAtURL(URL)
    } catch let error as NSError {
        print ("Error: \(error.domain)")
    }
}

//move files
func testing() {
   let fileManager = NSFileManager.defaultManager()
   let fromURL = NSURL(fileURLWithPath: "/path/to/old")
   let toURL = NSURL(fileURLWithPath: "/path/to/new")
   do {
       try fileManager.moveItemAtURL(fromURL, toURL: toURL)
   } catch let error as NSError {
       print("Error: \(error.domain)")
   }
   
   //another implementation:
   do {
    try fileManager.moveItemAtURL(fromURL, toURL: toURL)
   } catch NSCocoaError.FileNoSuchFileError {
       print("Error: no such file exists")
   } catch NSCocoaError.FileReadUnsupportedSchemeError {
       print("Error: unsupported scheme (should be 'file://')")
   }
   
   //Something else:
   let fileManager = NSFileManager.defaultManager()
   if let tmpURL = try? fileManager.URLForDirectory(.CachesDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true) {
       // ...
   }
   
   
   //application folder content:
   let folderURL = NSURL.fileURLWithPath("/Applications/")
   var error : NSError? = nil
   let folderContents = fileManager.contentsOfDirectoryAtURL(folderURL!, includingPropertiesForKeys:nil, options:NSDirectoryEnumerationOptions(), error:&error)
   //After this call, the array folderContents contains NSURLs that point to each item in the folder. If there was an error, the method returns nil, and the error variable contains an NSError object that describes exactly what went wrong. You can also ask the individual NSURL objects for information about the file that they point to. You can do this via the resourceValuesForKeys(_,error:) method, which returns a dictionary that contains the attributes for the item pointed to by the ”
   // anURL is an NSURL object

   // Pass in an array containing the attributes you want to know about
   let attributes = [NSURLFileSizeKey, NSURLContentModificationDateKey]

   // In this case, we don't care about any potential errors, so we
   // pass in 'nil' for the error parameter.
   let attributesDictionary = anURL.resourceValuesForKeys(attributes, error: nil)

   // We can now get the file size out of the dictionary:
   let fileSizeInBytes = attributesDictionary?[NSURLFileSizeKey] as NSNumber

   // And the date it was last modified:
   let lastModifiedDate = attributesDictionary?[NSURLContentModificationDateKey] as NSDate
   
   //Checking each attribute takes time, so if you need to get attributes for a large number of files, it makes more sense to instruct the NSFileManager to pre-fetch the attributes when listing the directory’s contents:
   let attributes =[NSURLFileSizeKey, NSURLContentModificationDateKey]
   fileManager.contentsOfDirectoryAtURL(folderURL,includingPropertiesForKeys: attributes,options: NSDirectoryEnumerationOptions(), error: nil)
   
   //“To get the location of a temporary directory that your application can use, you use the”
   //NSTemporaryDirectory function:
   let temporaryDirectoryPath = NSTemporaryDirectory()
   //“This function returns a string, which contains the path of a directory you can store files in. If you want to use it as an NSURL, you’ll need to use the fileURLWithPath method to convert it.”


   //“Creating directories

   //Using NSFileManager, you can create and remove items on the filesystem. To create a new directory, for example, use:
   let newDirectoryURL  = NSURL.fileURLWithPath(temporaryDirectoryPath +
       "/MyNewDirectory")

   var error : NSError? = nil
   var didCreate = fileManager.createDirectoryAtURL(newDirectoryURL!,
       withIntermediateDirectories: false, attributes: nil, error: &error)
   if (didCreate) {
       // The directory was successfully created
   } else {
       // The directory wasn't created (maybe one already exists at the path?)
       // More information is stored in the 'error' variable
   }
   // note If you set a YES value for the withIntermediateDirectories parameter, the system will create any additional folders that are necessary to create the folder. For example, if you have a folder named Foo, and want to have a folder named Foo/Bar/Bas, you would create an NSURL that points to the second folder and ask the NSFileManager to create it. The system would create the Bar folder, and then create the Bas folder inside that.”

   //“Creating files
   //Creating files works the same way. You provide a path in an NSString, the NSData that the file should contain, and an optional dictionary of attributes that the file should have:
   // Note that the first parameter is the path (as a string), NOT an NSURL!
   fileManager.createFileAtPath(newFilePath!,contents: newFileData,attributes: nil)”
   
   //“Removing files

   //Given a URL, NSFileManager is also able to delete files and directories. You can only delete items that your app has permission to delete, which limits your ability to write a program that accidentally erases the entire system.
   //To remove an item, you do this:
   fileManager.removeItemAtURL(newFileURL!, error: nil)”
   //“WARNING There’s no undo for removing files or folders using NSFileManager. Items aren’t moved to the Trash—they’re immediately deleted.”


   //“Moving and copying files

   //To move a file, you need to provide both an original URL and a destination URL. You can also copy a file, which duplicates it and places the duplicate at the destination URL.
   //To move an item, you do this:
   fileManager.moveItemAtURL(sourceURL!, toURL: destinationURL, error: nil)
   //To copy an item, you do this:
   fileManager.copyItemAtURL(sourceURL!, toURL: destinationURL, error: nil)
   //Just like all the other file manipulation methods, these methods return true on success, and false if there was a problem.”
   
   //“user’s Documents directory, you do this:
   let URLs = fileManager.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask) as [NSURL]

   let documentURL = URLs[0]
   
   //“You can then use this URL to create additional URLs. For example, to generate a URL that points to a file called Example.txt in your Documents directory, you can use URLByAppendingPathComponent:
   let fileURL = documentURL.URLByAppendingPathComponent("Example.txt")”
 

}