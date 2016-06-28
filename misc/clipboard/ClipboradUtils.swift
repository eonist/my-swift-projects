import Cocoa

class ClipboardUtils{
    /**
     *
     */
    class func setClipboardText(text:String){
        let thePasteboard = NSPasteboard.generalPasteboard()
        thePasteboard.clearContents()
        thePasteboard.setString(text, forType: NSPasteboardTypeString)
    }
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