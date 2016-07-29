import Cocoa

class ClosableModifier {
    /**
     * Closes the children of PARAM: view
     */
    class func closeAll(view:NSView) {
        let closables:Array<IClosable> = NSViewParser.childrenOfType(view, IClosable.self)
        for closable : IClosable in closables{ closable.close()}
    }
}
