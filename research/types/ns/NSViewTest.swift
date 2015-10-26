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