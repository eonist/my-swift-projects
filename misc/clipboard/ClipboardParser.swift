import Cocoa

class ClipboardParser {
    /**
     * @Note remember to assert if the clipboard has the requested format first by using ClipboardAsserter.hasData etc
     * @param textFormat ClipboardFormats.TEXT_FORMAT etc
     */
    class func data(dataType:String) -> Any {
        let pasteboard = NSPasteboard.generalPasteboard()
        let data:String = pasteboard.stringForType(dataType)!
        return data
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
