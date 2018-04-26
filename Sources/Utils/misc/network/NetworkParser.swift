import Cocoa
class NetworkParser{
	typealias UrlReqCompleted = (String) -> Void
	static var onUrlReqCompleted = {  (result:String) /*-> Void */ in Swift.print("result:  \(result)") }
	/**
	 * Returns a string for a URL
	 */
	static func string(urlStr:String, completion: @escaping UrlReqCompleted = NetworkHelper.onUrlReqCompleted){
		 guard let url: URL = URL(string: urlStr ) else {fatalError("something wrong with the URL: \(urlStr)")}
		 let session:URLSession = URLSession.shared
		 let request = URLRequest.init(url: url)
		 let task:URLSessionTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
			  guard let _:NSData = data as NSData?, let _:URLResponse = response, error == nil else {
					print("Task Error: \(String(describing: error?.localizedDescription))")
					return
			  }
			  guard let stringValue = data?.stringValue else {
					Swift.print("data is not string")
					return
			  }
			  completion(stringValue)
			  //Swift.print("data:  \(String(describing: data?.stringValue))")
		 }
		 task.resume()
	}
	/**
	 * Returns a string for a URL
	 */
	static func string(_ URL:String)->String{
        //TODO: needs research
		/*
        let theURL = NSURL(string: URL)
		let rssUrlRequest:NSURLRequest = NSURLRequest(URL:theURL!)
	 	let queue:NSOperationQueue = NSOperationQueue()
	 	//the bellow is sudo code
	 	let result = NSURLConnection.sendAsynchronousRequest(, queue: , completionHandler: )
		return result
        */
        return ""
	}
    /**
     * PARAM: url: "https://www.google.com"
     */
    static func stringContent(_ url:String)->String{
        //TODO: needs research
        if let urlObj = URL(string:url) {
            do {
                let contents = try NSString(contentsOf: urlObj, usedEncoding: nil)
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
class NetworkUtils{
    /**
     * Opens an url in the default browser. openURLInDefaultBrowser("https://www.google.com/")
     */
    static func openURLInDefaultBrowser(_ url:String){
        if let url = URL(string: url), NSWorkspace.shared.open(url) {
            print("default browser was successfully opened")
        }
    }
}
