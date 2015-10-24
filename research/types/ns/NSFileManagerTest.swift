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
   NSTemporaryDirectory function:
   let temporaryDirectoryPath = NSTemporaryDirectory()
}