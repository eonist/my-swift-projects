
//“NSBundle allows you to determine both URLs and plain file paths for resources on the disk. All you need to know is the name and type of the resource.
//For example, the following code returns an NSString that contains the absolute path for a resource called SomeFile.txt:”


let resourcePath = NSBundle.mainBundle().pathForResource("SomeFile", ofType: "txt")
// resourcePath is now a string containing the
// absolute path reference to SomeFile.txt, or nil
//Note that this code snippet calls NSBundle.mainBundle()—it’s possible to have more than one bundle around. Remember that Cocoa refers to packages (i.e., folders containing app resources) as bundles.
//You can also get URLs to resources as well:
let resourceURL = NSBundle.mainBundle().URLForResource("SomeFile", withExtension: "txt")
// resourceURL is now an NSURL, or nil”

/*
“This method looks inside the Resources folder in the application bundle for the named file. (On iOS, it looks inside the root folder of the application bundle.)
Absolute paths and URLs are functionally the same when referring to files stored on disk, but using URLs is preferred—a string could theoretically contain anything, whereas a URL always points to a location. This includes file URLs, which look like this: file:///Applications/Xcode.app/. You can therefore use URLs in any case where you’d normally use a file path.
If you add an image or other resource to your project, it is copied into the application bundle when the project is built. For Mac apps, the resources are copied into the Resources folder, and for iOS apps, the resources are copied into the root folder of the application.”

Excerpt From: iBooks. 

*/