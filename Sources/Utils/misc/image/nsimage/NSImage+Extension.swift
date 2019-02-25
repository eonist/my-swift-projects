import Cocoa

extension NSImage {
   /**
    * creates cgimage from nsimage
	 * - Important: ⚠️️ we use autoreleasepool{} or else there will be memory leakage
    */
	 var cgImage: CGImage? {
       return autoreleasepool {
          return self.cgImage(forProposedRect: nil, context: nil, hints: nil)
       }
    }
	 /**
     * New
     */
	  var ciimage:CIImage? {
       guard let cgImg:CGImage = self.cgImage else {Swift.print("unable to convert to cgImage");return nil}
       let ciImg:CIImage? = CoreImage.CIImage.init(cgImage: cgImg)
       return ciImg
    }
}
/**
 * Inverts an image (black becomes white etc)
 */
//   func invertedImage() -> Image? {
//      guard let ciImage:CIImage = self.ciImage() else {Swift.print("UIImage.invertedImage() - unable to create ciImage"); return nil}//CoreImage.CIImage(cgImage: cgImage)
//      guard let cgImage:CGImage = ciImage.invertedImage() else {Swift.print("unable to create cgImage");return nil}
//      return Image(cgImage: cgImage)
//   }

/**
 * Creates UIImage for size and color
 */
//   static func createImage(size: CGSize, color:Color) -> Image {
//      return UIGraphicsImageRenderer(size: size).image { rendererContext in
//         color.setFill()
//         rendererContext.fill(CGRect(origin: .zero, size: size))
//      }
//   }
