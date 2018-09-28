#if os(OSX)
import AppKit.NSView
#else
import UIKit.UIView
#endif

class NetworkParser{
    /**
     * Return string for WebPath
     * EXAMPLE: NetworkParser.str(webPath: webPath) //(See defaultDownloadComplete)
     */
    static func str(webPath:String,onComplete:@escaping DownloadComplete = defaultDownloadComplete){
        guard let url = URL.init(string: webPath) else { onComplete(nil,.invalideWebPath);return}
        str(url: url, downloadComplete: onComplete)
    }
    /**
     * Return string for URL
     * Example: NetworkParser.str(url: url)
     */
    static func str(url: URL, downloadComplete:@escaping DownloadComplete = defaultDownloadComplete) {
        data(url: url) { data, response, error in
            guard let data = data, error == nil else { downloadComplete(nil,.errorGettingDataFromURL(error,response)); return}
            //Swift.print(response?.suggestedFilename ?? url.lastPathComponent)
            guard let stringValue = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String? else {downloadComplete(nil,.dataIsNotString);return}
            downloadComplete(stringValue,nil)
        }
    }
    /**
     * EXAMPLE: NetworkParser.data(webPath: webPath)
     */
    static func data(webPath:String,onComplete:@escaping DataDownloadComplete = defaultDataComplete){
        guard let url = URL.init(string: webPath) else { onComplete(nil,.invalideWebPath);return}
        data(url: url) { data, response, error in
            guard let data = data, error == nil else { onComplete(nil,.errorGettingDataFromURL(error,response)); return}
            //Swift.print(response?.suggestedFilename ?? url.lastPathComponent)
            onComplete(data,nil)
        }
    }
    /**
     * Get Data from URL
     * EXAMPLE: NetworkParser.data(url:url)
     * NOTE: this onliner also works: URLSession.shared.dataTask(with: url) { data, response, error in completion(data, response, error) }.resume()
     * For multiple varaiables etc: param1=value1&param2=value2
     * EXAMPLE: urlStr:"https://www.google.com/dev/push?tx=someValue"
     * PARAM: httpBody: some servers requires the params to be encoded as data
     */
    static func data(url:URL, httpMethod:HTTPMethodType = .get, httpBody:Data? = nil, completion: @escaping URLQuery = defaultURLQueryComplete) {
        var urlRequest = URLRequest.init(url: url)
        urlRequest.httpMethod = httpMethod.rawValue//get or post
        if let httpBody = httpBody {
            urlRequest.httpBody = httpBody
        }
        data(urlRequest: urlRequest)
    }
    /**
     * New (Used for Custom URLRequests)
     */
    static func data(urlRequest:URLRequest, completion: @escaping URLQuery = defaultURLQueryComplete) {
        let session:URLSession = URLSession.shared
        let task:URLSessionTask = session.dataTask(with: urlRequest as URLRequest) { (data, response, error) in
            completion(data, response, error)
        }
        task.resume()
    }
}

/**
 * Extra
 */
extension NetworkParser{
    enum HTTPMethodType:String {case get = "GET"; case post = "POST"}
    
    enum DownloadError: Error {
        case invalideWebPath
        case dataIsNotString
        case errorGettingDataFromURL(Error?,URLResponse?)
    }
    typealias DownloadComplete = (String?,DownloadError?) -> Void
    typealias DataDownloadComplete = (Data?,DownloadError?) -> Void
    typealias URLQuery = (Data?, URLResponse?, Error?) -> ()
    /**
     * New
     */
    static var defaultDownloadComplete:DownloadComplete = { (string:String?,error:DownloadError?) in
        if let str = string {
            Swift.print("str:  \(str)")
        }else{
            Swift.print("error:  \(String(describing: error))")
        }
    }
    /**
     * Default callback method for data(url: URL)
     */
    static var defaultURLQueryComplete:URLQuery = { (data:Data?, response:URLResponse?, error:Error?) in
        if let data = data, let str = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String? {
            Swift.print("str:  \(str)")
        }else{
            Swift.print("error:  \(String(describing: error)) response: \(String(describing: response))")
        }
    }
    /**
     * Default callback method for data(webPath:String) call
     */
    static var defaultDataComplete:DataDownloadComplete = { (data:Data?,error:DownloadError?) in
        if let data = data, let str = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String? {
            Swift.print("str:  \(str)")
        }else{
            Swift.print("error:  \(String(describing: error))")
        }
    }
}

