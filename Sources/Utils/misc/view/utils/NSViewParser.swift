import Cocoa

class NSViewParser {
    /**
     * Returns an array of all the children in PARAM: view that is of type PARAM: classType
     * NOTE: this works with classes and protocols
     * IMPORTANT: Remember to use: IA.self and A.self as the type 
     * TODO: rename to childrenByClassType, maybe not?, I say not!
     */
    static func childrenOfType<T>(_ view:NSView, _ type:T.Type)->[T] {
        var arr:[T] = []
        view.subviews.forEach {
            if($0 as? T != nil){arr.append($0 as! T)}
        }
        return arr
    }
    /**
     * Returns a list of parents (this works, tested)
     */
    static func parents(_ view:NSView)->[NSView]{
        var parents:[NSView] = []
        var parent:NSView? = view.superview// :TODO: seperate this into a check if its DO then that, if its Window then do that
        while(parent != nil) {//loops up the object hierarchy as long as the parent is a Element supertype
            _ = ArrayModifier.unshift(&parents,parent!)
            parent = parent!.superview
        }
        return parents
    }
    /**
     * TODO: should this return nil instead of -1? its easier to debug if it returns nil
     */
    static func indexOf(_ view:NSView,_ subView:NSView)->Int{
        for i in 0..<view.subviews.count{
            if(view.subviews[i] === subView){
                return i
            }
        }
        return -1
    }
    /**
     * Returns the index of PARAM: subView in PARAM: view, -1 if no match is found
     */
    static func getSubViewAt(_ view:NSView, _ i:Int)->NSView?{
        return i < view.subviews.count ? view.subviews[i] : nil
    }
    /**
     * Returns the first parent of PARAM: view that is of type PARAM: classType
     * @Note this method is recursive, and looks through parents of parents and so on until it finds a match for the classType
     */
    static func parentOfType<T>(_ view:NSView,_ classType:T.Type)->T? {
        if(view.superview != nil && !(view.superview as? T != nil)) {return parentOfType(view.superview!,classType)}
        return view.superview != nil ? view.superview as? T : nil
    }
    /**
     * Returns the array index of PARAM: item from PARAM: parent
     * @Note this function is recursive
     * // :TODO: rename to indexMap? or depth or map?, since index should be index of a NSView
     */
    static func index(_ parent:NSView,_ child:NSView) -> [Int]? {
        if(parent === child) {return []}
        else if(parent.numSubViews > 0){
            for i in 0..<parent.numSubViews{
                let view:NSView = parent.getSubViewAt(i)!
                let match:[Int]? = view.numSubViews != 0 ? index(view,child) : nil
                if(match != nil) {return [i] + match!}
            }
        }
        return nil
    }
    //DEPRECATED
    static func getSubviewAt(_ view:NSView, _ i:Int)->NSView{return view.subviews[i]}/*favour getSubViewAt method instead, as its optional*/
}
