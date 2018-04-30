import Cocoa

class NetworkParser{
    /**
     * Return string for WebPath
     * EXAMPLE:
     *  NetworkParser.str(webPath: webPath) { (string:String?,error:DownloadError?) in
     *   if let str = string {
     *      Swift.print("str:  \(str)")
     *   }else{
     *       Swift.print("error:  \(String(describing: error))")
     *   }
     * }
     */
    static func str(webPath:String,onComplete:@escaping DownloadComplete){
        guard let url = URL.init(string: webPath) else { onComplete(nil,.invalideWebPath);return}
        str(url: url, downloadComplete: onComplete)
    }
    /**
     * Return string for URL
     */
    static func str(url: URL, downloadComplete:@escaping DownloadComplete) {
        data(url: url) { data, response, error in
            guard let data = data, error == nil else { downloadComplete(nil,.errorGettingDataFromURL(error,response)); return}
            //Swift.print(response?.suggestedFilename ?? url.lastPathComponent)
            guard let stringValue = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String? else {downloadComplete(nil,.dataIsNotString);return}
            downloadComplete(stringValue,nil)
        }
    }
    /**
     * EXAMPLE
     * NetworkParser.data(webPath: webPath) { (data:Data?,error:DownloadError?) in
     *    if let data = data, let str = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String? {
     *        Swift.print("str:  \(str)")
     *    }else{
     *        Swift.print("error:  \(String(describing: error)) response: \(String(describing: response))")
     *    }
     * }
     */
    static func data(webPath:String,onComplete:@escaping DataDownloadComplete){
        guard let url = URL.init(string: webPath) else { onComplete(nil,.invalideWebPath);return}
        data(url: url) { data, response, error in
            guard let data = data, error == nil else { onComplete(nil,.errorGettingDataFromURL(error,response)); return}
            //Swift.print(response?.suggestedFilename ?? url.lastPathComponent)
            onComplete(data,nil)
        }
    }
    /**
     * Get Data from URL
     * EXAMPLE:
     * data(url: url) { data, response, error in
     *    if let data = data, let str = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String? {
     *        Swift.print("str:  \(str)")
     *    }else{
     *        Swift.print("error:  \(String(describing: error)) response: \(String(describing: response))")
     *    }
     * }
     */
    static func data(url: URL, completion: @escaping URLQuery) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
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
/**
 * Extra
 */
extension NetworkParser{
    enum DownloadError: Error {
        case invalideWebPath
        case dataIsNotString
        case errorGettingDataFromURL(Error?,URLResponse?)
    }
    typealias DownloadComplete = (String?,DownloadError?) -> Void
    typealias DataDownloadComplete = (Data?,DownloadError?) -> Void
    typealias URLQuery = (Data?, URLResponse?, Error?) -> ()
}

//⚠️️ DEPRECATED ⚠️️
extension NetworkParser{
    typealias UrlReqCompleted = (String) -> Void
    static var onUrlReqCompleted = {  (result:String) /*-> Void */ in Swift.print("result:  \(result)") }
    /**
     * Returns a string for a URL
     */
    static func string(urlStr:String, completion: @escaping UrlReqCompleted = NetworkParser.onUrlReqCompleted){
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
        //TODO: ⚠️️ needs research
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
