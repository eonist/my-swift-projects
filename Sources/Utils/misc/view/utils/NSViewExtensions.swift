import Cocoa
//todo rename to convertPointToView etc. dont use the hiTest prefix
extension NSView {
    /**
     * Convenince method that returns the view aswell (by utilising generics)
     */
    func addSubView<T:NSView>(_ view: T)->T{
        self.addSubview(view)
        return view
    }
    func addSubViewAt<T:NSView>(_ view:T, _ i:Int)->T{
        _ = NSViewModifier.addSubviewAt(self, view, i)
        return view
    }
    /**
     * TODO: ⚠️️ You can probably deprecated this
     */
    func addSubviewAt<T:NSView>(_ view: T,_ i:Int){
        _ = NSViewModifier.addSubviewAt(self, view, i)
    }
    /**
     * TODO: Probably upgrade this to use Generics and deprecate it
     */
    func removeSubviewAt(_ i:Int){
        NSViewModifier.removeSubviewAt(self, i)
    }
    /**
     * Asserts if PARAM: view is a subView of PARAM: parent
     */
    func contains<T:NSView>(_ view:T)->Bool{
        return NSViewAsserter.contains(self, view)
    }
    /**
     * Returns index of a subView, returns -1 if nothing is found
     * TODO: ⚠️️ use Int? instead of -1 and rename to index
     */
    func indexOf<T:NSView>(_ subView:T)->Int{
        return NSViewParser.indexOf(self, subView)
    }
    /*you can't have setPoint() as  a method by having this variable here, something to keep in mind*///pos is occupied by another class
    //var point:CGPoint {get{return frame.origin} set{frame.origin = newValue}}
    //@objc var size:CGSize {get{return frame.size}set{frame.size = newValue}}//new,convenience
    /**
     * Returns localPosition in a view (converts a global position to a local position)
     * TODO: ⚠️️ hopefully this method also works if the view is not 0,0 in the window
     * Returns the local mouse position in the views coordinate system 0,0
     * NOTE: can also be used on window.content.localPos to get the pos in a a window
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
     * Returns a localPoint (UNTESTED)
     */
    func globalToLocal(_ p:CGPoint) -> CGPoint{
        return convert(p, from:self)
    }
    /**
     * Returns a globalPoint (UNTESTED)
     */
    func localToGlobal(_ p:CGPoint) -> CGPoint{
        return convert(p, to:self)
    }
    /**
     * New
     * NOTE: convert(p,nil) usualy converts flipped geometry, but when using layer.position it wont work
     */
    func flipY(_ p:CGPoint)->CGPoint{
        return CGPoint(p.x, WinParser.height(window!) - p.y)/*flips the window y coordinates*/
    }
    /**
     * New
     * Converts global p to local p
     */
    func globToLoc(_ p:CGPoint)->CGPoint{
        let flippedPoint = flipY(p)
        let offset = globalPos()
        let localPoint = flippedPoint - offset
        return localPoint
    }
    /**
     * New
     * Returns the globalPoint of the self.frame.origin (where is this view in the POV of 0,0 of the upper most view)
     */
    func globalPos()->CGPoint{
        var offset:CGPoint = CGPoint()
        var parent:NSView? = self.superview
        while parent?.superview != nil {
            offset += parent!.layer!.position
            parent = parent?.superview
        }
        return offset
    }
    func hasParent(_ parent:NSView?)->Bool{/*Convenience*/
        return NSViewAsserter.hasParent(self, parent)
    }
    var mouseX:CGFloat{return MouseUtils.point(self).x}/*UNTESTED*/
    var mouseY:CGFloat{return MouseUtils.point(self).y}/*UNTESTED*/
    //swift 3 update: The compiler complaints if the values x,y are used, you could try to use upper-case X and Y?!?, or implement x,y in classes such as BaseGraphic and IElement etc
    var X:CGFloat{get{return frame.origin.x}set{frame.origin.x = newValue}}
    var Y:CGFloat{get{return frame.origin.y}set{frame.origin.y = newValue}}
    var w:CGFloat{get{return frame.width}set{frame.w = newValue}}//aperantly .width is used too may places, you need to refactor it out first, same with height
    var h:CGFloat{get{return frame.height}set{frame.h = newValue}}
    var idx:Int {return self.superview!.indexOf(self)}/*returns the index of a nsview*/
    /**
     * DEPRECATED
     */
    //func getSubviewAt(_ i:Int)->NSView{return NSViewParser.getSubViewAt(self, i)}//favour getSubViewAt method instead, as its optional
    func getSubViewAt(_ i:Int)->NSView?{return NSViewParser.getSubViewAt(self, i)}
    var numSubViews:Int {return subviews.count}/*convenience*/
    
}
//⚠️️ These won't work since swift 3 i think, use .w and .h instead (aperantly .width is used too may places, you need to refactor it out first, same with height)
//var width:CGFloat{return frame.width}//TODO:implement later
//var height:CGFloat{return frame.height}

/**
 * Disable implicit animation
 * TODO: ⚠️️ Figure out how to disaple auto anim in NSViews i think it's: layer.actions = ["sublayers":NSNull()] see:https://stackoverflow.com/questions/5833488/how-to-disable-calayer-implicit-animations/43560444#43560444   and:  https://stackoverflow.com/questions/2244147/disabling-implicit-animations-in-calayer-setneedsdisplayinrect?rq=1
 * EXAMPLE: disableAnim{view.isHidden = true}//Default animation is now disabled, Basically whatever you put inside the closure is not animated
 */
func disableAnim(_ closure:()->Void){
    CATransaction.begin()
    CATransaction.setDisableActions(true)
    closure()
    CATransaction.commit()
}


