import Cocoa

class ClipboardsModifier {
    /**
     *
     */
    class func setString(string:String){
        let thePasteboard = NSPasteboard.generalPasteboard()
        thePasteboard.clearContents()
        thePasteboard.setString(string, forType: NSPasteboardTypeString)
    }
}
