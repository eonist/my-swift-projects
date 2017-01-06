import Cocoa

class ClipboardParser {
    /**
     * NOTE: remember to assert if the clipboard has the requested format first by using ClipboardAsserter.hasData etc
     * PARAM: textFormat ClipboardFormats.TEXT_FORMAT etc
     */
    static func stringData(dataType:String) -> String {
        let pasteboard = NSPasteboard.generalPasteboard()
        let data:String = pasteboard.stringForType(dataType)!
        return data
    }
    /**
     *
     */
    static func getString()->String{
        return stringData(NSPasteboardTypeString)
    }
}
