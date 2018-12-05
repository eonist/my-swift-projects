

#if os(OSX)
import AppKit.NSView

#else
import UIKit.UIView

extension UIView {
    /**
     * Returns color for point in UIView
     */
    func color(point:CGPoint) -> UIColor {
        let colorSpace:CGColorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo.init(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)//fromRaw()!

        var pixelData:[UInt8] = [0, 0, 0, 0]

        if let context = CGContext(data: &pixelData, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmapInfo.rawValue) {
            context.translateBy(x: -point.x, y: -point.y)
            self.layer.render(in: context)
        }

        let red:CGFloat = CGFloat(pixelData[0])/CGFloat(255.0)
        let green:CGFloat = CGFloat(pixelData[1])/CGFloat(255.0)
        let blue:CGFloat = CGFloat(pixelData[2])/CGFloat(255.0)
        let alpha:CGFloat = CGFloat(pixelData[3])/CGFloat(255.0)

        let color:UIColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }

}
/**
 * TODO: Add a way to also get response, maybe look into result?
 */
extension UIImage{
   /*
   * let resizedImage = image.resize(to: CGSize(width: 50, height: 50))
   */
   func resize(to size: CGSize) -> UIImage {
      return UIGraphicsImageRenderer(size: size).image { _ in
           draw(in: CGRect(origin: .zero, size: size))
      }
   }
    typealias DownloadComplete = (UIImage?,IMGError?) -> Void
    enum IMGError: Error {
        case invalideWebPath
        case imageDataIsCorrupted
        case errorGettingDataFromURL
    }
    /**
     * get UIImage from webPath
     */
    static func image(webPath:String,onComplete:@escaping DownloadComplete){
        guard let url = URL.init(string: webPath) else { onComplete(nil,.invalideWebPath);return}
        Utils.downloadImage(url: url, downloadComplete: onComplete)
    }
}
private class Utils{
    /**
     * Assign and convert data to Image
     */
    static func downloadImage(url: URL, downloadComplete:@escaping UIImage.DownloadComplete) {
//        print("Download Started")
        getDataFromUrl(url: url) { data, response, error in
            guard let data = data, error == nil else { downloadComplete(nil,.errorGettingDataFromURL); return}
            Swift.print(response?.suggestedFilename ?? url.lastPathComponent)
//            print("Download Finished")
            guard let image = UIImage(data: data) else {downloadComplete(nil,.imageDataIsCorrupted);return}
            downloadComplete(image,nil)
        }
    }
    typealias URLQuery = (Data?, URLResponse?, Error?) -> ()
    /**
     * Get data from URL
     */
    private static func getDataFromUrl(url: URL, completion: @escaping URLQuery) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
}
#endif
