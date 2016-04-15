import Cocoa

class DepthModifier {
    /**
     *
     */
    class func sortByList(container:NSView, _ containerFieldName:String, _ sortListFieldName:String, _ sortList:[Dictionary<String,String>]){
        fatalError("not implemented yet")
    }
    /**
     * Arranges children in @param container according to @param indices
     * @Note indices contain an array of indec values that is in a spessific order, so if the first index is 6 that means the instance at depth 6 will now have depth 0
     */
    class func sortByIndices(container:NSView, _ indices:Array<Int>) {
        Swift.print("DepthModifier.sortByIndices()");
        
        let children:Array<NSView> = NSViewParser.childrenOfType(container, NSView.self)
        
        let indicesLen:Int = indices.count
        for(var i:Int = 0;i < indicesLen;i++) {container.addSubviewAt(children[indices[i]], i)}/*<--apparently you don't need to remove a view before adding it again*///TODO: ideally we would use sortSubviewsUsingFunction. But there are no clear examples of anyone using this method in swift yet. It is possibe though, but will require some research
    }
}