import Cocoa

class ClipboardAsserter {
    /**
     * PARAM: clipboardFormat ClipboardFormats.TEXT_FORMAT , ClipboardFormats.HTML_FORMAT, etc
     */
    static func hasData(clipboardFormat:String) -> Bool {//Untested
        let pasteboard = NSPasteboard.generalPasteboard()
        return pasteboard.canReadItemWithDataConformingToTypes([clipboardFormat])
    }
    /**
     *
     */
    static func hasString() -> Bool {//Untested
        return hasData(NSPasteboardTypeString)
    }
}
