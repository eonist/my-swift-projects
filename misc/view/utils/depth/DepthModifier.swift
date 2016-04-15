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
    class func sortByIndices(container:NSView, indices:Array<Int>) {
        //			trace("sortByIndices");
        var indicesLen:Int = indices.count
        var children:Array = DisplayObjectParser.children(container);
        for(var i:int = 0;i < indicesLen;i++) container.setChildIndex(children[indices[i]], i);
    }
}
