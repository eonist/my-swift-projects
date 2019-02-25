

#if os(OSX)
import AppKit.NSView

#else
import UIKit.UIView

extension UIView {
    /**
     * Returns color for point in UIView
     * for UIIMage: https://gist.github.com/giulio92/69e4f74217422154bb25d2a35d6710f8
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
    /**
     * Creates UIImage for size and color
     */
    static func createImage(size: CGSize, color:UIColor) -> UIImage {
       return UIGraphicsImageRenderer(size: size).image { rendererContext in
          color.setFill()
          rendererContext.fill(CGRect(origin: .zero, size: size))
       }
    }
    /*
    * let resizedImage = image.resize(to: CGSize(width: 50, height: 50))
    */
    func resize(to size: CGSize) -> UIImage {
       return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
       }
    }
    /**
    * someUIImage.cgImage doesnt work so we use this
    */
   func cgImage() -> CGImage? {
      guard let ciImage = self.ciImage else {return nil}
      let context:CIContext = CIContext.init(options: nil)
      return context.createCGImage(ciImage, from: ciImage.extent)
   }
   /**
    * sometimes uiImage.ciImage just doesn't work
    */
   func ciImage() -> CIImage {
      guard let cgImage:CGImage = self.cgImage else {Swift.print("UIImage.ciImage() - unable to create cgimage");return nil}
      return CoreImage.CIImage(cgImage: cgImage)
   }
}
/**
 * TODO: Add a way to also get response, maybe look into result?
 */
extension UIImage{

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
/**
 * Utils
 */
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
extension UIImage {
   /**
    * - Note: Somehow this works with retina images where scale is 2x as well
    * - Note: alternative: https://gist.github.com/giulio92/69e4f74217422154bb25d2a35d6710f8
    */
   func getPixelColor(pos:CGPoint) -> UIColor? {
      guard let cgImage = self.cgImage() else {Swift.print("unable to get cgImage");return nil}
      guard let dataProvider = cgImage.dataProvider else {Swift.print("unable to get dataProvider");return nil}
      guard let pixelData:CFData = dataProvider.data else {Swift.print("unable to get cfData");return nil}
      let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
      let pixelInfo: Int = ((Int(self.size.width*self.scale) * Int(pos.y)) + Int(pos.x)) * 4
      //      Swift.print("pixelInfo:  \(pixelInfo)")
      let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
      let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
      let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
      let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
      return UIColor(red: r, green: g, blue: b, alpha: a)
   }
   /**
    * someUIImage.cgImage doesn't work so we use this
    */
   func cgImage() -> CGImage? {
      guard let ciImage = self.ciImage else {Swift.print("unable to get ciImage");return nil}
      let context:CIContext = CIContext.init(options: nil)
      return context.createCGImage(ciImage, from: ciImage.extent)
   }
}

#endif
