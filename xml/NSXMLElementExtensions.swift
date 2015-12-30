import Foundation

extension NSXMLElement {
    /*
     * Convenience
     */
    subscript(key: String) -> String? {
        get {
            return XMLParser.attribute(self, key)
        }
        set {
            fatalError("UNSUPORTED CORNER TYPE: " + key + " WITH VALUE: " + String(newValue))
        }
    }
}
