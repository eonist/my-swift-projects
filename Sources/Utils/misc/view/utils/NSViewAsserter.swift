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
    typealias MatchMethod = (NSView,NSView?)->Bool
    static let defaultMatchMethod:MatchMethod = { (a,b) in return a === b}
    static func hasParent(_ child:NSView?,_ parentToMatch:NSView?, matchMethod:MatchMethod = defaultMatchMethod)->Bool{
        if let superView = child?.superview{
            if matchMethod(superView, parentToMatch) {
                return true
            }
            return hasParent(superView,parentToMatch,matchMethod:matchMethod)/*traverse further up the hierarchy*/
        }
        return false/*Return false if no parent match*/
    }
}
