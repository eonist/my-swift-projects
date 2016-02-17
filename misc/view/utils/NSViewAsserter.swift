import Cocoa

class NSViewAsserter {
    /**
     * Asserts if @param view is a subView of @param parent
     */
    class func contains(parent:NSView,_ view:NSView)->Bool{
        for subView in view.subviews {
            Swift.print("subView: " + "\(subView)")
            if(view === subView){
                return true
            }
        }
        return false
    }
}
