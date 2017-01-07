import Foundation
class NetworkParser{
	/**
	 * Returns a string for a URL
	 */
	static func string(URL:String)->String{
        //TODO: needs research
		/*
        let theURL = NSURL(string: URL)
		let rssUrlRequest:NSURLRequest = NSURLRequest(URL:theURL!)
	 	let queue:NSOperationQueue = NSOperationQueue()
	 	//the bellow is sudo code
	 	let result = NSURLConnection.sendAsynchronousRequest(<#T##request: NSURLRequest##NSURLRequest#>, queue: <#T##NSOperationQueue#>, completionHandler: <#T##(NSURLResponse?, NSData?, NSError?) -> Void#>)
		return result
        */
        return ""
	}
    /**
     * PARAM: url: "https://www.google.com"
     */
    static func stringContent(url:String)->String{
        //TODO: needs research
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
        return ""
    }
}