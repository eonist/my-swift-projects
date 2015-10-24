//Once you have an NSURL object that points to where your resource is located, you construct an NSURLRequest. While NSURL points to where the resource is on the network, NSURLRequest describes how it should be accessed.
//NSURLRequest takes an NSURL and adds information about things like how long the request should go without an answer before timing out, whether (and how) to use ”

/*
“caching, and, if the request is an HTTP request, which request method (GET, POST, PUT, etc.) to use and what the HTTP request’s body should be.
For most cases, you can use the NSURLRequest(URL:) method to create an NSURLRequest given an NSURL:
let urlRequest = NSURLRequest(URL:myURL!)
If you want to have more control over how the request is performed, you can use NSURLRequest(URL:cachePolicy:timeoutInterval:). This method is the same as the previous one, but you specify how the request should cache content that it downloads and how long the request should wait before giving up.
NOTE
NSURLRequest(URL:) creates a request that caches content according to the default caching policy of the protocol you’re using (e.g., HTTP caches depending on whether the server instructs it to, while FTP never caches) and times out after 60 seconds.”

Excerpt From: iBooks. 

*/