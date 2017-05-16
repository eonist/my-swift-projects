import Cocoa

class NSViewAsserter {
    /**
     * Asserts if PARAM: view is a subView of PARAM: parent
     */
    static func contains(_ parent:NSView,_ view:NSView)->Bool{
        return parent.subviews.index(where: {$0 === view}) != nil
    }
    /**
     * Asserts if a child has a speccific pattern
     */
    static func hasParent(_ child:NSView?,_ parentToMatch:NSView?)->Bool{
        if let superView = child?.superview{
            if superView === parentToMatch {
                return true
            }
            return hasParent(superView,parentToMatch)/*traverse further up the hierarchy*/
        }
        return false/*Return false if no parent match*/
    }
}
