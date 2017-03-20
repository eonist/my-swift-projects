import Cocoa

class DepthModifier {
    /**
     *
     */
    static func sortByList(_ container:NSView, _ containerFieldName:String, _ sortListFieldName:String, _ sortList:[[String:String]]){
        fatalError("not implemented yet")
    }
    /**
     * Arranges children in PARAM: container according to PARAM: indices
     * NOTE: indices contain an array of indec values that is in a spessific order, so if the first index is 6 that means the instance at depth 6 will now have depth 0
     */
    static func sortByIndices(_ container:NSView, _ indices:[Int]) {
        Swift.print("DepthModifier.sortByIndices()");
        
        let children:[NSView] = NSViewParser.childrenOfType(container, NSView.self)
        
        let indicesLen:Int = indices.count
        for i in 0..<indicesLen{
            container.addSubviewAt(children[indices[i]], i)/*<--apparently you don't need to remove a view before adding it again, animation-wise it may be better to remove, did get some ghosting on the stroke*///TODO: ideally we would use sortSubviewsUsingFunction. But there are no clear examples of anyone using this method in swift yet. It is possibe though, but will require some research
        }
    }
}
//forward
//backward
//swap
//sort
//sortOn
//sortByList
//toFront<--if you set index to nil in the addSubView method
//toBack
