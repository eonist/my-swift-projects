import Cocoa
/**
 * TODO: make a method with the NSView.sortSubviewsUsingFunction method
 * NOTE: to set position use .point = CGPoint()
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
     * Removes all children in an NSView
     * TODO: rename to removeAll
     * TODO: it could actually be faster to define the number of children first and then just deleting index 0
     * EXAMPLE:
     * view.subviews.forEach({ $0.removeFromSuperview() }) // this gets things done
     * view.subviews.map({ $0.removeFromSuperview() }) // this returns modified array
     */
    static func removeAllChildren(_ view:NSView){
        while(view.subviews.count > 0) {view.subviews[0].removeFromSuperview()}
    }
    /**
     * NOTE: This can also be used as a setSubViewAt method. Apple will reuse the same View so no duplicates. Although apples own sort method is prefered, but it uses c-pointers which can be hard to implement in swift. 
     * NOTE: could also be named insertAt
     * TODO: add a method named prepend that inserts NSView items at the top of the stack
     */
    static func addSubviewAt<T:NSView>(_ view: T,_ subView:T, _ i:Int)->NSView{//Returns the subview for convenience
        if(view.subviews.isEmpty){
            view.addSubview(subView)
        }else if(i == 0){/*the view.subviews.count > 0*/
            view.addSubview(subView, positioned: NSWindow.OrderingMode.below, relativeTo: view.subviews[0])
        }else{/*i > 0 && view.subviews.coun > 0*/
            let relativeView = view.subviews[i-1]
            //Swift.print("relativeView: " + "\(relativeView)")
            view.addSubview(subView, positioned: NSWindow.OrderingMode.above, relativeTo: relativeView)
        }
        return subView
    }
    static func removeSubviewAt(_ view:NSView, _ at:Int){
        if let item = view.subviews[safe:at]{item.removeFromSuperview()}
    }
    /**
     * NOTE: Removes in the backward direction over the array
     */
    static func removeMany(_ views:[NSView]) {//TODO: rename to removeAll(all) ? maybe?
        views.reversed().forEach{$0.removeFromSuperview()}
    }
    /**
     * Beta (not tested, but similar code will work, use pen and paper if it doesnt)
     * NOTE: remove children in a backward direction over the array
     */
    static func removeAllOfType<T>(_ view:NSView, _ type:T.Type) {
        view.subviews.reversed().filter() {$0 as? T != nil}.forEach{$0.removeFromSuperview()}//use map if you want to return removed views in the future
    }
}
//DEPRECATED
extension NSViewModifier{
    /*static func childrenOfType<T>(_ view:NSView, _ type:T.Type)->[T]{
     return NSViewParser.childrenOfType(view,type)
     }*/
    static func removeAll(_ view:NSView){
        removeAllChildren(view)
    }
}
