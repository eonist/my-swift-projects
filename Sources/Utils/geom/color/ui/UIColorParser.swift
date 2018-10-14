#if os(iOS)
import UIKit

class UIColorParser{
    /**
     * Returns random color
     * EXMPLE: self.backgroundColor = UIColorParser.random
     */
    static var random:UIColor {
        let r:CGFloat  = CGFloat(arc4random() % 255) / 255.0
        let g:CGFloat  = CGFloat(arc4random() % 255) / 255.0
        let b:CGFloat  = CGFloat(arc4random() % 255) / 255.0
        let uiColor:UIColor = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        return uiColor
    }
   /**
    * Returns color for point in UIView
    */
   static func color(point:CGPoint) -> UIColor {
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

#endif
