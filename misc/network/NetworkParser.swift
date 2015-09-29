/**
 * 
 */
func string(URL:String)->String{
	let theURL = NSURL(string: URL)
  let rssUrlRequest:NSURLRequest = NSURLRequest(URL:theURL!)
  let queue:NSOperationQueue = NSOperationQueue()
  //the bellow is sudo code
  let result = NSURLConnection.sendAsynchronousRequest(rssUrlRequest, queue: queue) 
	return result
}