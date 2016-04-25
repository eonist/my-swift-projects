import Cocoa
//todo rename to convertPointToView etc. dont use the hiTest prefix
extension NSView {
    /**
     * Asserts if locationInWindow is within the NSView frame
     * NOTE: seem to work different if the view isnt flipped (which some arent) try the alternate method with the "fromView" param
     */
    func hitTestToView(locationInWindow:NSPoint, _ toView:NSView? = nil)->Bool{
        let mousePos:NSPoint = convertPoint(locationInWindow, toView: toView)
        /*
        Swift.print("hitTestToView.locationInWindow: " + String(locationInWindow))
        Swift.print("hitTestToView.mousePos(): " + String(mousePos))
        Swift.print("hitTestToView.frame: " + String(frame))
        */
        return NSPointInRect(mousePos, frame)
    }
    func hitTestFromView(locationInWindow:NSPoint, _ fromView:NSView? = nil)->Bool{
        let mousePos:NSPoint = convertPoint(locationInWindow, fromView: fromView)
        /*
        Swift.print("hitTestFromView.locationInWindow: " + String(locationInWindow))
        Swift.print("hitTestFromView.mousePos(): " + String(mousePos))
        Swift.print("hitTestFromView.frame: " + String(frame))
        */
        return NSPointInRect(mousePos, frame)
    }
    func hitTestFromViewRelativeToFrame(locationInWindow:NSPoint, _ fromView:NSView? = nil)->Bool{
        let mousePos:NSPoint = convertPoint(locationInWindow, fromView: fromView)/*converts the mouse pos from a wrongly flipped view to a correctly flipped view*/
        
        Swift.print("hitTestFromView.locationInWindow: " + String(locationInWindow))
        Swift.print("hitTestFromView.mousePos(): " + String(mousePos))
        Swift.print("hitTestFromView.frame: " + String(frame))
        /**/
        return NSPointInRect(mousePos + frame.origin, frame)
    }
    /**
     * Convenince method that returns the view aswell (by utilising generics)
     */
    func addSubView<T>(view: T)->T{
        self.addSubview(view as! NSView)
        return view
    }
    /**
     *
     */
    func addSubViewAt<T>(view:T, _ i:Int)->T{
        ViewModifier.addSubviewAt(self, view as! NSView, i)
        return view
    }
    /**
     * TODO: You can probably deprecated this
     */
    func addSubviewAt(view: NSView,_ i:Int){
        //Swift.print("\(self.dynamicType)" + ".addSubviewAt() i: " + "\(i)")
        ViewModifier.addSubviewAt(self, view, i)
    }
    /**
     * TODO: Probably upgrade this to use Generics and deprecate it
     */
    func removeSubviewAt(i:Int){
        ViewModifier.removeSubviewAt(self, i)
    }
    /**
     * Asserts if @param view is a subView of @param parent
     */
    func contains(view:NSView)->Bool{
        return NSViewAsserter.contains(self, view)
    }
    var point:CGPoint {get{return frame.origin} set{frame.origin = newValue}}/*you cant have setPoint() as  a method by having this variable here, something to keep in mind*///pos is occupied by another class
    
    //var width:CGFloat{return frame.width}//TODO:implement later
    //var height:CGFloat{return frame.height}
    /**
     * Returns localPosition in a view (converts a global position to a local position)
     * TODO: hopefully this method also works if the view is not 0,0 in the window
     */
    /**
     * Returns the local mouse position in the views coordinate system 0,0
     */
    func localPos()->CGPoint{
        return self.convertPoint((window?.mouseLocationOutsideOfEventStream)!,fromView:nil)
    }
    /**
     * IMPORTANT: You may need to y-flip this point
     */
    func globalPoint()->CGPoint{
        return (window?.mouseLocationOutsideOfEventStream)!
    }
    /**
     *
     */
    func indexOf(subView:NSView)->Int{
        return NSViewParser.indexOf(self, subView)
    }
    /**
     * DEPRECATED
     */
    func getSubviewAt(i:Int)->NSView{
        //favour getSubViewAt method instead, as its optional
        return NSViewParser.getSubviewAt(self, i)
    }
    func getSubViewAt(i:Int)->NSView?{
        return NSViewParser.getSubViewAt(self, i)
    }
    var numSubViews:Int {return subviews.count}/*convenience*/
    
    var w:CGFloat{get{return frame.width}set{frame.width = newValue}}//aperantly .width is used too may places, yu need to refactor it out first, same with height
    var h:CGFloat{get{return frame.height}set{frame.height = newValue}}
    var x:CGFloat{get{return frame.origin.x}set{frame.origin.x = newValue}}
    var y:CGFloat{get{return frame.origin.y}set{frame.origin.y = newValue}}
}
