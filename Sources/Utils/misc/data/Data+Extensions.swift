import Foundation
/**
 * Data to string,string to data: https://stackoverflow.com/a/42229252
 */
extension Data {
      /**
       * Returns String for Data (utf8)
       */
      public var stringUTF8: String? {/*Convenience method*/
          return String(data: self, encoding: .utf8)
          // return NSString(data: self, encoding: String.Encoding.utf8.rawValue) as String?
      }
      /**
       * Returns string for Data (ascii)
       */
      public var stringASCII: String? {/*Convenience method*/
         return String(data: self, encoding: .ascii)
          // return NSString(data: self, encoding: String.Encoding.ascii.rawValue) as String?
      }
      /**
       * Create hexadecimal string representation of `Data` object.
       * - returns: `String` representation of this `Data` object.
       * ## Examples:
       * Swift.print("hello, world".dataValue?.hexStr)//68656c6c6f2c20776f726c64
       */
    var stringHEX:String {
        return map { String(format: "%02x", $0) }.joined(separator: "")
    }
    /**
     * Append string to Data
     * NOTE: Rather than littering your code with calls to `data(using: .utf8)` to convert `String` values to `Data`, this wraps it in a nice convenient little extension to Data. This defaults to converting using UTF-8.
     * PRAM string: The string to be added to the `Data`.
     */
    mutating func append(_ string: String, using encoding: String.Encoding = .utf8) {
        if let data = string.data(using: encoding) {
            append(data)
        }
    }
    /**
     * Returns [120,120,44] etc
     */
    func byteValues() -> [UInt8]{
      let data = "foo".data(using: .utf8)!
      let array = [UInt8](data)
      return array
    }
    /*
    *
    */
    func binary() {
      //      let string = "The string"
     let binaryData: Data? = string.data(using: .utf8, allowLossyConversion: false)

     let stringOf01 = binaryData?.reduce("") { (acc, byte) -> String in
        acc + String(byte, radix: 2)
     }
     Swift.print("stringOf01:  \(stringOf01)")//010101010000101001
     Swift.print("stringOf01?.count:  \(stringOf01?.count)")//56


    }
}
