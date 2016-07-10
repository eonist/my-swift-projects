import Cocoa

class WinModifier {
    /**
     * Positions a window to @param position
     */
    class func position(win:NSWindow, _ position:CGPoint){
        win.setFrame(NSRect(position.x,position.y,win.frame.width,win.frame.height), display: true)/*<--unsure what the display var does*/
    }
    /**
     * Aligns a window to an alignment type
     * NOTE: The screen aligns from the bottom up (so use bottom for top and top for bottom)
     */
    class func align(win:NSWindow,_ canvasAlignment:String,_ viewAlignment:String,_ offset:CGPoint = CGPoint(0,0)) {
        let alignmentPoint:CGPoint = Align.alignmentPoint(CGSize(win.frame.width,win.frame.height), CGSize(NSScreen.mainScreen()!.visibleFrame.width,NSScreen.mainScreen()!.visibleFrame.height),canvasAlignment,viewAlignment,offset)
        //Swift.print("ScreenUtils.alignmentPoint: " + "\(alignmentPoint)")
        WinModifier.position(win, alignmentPoint)
    }
}