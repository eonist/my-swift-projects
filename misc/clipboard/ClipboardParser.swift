import Cocoa

class ClipboardParser {
    
    /**
     *
     */
    class func getClipboardText()->String{
        let pasteboard = NSPasteboard.generalPasteboard()
        let theContent:String = pasteboard.stringForType(NSPasteboardTypeString)!
        Swift.print("theContent: " + theContent)
        return theContent
    }
}
