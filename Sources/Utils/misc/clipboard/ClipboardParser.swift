import Cocoa

class ClipboardParser {
    /**
     * NOTE: remember to assert if the clipboard has the requested format first by using ClipboardAsserter.hasData etc
     * PARAM: textFormat ClipboardFormats.TEXT_FORMAT etc
     */
    static func stringData(_ dataType:String) -> String {
        let pasteboard = NSPasteboard.general
        let data:String = pasteboard.string(forType: NSPasteboard.PasteboardType(rawValue: dataType))!
        return data
    }
    static func getString()->String{
        return stringData(NSPasteboard.PasteboardType.string.rawValue)
    }
}
