

func test(){
	//“You can also create URLs that are relative to other URLs:”
	let relativeURL = NSURL(string: "resources/index.html",
   relativeToURL: NSURL(string: "http://oreilly.com/"))
	/*
	If you use NSURL(string:), the string you provide must be a well formed URL. If it isn’t well formed, you’ll get a nil value.
	Because calling NSURL’s constructor can result in nil, it always returns an optional. You’ll need to use ? and ! to unwrap it.”
	*/
	let myURL = NSURL(string: "http://oreilly.com")
	
	//Once you have an NSURL, you can retrieve information about it. For example, to retrieve the host (the computer name), you can do the following:
	let host = relativeURL?.host // = "oreilly.com”
	
	//“URLs are also useful for indicating the location of a file or folder on the local disk, and both iOS and OS X are increasingly trending toward using them instead of strings that contain paths.
	//A file URL is a regular NSURL, but uses the scheme file:. A file URL, therefore, looks like this: 
	let url = "file://localhost/Applications/"
	//There are special methods in NSURL that make it easier to create file URLs. For example, you can create one using the fileURLWithPath: method:
	let myFileURL = NSURL(fileURLWithPath:"/Applications/")”

}