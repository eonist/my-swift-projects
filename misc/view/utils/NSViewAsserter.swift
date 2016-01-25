import Cocoa

class NSViewAsserter {
    /**
     *
     */
    class func contains(parent:NSView,view:NSView)->Bool{
        for subView in view.subviews {if(view === subView){return true}}
        return false
    }
}
