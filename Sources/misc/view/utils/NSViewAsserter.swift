import Cocoa

class NSViewAsserter {
    /**
     * Asserts if PARAM: view is a subView of PARAM: parent
     */
    static func contains(_ parent:NSView,_ view:NSView)->Bool{
        for subView in parent.subviews {
            if(view === subView){return true}
        }
        return false
    }
}
