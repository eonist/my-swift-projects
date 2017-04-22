import Cocoa
typealias ViewModifier = NSViewModifier//<---Legacy support
/**
 * TODO: make a method with the NSView.sortSubviewsUsingFunction method. 
 */
class NSViewModifier {
    static func applyColor(_ view:NSView,_ nsFillColor:NSColor = NSColor.clear,_ nsLineColor:NSColor = NSColor.clear,_ lineWidth:Int = 0){
        let cgFillColor:CGColor = CGColorParser.cgColor(nsFillColor)
        if(nsFillColor != NSColor.clear){/*clearColor: 0.0 white, 0.0 alpha */
            view.layer!.backgroundColor = cgFillColor
        }
        let cgLineColor:CGColor = CGColorParser.cgColor(nsLineColor)
        if(nsLineColor != NSColor.clear){/*clearColor: 0.0 white, 0.0 alpha */
            view.layer!.borderColor = cgLineColor
            view.layer!.borderWidth = CGFloat(lineWidth)
        }
    }
    /**
     * Sets the position of an NSView instance
     * TODO: make the same method for size
     */
    static func position(_ view:NSView,_ point:CGPoint){
        view.frame.origin = point
    }
    static func removeAll(_ view:NSView){
        for subView in view.subviews {subView.removeFromSuperview()}
    }
    /**
     * Removes all children in an NSView
     * TODO: rename to removeAll
     * TODO: it could actually be faster to define the number of children first and then just deleting index 0
     * EXAMPLE:
     * view.subviews.forEach({ $0.removeFromSuperview() }) // this gets things done
     * view.subviews.map({ $0.removeFromSuperview() }) // this returns modified array
     */
    static func removeAllChildren(_ view:NSView){
        while(view.subviews.count > 0) {(view.subviews[0] as NSView).removeFromSuperview()}
    }
    /**
     * NOTE: This can also be used as a setSubViewAt method. Apple will reuse the same View so no duplicates. Although apples own sort method is prefered, but it uses c-pointers which can be hard to implement in swift. 
     * NOTE: could also be named insertAt
     * TODO: add a method named prepend that inserts NSView items at the top of the stack
     */
    static func addSubviewAt<T:NSView>(_ view: T,_ subView:T, _ i:Int)->NSView{//Returns the subview for convenience
        if(view.subviews.count == 0){
            view.addSubview(subView)
        }else if(i == 0){/*the view.subviews.count > 0*/
            view.addSubview(subView, positioned: NSWindowOrderingMode.below, relativeTo: view.getSubviewAt(0))
        }else{/*i > 0 && view.subviews.coun > 0*/
            let relativeView = view.getSubviewAt(i-1)
            //Swift.print("relativeView: " + "\(relativeView)")
            view.addSubview(subView, positioned: NSWindowOrderingMode.above, relativeTo: relativeView)
        }
        return subView
    }
    static func removeSubviewAt(_ view:NSView, _ i:Int){
        let item = view.getSubviewAt(i)
        item.removeFromSuperview()
    }
    /**
     * NOTE: removes in the backward direction over the array
     */
    static func removeMany(_ views:[NSView]) {//TODO: rename to removeAll(all) ? maybe?
        for i in (0..<views.count).reversed(){//upgraded to swift 3
            let view : NSView = views[i]
            view.removeFromSuperview()
        }
    }
    /**
     * Rename to subViewsOfType
     */
    static func childrenOfType<T>(_ view:NSView, _ type:T.Type)->[T]{
        var children:[T] = []
        for subView in view.subviews {
            if(subView as? T != nil){children.append(subView as! T)}
        }
        return children
    }
    /**
     * Beta (not tested, but similar code will work, use pen and paper if it doesnt)
     * NOTE: remove children in a backward direction over the array
     */
    static func removeAllOfType<T>(_ view:NSView, _ type:T.Type) {
        for i in (0..<view.subviews.count).reversed() {//<--recently upgraded to swift 3 loop syntax
            if(view.subviews[i] as? T != nil) {
                view.subviews[i].removeFromSuperview()
            }
        }
    }
}
