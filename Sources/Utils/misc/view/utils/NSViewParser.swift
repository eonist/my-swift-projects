import Cocoa

class NSViewParser {
    /**
     * Returns an array of all the children in PARAM: view that is of type PARAM: classType
     * NOTE: this works with classes and protocols
     * IMPORTANT: ⚠️️ Remember to use: IA.self and A.self as the type 
     * TODO: rename to childrenByClassType, maybe not?, I say not!
     */
    static func childrenOfType<T>(_ view:NSView, _ type:T.Type? = nil)->[T] {
        return view.subviews.flatMap{$0 as? T}
    }
    /**
     * Returns a list of parents
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
        return view.subviews.index(where: {$0 === subView}) ?? -1
    }
    /**
     * Returns the index of PARAM: subView in PARAM: view, -1 if no match is found
     */
    static func getSubViewAt(_ view:NSView, _ at:Int)->NSView?{
        return view.subviews[safe:at]
    }
    /**
     * Returns the first parent of PARAM: view that is of type PARAM: classType
     * NOTE: this method is recursive, and looks through parents of parents and so on until it finds a match for the classType
     */
    static func parentOfType<T>(_ view:NSView,_ classType:T.Type)->T? {
        if let superView = view.superview{
            if superView as? T != nil{
                return parentOfType(superView,classType)
            }
            return superView as? T
        }
        return nil
    }
    /**
     * Returns the array index of PARAM: item from PARAM: parent
     * NOTE: this function is recursive
     * TODO: ⚠️️ Rename to indexMap? or depth or map?, since index should be index of a NSView, maybe idx3d?
     * EXAMPLE: index(self,subSubSubChild)
     */
    static func index(_ parent:NSView,_ child:NSView) -> [Int]? {
        if(parent === child) {return []}
        else if(!parent.subviews.isEmpty){
            for (i,view) in parent.subviews.enumerated(){
                let match:[Int]? = !view.subviews.isEmpty ? index(view,child) : nil
                if(match != nil) {return [i] + match!}
            }
        }
        return nil
    }
    //DEPRECATED
    //static func getSubviewAt(_ view:NSView, _ i:Int)->NSView{return view.subviews[i]}/*favour getSubViewAt method instead, as its optional*/
}
