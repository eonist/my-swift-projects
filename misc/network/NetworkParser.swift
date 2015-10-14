import Foundation
class NetworkParser{
	/**
	 * Returns a string for a URL
	 */
	class func string(URL:String)->String{
        //needs research
		/*
        let theURL = NSURL(string: URL)
		let rssUrlRequest:NSURLRequest = NSURLRequest(URL:theURL!)
	 	let queue:NSOperationQueue = NSOperationQueue()
	 	//the bellow is sudo code
	 	let result = NSURLConnection.sendAsynchronousRequest(<#T##request: NSURLRequest##NSURLRequest#>, queue: <#T##NSOperationQueue#>, completionHandler: <#T##(NSURLResponse?, NSData?, NSError?) -> Void#>)
		return result
        */
	}
    /**
     * @param url: "https://www.google.com"
     */
    class func stringContent(url:String)->String{
        if let urlObj = NSURL(string: url) {
            do {
                let contents = try NSString(contentsOfURL: urlObj, usedEncoding: nil)
                print(contents)
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
    }
}