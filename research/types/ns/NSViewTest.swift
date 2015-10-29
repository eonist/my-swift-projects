//great overview: https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/CocoaViewsGuide/Introduction/Introduction.html
//translucent window: http://stackoverflow.com/questions/24023183/how-can-i-create-yosemite-style-view-with-translucent-blurry-background

/*
Sizes:
 
        Swift.print("NSScreen.mainScreen()!.frame.width: " + "\(NSScreen.mainScreen()!.frame.width)")
        Swift.print("NSScreen.mainScreen()!.frame.height: " + "\(NSScreen.mainScreen()!.frame.height)")
        
        Swift.print("self.frame.size.width: " + "\(self.frame.size.width)")
        Swift.print("self.frame.size.height : " + "\(self.frame.size.height)")//returns the height - the topBar height
        Swift.print("view.frame.size.width: " + "\(view.frame.size.width)")
        Swift.print("view.frame.size.height: " + "\(view.frame.size.height)")

*/

//Setting a bg color of an NSView can be done via drityrect and layers


//good about MOuseEvents in NSView: http://stackoverflow.com/questions/7504917/getting-mouse-down-event-on-superview?rq=1

/*
//this will fill a view with color but stroke needs more research
override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        fillColor.setFill()
         NSRectFill(dirtyRect)
}
*/

//maybe try this:
 /*
    * Draws the background
    */
     /*
    override func drawRect(dirtyRect: NSRect) {
       
        let pathRect = NSInsetRect(self.bounds, 1, 1);
        let path = NSBezierPath(roundedRect:pathRect, xRadius:0, yRadius:0);
        path.lineWidth = 1
        NSColor.whiteColor().setFill();
        NSColor.grayColor().setStroke();
        path.fill()
        path.stroke()
       
        
    }
     */
     
     
     
       
    /* allowsVibrancy is queried when a vibrant appearance is used on a view hierarchy. When allowsVibrancy returns YES, the view will have an appropriate measure taken to ensure it is vibrant on top of its given material.
     
     Specific subclasses, such as NSControl, will answer this question based on the artwork they draw for a given appearance.
     */
   /*
 @available(OSX 10.10, *)
    public var allowsVibrancy: Bool { get }
*/