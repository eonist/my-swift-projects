import Cocoa

class ClipboardModifier {
    /**
     *
     */
    class func setStringData(string:String,_ clipboardFormat:String)  {
        let thePasteboard = NSPasteboard.generalPasteboard()
        thePasteboard.clearContents()/*Clear any previous data, since a sys clipboard can have 2 version of the same data etc*/
        thePasteboard.setString(string, forType: clipboardFormat)
    }
    /**
     *
     */
    class func setString(string:String){
        return setStringData(string, NSPasteboardTypeString)
    }
}
