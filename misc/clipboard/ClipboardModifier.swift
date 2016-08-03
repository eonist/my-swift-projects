import Cocoa
/**
 * ClipboardFormats.TEXT_FORMAT	String	string data
 * ClipboardFormats.HTML_FORMAT	String	HTML string data
 * ClipboardFormats.URL_FORMAT	String	URL string (AIR only)
 * ClipboardFormats.RICH_TEXT_FORMAT	ByteArray	Rich Text Format data
 * ClipboardFormats.BITMAP_FORMAT	BitmapData	bitmap data (AIR only)
 * ClipboardFormats.FILE_LIST_FORMAT	array of File	an array of files (AIR only)
 * Custom format name	any	object reference and serialized clone
 * Note: On Mac OS, when you set the format parameter to ClipboardFormats.URL_FORMAT, the URL is transferred only if it is a valid URL. Otherwise, the Clipboard object is emptied (and calling getData() returns null).
 * @Note Clipboard.generalClipboard.setDataHandler can set a method and when the data is pasted this method is called and then it returns some data that ultimaltly ends up as the pasted data
 */
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
