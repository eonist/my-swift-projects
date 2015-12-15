import Foundation

import Cocoa
/**
 * TODO: Make the isChildrenInteractive:Bool -> You may want to make a variable that also can set the isInteractive var of children of the view:
 * CAUTION: seems to not work as a container for i.e Adding a button to a View instance (for now use FlippedView when using it as a container)
 */
class InteractiveView:FlippedView{

    
    var isInteractive:Bool = true//why is this here?
    var hasHandCursor:Bool = false
    override var wantsDefaultClipping:Bool{return false}//avoids clipping the view
    override var wantsUpdateLayer:Bool{return false;}
    override init(frame:NSRect) {
        super.init(frame:frame)
        self.wantsLayer = true//setting this to false avoids calling drawLayer() and enables drawingRect()
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
   
    
    /**
     * Avoids covering the graphic behind when dealing with mouse down events
     * NOTE: the hitTestToView method makes sure the the mouseDown call isnt called if the mouseEvent.location is outside the view.frame
     */
    override func hitTest(aPoint: NSPoint) -> NSView? {
        Swift.print("View.hitTest(): " + String(aPoint))
        Swift.print("View.hitTestToView() " + String(hitTestToView(aPoint,self)))
        return isInteractive && hitTestToView(aPoint,self) ? self : nil
    }
    /**
     * Enables the hand cursor on enter
     */
    override func resetCursorRects() {
        if(hasHandCursor){
            let cursor:NSCursor = NSCursor.pointingHandCursor()
            addCursorRect(frame, cursor: cursor)
            cursor.setOnMouseEntered(true)
        }else{
            super.resetCursorRects()
        }
    }
    override func mouseDown(theEvent: NSEvent) {
        var pos = (window?.mouseLocationOutsideOfEventStream)!//convertPoint((window?.mouseLocationOutsideOfEventStream)!, fromView: nil)/*converts the p to local coordinates*/
        pos.y = window!.frame.height - pos.y
        
        
        //Swift.print(pos)
        Swift.print("mouseDOwn start")
        hitTest(pos)
        Swift.print("mouseDOwn end")
    }
}
