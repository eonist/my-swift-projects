   
import Foundation


extension Data {
   /*
    * for utf8
    */   
    public var stringValue: String? {/*Convenience method*/
        return NSString(data: self, encoding: String.Encoding.utf8.rawValue) as String?
    }
    /*
    * for ascii
    */
   public var strVal: String? {/*Convenience method*/
      return NSString(data: self, encoding: String.Encoding.ascii.rawValue) as String?
   }
   /**
   * Create hexadecimal string representation of `Data` object.
   * returns: `String` representation of this `Data` object.
   * EXAMPLE: Swift.print("hello, world".dataValue?.hexStr)//68656c6c6f2c20776f726c64
   */
   var hexStr:String {
      return map { String(format: "%02x", $0) }.joined(separator: "")
   }
}
