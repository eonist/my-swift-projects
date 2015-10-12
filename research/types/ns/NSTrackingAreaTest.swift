//apple docs: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/NSTrackingArea_class/#//apple_ref/c/tdef/NSTrackingAreaOptions
import AppKit
/*
struct NSTrackingAreaOptions : OptionSetType {
    init(rawValue rawValue: UInt)
    static var MouseEnteredAndExited: NSTrackingAreaOptions { get }
    static var MouseMoved: NSTrackingAreaOptions { get }
    static var CursorUpdate: NSTrackingAreaOptions { get }
    static var ActiveWhenFirstResponder: NSTrackingAreaOptions { get }
    static var ActiveInKeyWindow: NSTrackingAreaOptions { get }
    static var ActiveInActiveApp: NSTrackingAreaOptions { get }
    static var ActiveAlways: NSTrackingAreaOptions { get }
    static var AssumeInside: NSTrackingAreaOptions { get }
    static var InVisibleRect: NSTrackingAreaOptions { get }
    static var EnabledDuringMouseDrag: NSTrackingAreaOptions { get }
}
*/



/*
 * this may be for ios only:
 */
//In viewDidMove, define an NSTrackingArea to track mouse events and add it to the view

/*

let options = NSTrackingAreaOptions.MouseMoved | NSTrackingAreaOptions.ActiveInKeyWindow
let trackingArea = NSTrackingArea(rect:view.frame,options:options,owner:self,userInfo:nil)
view.addTrackingArea(trackingArea)

//Declare a sprite and add it to the scene for testing purposes
let sprite = SKSpriteNode(imageNamed:"Spaceship")
sprite.name = "sprite"
sprite.position = CGPointMake(CGRectGetMidX(view.frame), CGRectGetMidY(view.frame));
sprite.setScale(0.5)
self.addChild(sprite)

*/


//Override the mouseMoved method
/*
override func mouseMoved(event: NSEvent) {
    // Get mouse position in scene coordinates
    let location = event.locationInNode(self)
    // Get node at mouse position
    let node = self.nodeAtPoint(location)
    if (node.name == "sprite") {
        let sprite = node as SKSpriteNode
        sprite.colorBlendFactor = 1.0
        sprite.color = SKColor.greenColor()
    }
}
*/