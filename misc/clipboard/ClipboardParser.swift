import Cocoa

class ClipboardParser {
    /**
     * @Note remember to assert if the clipboard has the requested format first by using ClipboardAsserter.hasData etc
     * @param textFormat ClipboardFormats.TEXT_FORMAT etc
     */
    class func stringData(dataType:String) -> String {
        let pasteboard = NSPasteboard.generalPasteboard()
        let data:String = pasteboard.stringForType(dataType)!
        return data
    }
    /**
     *
     */
    class func getString()->String{
        return stringData(NSPasteboardTypeString)
    }
}
