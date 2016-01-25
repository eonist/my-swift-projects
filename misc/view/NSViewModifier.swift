import Cocoa

class ViewModifier {
    /**
     *
     */
    class func applyColor(view:NSView,_ nsFillColor:NSColor = NSColor.clearColor(),_ nsLineColor:NSColor = NSColor.clearColor(),_ lineWidth:Int = 0){
        let cgFillColor:CGColor = CGColorParser.cgColor(nsFillColor)
        if(nsFillColor != NSColor.clearColor()){/*clearColor: 0.0 white, 0.0 alpha */
            //Swift.print("fill")
            view.layer!.backgroundColor = cgFillColor
            
        }
        let cgLineColor:CGColor = CGColorParser.cgColor(nsLineColor)
        //Swift.print(nsLineColor)
        if(nsLineColor != NSColor.clearColor()){/*clearColor: 0.0 white, 0.0 alpha */
            //Swift.print("line")
            view.layer!.borderColor = cgLineColor
            view.layer!.borderWidth = CGFloat(lineWidth)
        }
    }
    /**
     * Sets the position of an NSView instance
     * TODO: make the same method for size
     */
    class func position(view:NSView,_ point:CGPoint){
        view.frame.origin = point
    }
    /**
     *
     */
    class func removeAll(view:NSView){
        for subView in view.subviews {
            subView.removeFromSuperview()
        }
    }
    /**
     * Removes all children in a Sprite
     * // :TODO: rename to removeAll
     * // :TODO: it could actually be faster to define the number of children first and then just deleting index 0
     * view.subviews.forEach({ $0.removeFromSuperview() }) // this gets things done
     * view.subviews.map({ $0.removeFromSuperview() }) // this returns modified array
     */
    class func removeAllChildren(view:NSView){
        while(view.subviews.count > 0) {(view.subviews[0] as NSView).removeFromSuperview()}
    }
    
}