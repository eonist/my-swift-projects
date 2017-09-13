import Cocoa
/**
 * IMPORTANT: ⚠️️ To understand the relatioship between NSEvent and hitTest: think of NSEvent as going upStream in an inverted pyramid hirarachy and hitTest going downStream in the same hirarachy
 * NOTE: Remember to override the mouseDown method in subclasses if you want to add functionality to the mouseDown action
 * NOTE: Use mouseDragged method if you want to call a method while the mouse is dragged
 * NOTE: If you hi-jack the event handler variable then the parent will not recieve any events. Its better to override onEvent (one could us emany seletors but that would complicate the code. its simple enough to overide onEvent)
 * NOTE: its primary use-case is to wrap NSEvents into Event so that the view hierarchy can retrieve the view where the event came from which is not possible when using NSEvent. NSEvent cant be subclasses so this is the best solution I've found for this particular use-case.
 * CAUTION: ⚠️️ seems to not work as a container for i.e Adding a button to a View instance (for now use FlippedView when using it as a container)
 * TODO: ⚠️️ Make the isChildrenInteractive:Bool -> You may want to make a variable that also can set the isInteractive var of children of the view:
 * IMPORTANT: ⚠️️ you must implement custom hitTest overrides for NSViews added as subViews to this class. 
 */
class InteractiveView:FlippedView,InteractiveViewable{
    /*By default we assign the propegation closure to the event, this event may be overridden in other classes, which leads to the event beeing redirected, we can always assign the default behaviour back */
    lazy var event:EventSendable.CallBack = { (event:Event) in /*returns closure that will take care of propagating the event to the parent*/
        guard let superView:EventSendable = self.superview as? EventSendable else {return}
        superView.onEvent(event)
    }
    var isInteractive:Bool = true/*Toggles the interactive part on and of, Text uses this variable to disable interactivty I.E: TextButton, remember that this effects all descendants as well*/
    private var isMouseOver:Bool = false/*you should hit test this on init*/
    private var hasMouseEntered:Bool = false/*you should hit test this on init*/
    private var hasHandCursor:Bool = false//TODO: ⚠️️ Consider removing this, its clutters up the method, add handCursor flag in subClass when needed
    /*this can probably be removed--->*/override var wantsDefaultClipping:Bool{return false}/*<--yepp remove this, once more UI components are tested*///avoids clipping the view, so dont remove?
    override init(frame frameRect:NSRect) {
        super.init(frame:frameRect)
        self.wantsLayer = true/*if true then view is layer backed*/
        layer = CALayer()/*needs to be layer-hosted so that we don't get clipping of children*/
        layer?.masksToBounds = false/*This is the variable that makes subchildren mask its parents frame, set it to false and they won't mask*/
        layer?.actions = ["sublayers":NSNull(),"content":NSNull(),"onOrderOut":NSNull(),"bounds":NSNull(),"hidden":NSNull(),"position":NSNull()]/*avoids implicit animation*/
        self.layerContentsRedrawPolicy = .onSetNeedsDisplay/*Supposedly this makes anim fast, may or may not have an effect, try diable and enable it from time to time*/
    }
    /**
     * EXAMPLE: override onEvent in a subClass then assert origin === thumb && event.type == ButtonEvent.down 
     */
    func onEvent(_ event:Event){
        self.event(event.setImmediate(self))//the setImmediate attaches the immediate instance to the event.
    }
    /**
     * MouseMove (only fires when the mouse is actualy moving on the visible  part of the view)
     * NOTE: It could be possible to only call this method if a bool value was true. Optimization
     * NOTE: if you override this method in subclasses, then also call the the super of this method to avoid loss of functionality
     * TODO: ⚠️️ When you implement propegation of the mouseMove method, mousemove needs a bool to turn it on or it will flood its parents with calls, isMouseMovable could be used
     */
    func mouseMoved(_ event:MouseEvent){
//        Swift.print("mouseMoved")
        //Swift.print("\(type(of: self))" + "mouseMoved(): event.locationInWindow" + "\(String(describing: event.event!.locationInWindow))")
        guard let parent = self.superview as? InteractiveViewable else {return}
        parent.mouseMoved(event.setImmediate(self).cast())/*informs the parent that an event occured*/
    }
    /**
     * Only fires if the mouse is over the visible part of this view 
     * NOTE: you have to implement a hitTest that aserts that the aPoint is within the path. (either in the CALayer or at the last hitTesable NSView in your stack)
     */
    func mouseOver(_ event:MouseEvent){
//        Swift.print("mouseOver")
        guard let parent = self.superview as? InteractiveViewable else {return}
        parent.mouseOver(event.setImmediate(self).cast())/*informs the parent that an event occured*/
    }
    /**
     * Only fires if the mouse is "rolls" out of the visible part of this view
     */
    func mouseOut(_ event:MouseEvent){
//        Swift.print("mouseOut")
        guard let parent = self.superview as? InteractiveViewable else{return}
        parent.mouseOut(event.setImmediate(self).cast())/*informs the parent that an event occured*/
    }
    /**
     * Same as regular mouseDown event except this also includes the origin
     */
    func mouseDown(_ event:MouseEvent){
        guard let parent = self.superview as? InteractiveViewable else{return}
        parent.mouseDown(event.setImmediate(self).cast())/*informs the parent that an event occured*/
    }
    /**
     * Handles actions and drawing states for the release event.
     * NOTE: bubbling=true was added to make Stepper class dragable
     */
    func mouseUpInside(_ event:MouseEvent){
        guard let parent = self.superview as? InteractiveViewable else {return}
        parent.mouseUpInside(event.setImmediate(self).cast())/*informs the parent that an event occured*/
    }
    /**
     * Handles actions and drawing states for the mouseUpOutside event.
     * NOTE: bubbling = true was added to make Stepper class dragable
     */
    func mouseUpOutside(_ event:MouseEvent){
        guard let parent = self.superview as? InteractiveViewable else {return}
        parent.mouseUpOutside(event.setImmediate(self).cast())/*informs the parent that an event occured*/
    }
    /**
     * This method exists for the sake of convenience
     */
    func mouseUp(_ event:MouseEvent){
        guard let parent = self.superview as? InteractiveViewable else{return}
        parent.mouseUp(event.setImmediate(self).cast())/*informs the parent that an event occured*/
    }
    /**
     * MouseMoved
     * NOTE: there is also mouseDragged, you could forward it to a generic method, and do the same with mouseMoved. so that there wouldnt be duplicate code. since they have the same functionality. you could then use: if(NSEvent.pressedMouseButtons() == 1 << 0){"left is pressed"} to detect if mouse was dragged. or not. Maybe keeping these methods seperatly improves readbility, optimization etc
     * NOTE: mouseMoved doesn't work if the leftmouse button is pressed, then mouseDragged is used instead
     */
    override func mouseMoved(with event:NSEvent) {
//        Swift.print("mouseMoved")
        //Swift.print("\(type(of: self))" + ".mouseMoved(): event.locationInWindow" + "\(event.locationInWindow)")//+ "\(viewUnderMouse)" + " self: " + "\(self)"
        guard hasMouseEntered else {return}/*Only run the following code when inside the actual TrackingArea*/
        if viewUnderMouse === self {//mouse move on the "visible" part of the view
            if !isMouseOver {mouseOver(MouseEvent(event,self));isMouseOver = true}
            mouseMoved(MouseEvent(event,self))
        }
        else if isMouseOver {mouseOut(MouseEvent(event,self));isMouseOver = false}//mouse move on the "invisible" parth of the view
        
    }
    /**
     * Fires when the mouse enters the tracking area, regardless if it is overlapping with other trackingAreas of other views
     * NOTE: if you override this method in subclasses, then also call the the super of this method to avoid loss of functionality
     */
    override func mouseEntered(with event: NSEvent){
//        Swift.print("mouseEntered")
        //Swift.print("\(type(of: self))" + ".mouseEntered(): event.locationInWindow" + "\(event.locationInWindow)")//+ "\(viewUnderMouse)" + " self: " + "\(self)"
        //I'm not sure if the bellow code is perfectly stable in all cases, more testing needed
        guard !hasMouseEntered && viewUnderMouse === self else{ return }
        hasMouseEntered = true/*Optimization*/
        isMouseOver = true
        mouseOver(MouseEvent(event,self))
        /*mouse move on visible view*/
        //super.mouseEntered(event)/*passes on the event to the nextResponder, NSView parents etc*/
    }
    /**
     * Fires when the mouse exits the tracking area, regardless if it is overlapping with other trackingAreas of other views
     * NOTE: if you override this method in subclasses, then also call the the super of this method to avoid loss of functionality
     */
    override func mouseExited(with event: NSEvent){
//        Swift.print("mouseExited")
        //Swift.print("\(type(of: self))" + ".mouseExited: event.locationInWindow: " + "\(event.locationInWindow)")
        
        //⚠️️ I'm not sure if the bellow code is perfectly stable in all cases, more testing needed
        
        guard hasMouseEntered && isMouseOver else {return}
        hasMouseEntered = false/*optimization*/
        isMouseOver = false
        mouseOut(MouseEvent(event,self))
        
        //super.mouseExited(event)/*passes on the event to the nextResponder, NSView parents etc*/
    }
    override func mouseDown(with event: NSEvent) {
        mouseDown(MouseEvent(event,self))
    }
    override func mouseUp(with event:NSEvent) {
        mouseUp(MouseEvent(event,self))/*<--The mouseUp call was moved above the upInside/upOutSide calls because there was a bug when having it bellow the 2 calls, then it was moved bellow again since if it was above it could break the LeverStepper, lets keep it above for now as the LeverStepper problem was a broken track pad problem not this*/
        viewUnderMouse === self ? mouseUpInside(MouseEvent(event,self)) : mouseUpOutside(MouseEvent(event,self))/*if the event was on this button call triggerRelease, else triggerReleaseOutside*/
    }
    /**
     * NOTE: Looping backwards is very important as it's the only way to target the front-most views in the stack
     * NOTE: Why is this needed? because normal hitTesting doesn't work if the frame size is zero. or if a subView is outside the frame.
     */
    override func hitTest(_ aPoint:NSPoint) -> NSView? {
//        Swift.print("hitTest: \(self)")
        //let p = aPoint + CGPoint(-layer!.position.x,layer!.position.y)
        //Swift.print("hitTest() \(type(of: self)) aPoint: " + "\(aPoint) p: \(p) layer!.position: " + "\(layer!.position)")
        guard isInteractive else{return nil/*else (aka not interactive)*/}
        return subviews.reversed().lazy.flatMap{$0.hitTest(aPoint)}.first/*if non-nil then a point was found within its hittable area,if no hitView is found return nil, the parent hitTest will then continue it's search through its siblings etc*/
    }
    /**
     * Enables the hand cursor on enter
     */
    override func resetCursorRects() {
        if hasHandCursor {
            let cursor:NSCursor = NSCursor.pointingHand
            addCursorRect(frame, cursor:cursor)
            cursor.setOnMouseEntered(true)
        }else{super.resetCursorRects()}
    }
    required init(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
