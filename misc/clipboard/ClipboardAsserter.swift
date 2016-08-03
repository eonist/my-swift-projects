import Cocoa

class ClipboardAsserter {
    /**
     * @param clipboardFormat ClipboardFormats.TEXT_FORMAT , ClipboardFormats.HTML_FORMAT, etc
     */
    class func hasData(clipboardFormat:String) -> Bool {
        let pasteboard = NSPasteboard.generalPasteboard()
        return pasteboard.availableTypeFromArray([clipboardFormat])
    }
    /**
     *
     */
    class func hasString() -> Bool {
        return hasData(NSPasteboardTypeString)
    }
}
