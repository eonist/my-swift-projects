import Cocoa

class ClipboardAsserter {
    /**
     * PARAM: clipboardFormat ClipboardFormats.TEXT_FORMAT , ClipboardFormats.HTML_FORMAT, etc
     */
    static func hasData(_ clipboardFormat:String) -> Bool {//Untested
        let pasteboard = NSPasteboard.general
        return pasteboard.canReadItem(withDataConformingToTypes: [clipboardFormat])
    }
    static func hasString() -> Bool {//Untested
        return hasData(NSPasteboard.PasteboardType.string.rawValue)
    }
}
