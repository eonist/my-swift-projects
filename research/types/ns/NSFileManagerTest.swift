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
