
import Foundation


extension Data {
    public var stringValue: String? {/*Convenience method*/
        return NSString(data: self, encoding: String.Encoding.utf8.rawValue) as String?
    }
  
}
