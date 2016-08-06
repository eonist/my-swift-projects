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
     * IMPORTANT: The screen aligns from the bottom up (so use bottom for top and top for bottom) (you could fix this, it probably only requires a minus sign herer and there)
     */
    class func align(win:NSWindow,_ canvasAlignment:String,_ viewAlignment:String,_ offset:CGPoint = CGPoint(0,0)) {
        let alignmentPoint:CGPoint = alignPoint(win,canvasAlignment,viewAlignment,offset)
        //Swift.print("ScreenUtils.alignmentPoint: " + "\(alignmentPoint)")
        WinModifier.position(win, alignmentPoint)
    }
    
    /**
     *
     */
    class func alignPoint(win:NSWindow,_ canvasAlignment:String,_ viewAlignment:String,_ offset:CGPoint = CGPoint(0,0))->CGPoint{
        return Align.alignmentPoint(CGSize(win.frame.width,win.frame.height), CGSize(NSScreen.mainScreen()!.visibleFrame.width,NSScreen.mainScreen()!.visibleFrame.height),canvasAlignment,viewAlignment,offset)
    }
}