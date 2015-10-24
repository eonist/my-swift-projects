


let resourcePath = NSBundle.mainBundle().pathForResource("SomeFile", ofType: "txt")
// resourcePath is now a string containing the
// absolute path reference to SomeFile.txt, or nil
//Note that this code snippet calls NSBundle.mainBundle()—it’s possible to have more than one bundle around. Remember that Cocoa refers to packages (i.e., folders containing app resources) as bundles.
//You can also get URLs to resources as well:
let resourceURL = NSBundle.mainBundle().URLForResource("SomeFile", withExtension: "txt")
// resourceURL is now an NSURL, or nil”
