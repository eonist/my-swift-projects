//borderless window
//http://www.cimgf.com/cocoa-code-snippets/nswindow-snippets/

//fullscrreen: window.setFrame(NSScreen.mainScreen()!.visibleFrame, display: true, animate: true)

//pin to front: 
/*
[self.window makeKeyAndOrderFront:nil];
[self.window setLevel:NSStatusWindowLevel];
*/

//custom window: in objc: http://www.cocoawithlove.com/2008/12/drawing-custom-window-on-mac-os-x.html

//docs: nswin swift osx: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSWindow_Class/#//apple_ref/occ/instm/NSWindow/initWithContentRect:styleMask:backing:defer:

//test: http://stackoverflow.com/questions/24045339/how-to-use-swift-playground-to-display-nsview-with-some-drawing


//http://practicalswift.com/2014/06/27/a-minimal-webkit-browser-in-30-lines-of-swift/

 //really good: http://objc.toodarkpark.net/AppKit/Classes/NSWindow.html
 
 /*
 Not all windows are suitable for acting as the key or main window. 
 For example, a window that merely displays information, and contains no objects that need to respond to events or action messages, can completely forgo ever becoming the key window. Similarly, a window that acts as a floating palette of items that are only dragged out by mouse actions never needs to be the key window. Such a window can be defined as a subclass of NSWindow that overrides the methods canBecomeKeyWindow and canBecomeMainWindow to return NO instead of the default of YES. Defining a window in this way prevents it from ever becoming the key or main window. Though NSWindow defines these methods, typically only subclasses of NSPanel refuse to accept key or main window status.
 */

import Cocoa

func test(){
    let mywindow = NSWindow()
    let textView = NSTextView()
    let textField = NSTextField()
    textField.stringValue = "Some string"
    textView.frame = CGRectMake(10,20,50,400)
    mywindow.contentView!.addSubview(textView)
    
}

 
 //http://stackoverflow.com/questions/24224886/correct-way-to-create-nswindow-using-swift-and-cocoa
 
 //http://stackoverflow.com/questions/28031732/create-programmatically-nswindow-in-swift
 
 
 //vim http://stackoverflow.com/questions/24068763/create-a-new-window-with-nswindow
 
 
 
 
 //edit design properties of a window: 
 //window?.backgroundColor = NSColor.clearColor();
//window?.opaque = false


//apple help: https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/WinPanel/Tasks/SizingPlacingWindows.html
//aplle refs: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSWindow_Class/index.html#//apple_ref/occ/instm/NSWindow/setTitle:

//round borderless,titleless, etc interface window: https://developer.apple.com/library/mac/samplecode/RoundTransparentWindow/Introduction/Intro.html

//borderless window
//http://www.cimgf.com/cocoa-code-snippets/nswindow-snippets/

//fullscrreen: window.setFrame(NSScreen.mainScreen()!.visibleFrame, display: true, animate: true)

//pin to front:
/*
[self.window makeKeyAndOrderFront:nil];
[self.window setLevel:NSStatusWindowLevel];
*/

//custom window: in objc: http://www.cocoawithlove.com/2008/12/drawing-custom-window-on-mac-os-x.html


//docs: nswin swift osx: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSWindow_Class/#//apple_ref/occ/instm/NSWindow/initWithContentRect:styleMask:backing:defer:




        