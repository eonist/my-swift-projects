import Cocoa

class NSViewAsserter {
    /**
     * Asserts if PARAM: view is a subView of PARAM: parent
     */
    static func contains(_ parent:NSView,_ view:NSView)->Bool{
        return parent.subviews.index(where: {$0 === view}) != nil
    }
}
