import Cocoa

class ClipboardAsserter {
    /**
     * PARAM: clipboardFormat ClipboardFormats.TEXT_FORMAT , ClipboardFormats.HTML_FORMAT, etc
     */
    class func hasData(clipboardFormat:String) -> Bool {//Untested
        let pasteboard = NSPasteboard.generalPasteboard()
        return pasteboard.canReadItemWithDataConformingToTypes([clipboardFormat])
    }
    /**
     *
     */
    class func hasString() -> Bool {//Untested
        return hasData(NSPasteboardTypeString)
    }
}
