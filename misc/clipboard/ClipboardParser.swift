import Cocoa

class ClipboardParser {
    /**
     * @Note remember to assert if the clipboard has the requested format first by using ClipboardAsserter.hasData etc
     * @param textFormat ClipboardFormats.TEXT_FORMAT etc
     */
    class func data(textFormat:String) -> Any {
        return Clipboard.generalClipboard.getData(textFormat);
    }
    /**
     *
     */
    class func getString()->String{
        let pasteboard = NSPasteboard.generalPasteboard()
        let theContent:String = pasteboard.stringForType(NSPasteboardTypeString)!
        Swift.print("theContent: " + theContent)
        return theContent
    }
}
