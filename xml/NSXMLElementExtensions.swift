import Foundation

class NSXMLElementExtensions {
    /*Easy Access to corners*/
    subscript(key: String) -> CGPoint {
        get {
            
        }
        set {
            fatalError("UNSUPORTED CORNER TYPE: " + key + " WITH VALUE: " + String(newValue))
        }
    }
}
