import Foundation

class NSXMLElementExtensions {
    /*
     * Convenience
     */
    subscript(key: String) -> CGPoint {
        get {
            return XMLParser.attribute(self, key)
        }
        set {
            fatalError("UNSUPORTED CORNER TYPE: " + key + " WITH VALUE: " + String(newValue))
        }
    }
}
