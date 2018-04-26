import Foundation

class NSViewAsserter {
    /**
     * Asserts if PARAM: view is a subView of PARAM: parent
     */
    static func contains(_ parent:View,_ view:View)->Bool{
        return parent.subviews.index(where: {$0 === view}) != nil
    }
    /**
     * Asserts if a child has a speccific pattern
     */
    typealias MatchMethod = (View,View?)->Bool
    static let defaultMatchMethod:MatchMethod = { (a,b) in return a === b}
    static func hasParent(_ child:View?,_ parentToMatch:View?, matchMethod:MatchMethod = defaultMatchMethod)->Bool{
        if let superView:View = child?.superview as? View{
            if matchMethod(superView, parentToMatch) {
                
                return true
            }
            return hasParent(superView,parentToMatch,matchMethod:matchMethod)/*traverse further up the hierarchy*/
            
        }
        return false/*Return false if no parent match*/
    }
}
