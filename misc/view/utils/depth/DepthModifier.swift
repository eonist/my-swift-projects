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
        //print("sortByIndices");
        var indicesLen:Int = indices.count
        
        let children:Array<NSView> = NSViewParser.childrenOfType(container, NSView.self)
        
        sortSubviewsUsingFunction({ (v1, v2, context) -> NSComparisonResult in
            let s = Unmanaged<MovieOverviewControl>.fromOpaque(COpaquePointer(context)).takeUnretainedValue()
            switch (v1, v2) {
            case (s.currentTimeLabel, _): return .OrderedDescending
            default: return .OrderedSame
            }
            }, context: UnsafeMutablePointer<Void>(Unmanaged.passUnretained(self).toOpaque()))
        
        //continue here: Figure out how to use sortSubviewsUsingFunction
        
        //for(var i:Int = 0;i < indicesLen;i++) {container.setChildIndex(children[indices[i]], i)}
    }
}
