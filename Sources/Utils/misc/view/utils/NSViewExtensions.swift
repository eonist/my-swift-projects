import Cocoa
//todo rename to convertPointToView etc. dont use the hiTest prefix
extension NSView {
    /**
     * Asserts if locationInWindow is within the NSView frame
     * NOTE: seem to work different if the view isnt flipped (which some arent) try the alternate method with the "fromView" param
     * TODO: upgrade the type with a generic
     */
    func hitTestToView(_ locationInWindow:NSPoint, _ toView:NSView? = nil)->Bool{
        let mousePos:NSPoint = convert(locationInWindow, to: toView)
        /*
        Swift.print("hitTestToView.locationInWindow: " + String(locationInWindow))
        Swift.print("hitTestToView.mousePos(): " + String(mousePos))
        Swift.print("hitTestToView.frame: " + String(frame))
        */
        return NSPointInRect(mousePos, frame)
    }
    /**
     * TODO: upgrade the type with a generic
     */
    func hitTestFromView(_ locationInWindow:NSPoint, _ fromView:NSView? = nil)->Bool{
        let mousePos:NSPoint = convert(locationInWindow, from: fromView)
        /*
        Swift.print("hitTestFromView.locationInWindow: " + String(locationInWindow))
        Swift.print("hitTestFromView.mousePos(): " + String(mousePos))
        Swift.print("hitTestFromView.frame: " + String(frame))
        */
        return NSPointInRect(mousePos, frame)
    }
    /**
     * TODO: upgrade the type with a generic
     */
    func hitTestFromViewRelativeToFrame(_ locationInWindow:NSPoint, _ fromView:NSView? = nil)->Bool{
        let mousePos:NSPoint = convert(locationInWindow, from: fromView)/*converts the mouse pos from a wrongly flipped view to a correctly flipped view*/
        Swift.print("hitTestFromView.locationInWindow: " + String(describing: locationInWindow))
        Swift.print("hitTestFromView.mousePos(): " + String(describing: mousePos))
        Swift.print("hitTestFromView.frame: " + String(describing: frame))
        /**/
        return NSPointInRect(mousePos + frame.origin, frame)
    }
    /**
     * Convenince method that returns the view aswell (by utilising generics)
     */
    func addSubView<T:NSView>(_ view: T)->T{
        self.addSubview(view)
        return view
    }
    /**
     *
     */
    func addSubViewAt<T:NSView>(_ view:T, _ i:Int)->T{
        _ = ViewModifier.addSubviewAt(self, view, i)
        return view
    }
    /**
     * TODO: You can probably deprecated this
     */
    func addSubviewAt<T:NSView>(_ view: T,_ i:Int){
        //Swift.print("\(self.dynamicType)" + ".addSubviewAt() i: " + "\(i)")
        _ = ViewModifier.addSubviewAt(self, view, i)
    }
    /**
     * TODO: Probably upgrade this to use Generics and deprecate it
     */
    func removeSubviewAt(_ i:Int){
        ViewModifier.removeSubviewAt(self, i)
    }
    /**
     * Asserts if @param view is a subView of @param parent
     */
    func contains<T:NSView>(_ view:T)->Bool{
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
        return self.convert((window?.mouseLocationOutsideOfEventStream)!,from:nil)
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
    func indexOf<T:NSView>(_ subView:T)->Int{
        return NSViewParser.indexOf(self, subView)
    }
    /**
     * Returns a localPoint (UNTESTED)
     */
    func globalToLocal(_ p:CGPoint) -> CGPoint{
        return convert(p, from:self)//Swift 3
    }
    /**
     * Returns a globalPoint (UNTESTED)
     */
    func localToGlobal(_ p:CGPoint) -> CGPoint{
        return convert(p, to:self)//Swift 3
    }
    var mouseX:CGFloat{return MouseUtils.point(self).x}/*UNTESTED*/
    var mouseY:CGFloat{return MouseUtils.point(self).y}/*UNTESTED*/
    //swift 3 update: The compiler complaints if the values x,y are used, you could try to use upper-case X and Y?!?, or implement x,y in classes such as BaseGraphic and IElement etc
    var X:CGFloat{get{return frame.origin.x}set{frame.origin.x = newValue}}
    var Y:CGFloat{get{return frame.origin.y}set{frame.origin.y = newValue}}
    var w:CGFloat{get{return frame.width}set{frame.width = newValue}}//aperantly .width is used too may places, you need to refactor it out first, same with height
    var h:CGFloat{get{return frame.height}set{frame.height = newValue}}
    var idx:Int {return self.superview!.indexOf(self)}/*returns the index of a nsview*/
    /**
     * DEPRECATED
     */
    func getSubviewAt(_ i:Int)->NSView{return NSViewParser.getSubviewAt(self, i)}//favour getSubViewAt method instead, as its optional
    func getSubViewAt(_ i:Int)->NSView?{return NSViewParser.getSubViewAt(self, i)}
    var numSubViews:Int {return subviews.count}/*convenience*/
}
