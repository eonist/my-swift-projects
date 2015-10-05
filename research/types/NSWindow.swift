//borderless window
//http://www.cimgf.com/cocoa-code-snippets/nswindow-snippets/

//fullscrreen: window.setFrame(NSScreen.mainScreen()!.visibleFrame, display: true, animate: true)

//pin to front:  
[self.window makeKeyAndOrderFront:nil];
[self.window setLevel:NSStatusWindowLevel];


//custom window: in objc: http://www.cocoawithlove.com/2008/12/drawing-custom-window-on-mac-os-x.html



//create a win in swift osx: http://stackoverflow.com/questions/24068763/create-a-new-window-with-nswindow


//docs: nswin swift osx: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSWindow_Class/#//apple_ref/occ/instm/NSWindow/initWithContentRect:styleMask:backing:defer:

//test: http://stackoverflow.com/questions/24045339/how-to-use-swift-playground-to-display-nsview-with-some-drawing

import Cocoa
import XCPlayground


  class CustomView: NSView {
    init(frame: NSRect) {
        super.init(frame: frame)

        antibez.moveToPoint(NSPoint(x: 10 , y: 10))
        for i in 0..25
        {
            antibez.lineToPoint(NSPoint(x: 20 + 10 * (25-i), y: 20 + 10 * i))
            antibez.moveToPoint(NSPoint(x: 10 + 10 * (i), y: 10 ))

        }
    }
    override func drawRect(dirtyRect: NSRect) {
        color.setFill()
        NSRectFill(self.bounds)
        antibez.stroke()

    }

    var color = NSColor.greenColor()

    var antibez = NSBezierPath()
  }
  var view = CustomView(frame:
    NSRect(x: 0, y: 0, width: 300, height: 300))

  XCPShowView("chart", view)